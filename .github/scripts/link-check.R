#!/usr/bin/env Rscript
# =============================================================================
# Standalone hyperlink audit for a built course — base R only, no packages.
#
# VENDORED from compileCourses::checkCourseLinks() so the link-check CI job
# needs no engine install. Keep in sync with
#   compileCourses/R/compileCourses.R  (the `checkCourseLinks` block)
# if the checker logic changes. For local/interactive use prefer the engine's
# compileCourses::checkCourseLinks(); this copy exists purely for CI.
#
# Usage:  Rscript .github/scripts/link-check.R [courseFolder]
#   courseFolder     directory of built HTML to scan (default "docs")
#   env LINK_CHECK_REMOTE  "false" to skip http(s) reachability (default true)
#
# Scans every .html under courseFolder and classifies each link PASS/FAIL/
# SKIPPED (local file + #anchor targets resolved on disk; http(s) probed with
# base curlGetHeaders(); revealjs nav fragments not validated). Writes
# link-check-report.tsv (failures first) beside courseFolder, warns per broken
# link, and under GitHub Actions emits ::warning annotations. Never stops.
# =============================================================================

# Read a file as one UTF-8 string; "" on failure (never throws).
.slurp <- function(path) {
  tryCatch(paste(readLines(path, warn = FALSE, encoding = "UTF-8"), collapse = "\n"),
           error = function(e) "")
}

# Drop <script>/<style> bodies and HTML comments before link extraction. With
# `embed-resources` Quarto inlines reveal.js/jQuery/nav JS, which build hrefs by
# string concatenation (`href="#" + id`), so scanning raw text mines the code
# for garbage "links". We only want hrefs/ids that live in real markup.
.stripCode <- function(txt) {
  txt <- gsub("(?is)<script\\b.*?</script>", " ", txt, perl = TRUE)
  txt <- gsub("(?is)<style\\b.*?</style>",   " ", txt, perl = TRUE)
  gsub("(?s)<!--.*?-->", " ", txt, perl = TRUE)
}

# All capture-group-1 matches of a perl regex in one string.
.matchGroup1 <- function(txt, pattern) {
  hits <- regmatches(txt, gregexpr(pattern, txt, perl = TRUE, ignore.case = TRUE))[[1]]
  if (!length(hits)) return(character(0))
  sub(pattern, "\\1", hits, perl = TRUE, ignore.case = TRUE)
}

# Hrefs from anchors/links. The lookbehind drops `xlink:href` / `data-href` so
# the inlined SVG internal refs that embed-resources produces are not mistaken
# for page links.
.extractHrefs <- function(txt) {
  unique(c(.matchGroup1(txt, '(?<![-:\\w])href\\s*=\\s*"([^"]*)"'),
           .matchGroup1(txt, "(?<![-:\\w])href\\s*=\\s*'([^']*)'")))
}

# Fragment targets a document offers: id="..." / name="...".
.extractIds <- function(txt) {
  unique(c(.matchGroup1(txt, 'id\\s*=\\s*"([^"]*)"'),
           .matchGroup1(txt, "id\\s*=\\s*'([^']*)'"),
           .matchGroup1(txt, 'name\\s*=\\s*"([^"]*)"'),
           .matchGroup1(txt, "name\\s*=\\s*'([^']*)'")))
}

# revealjs decks carry many auto-generated navigation fragments (#/3, controls);
# their anchors are not validated (only file existence + remote links are).
.isRevealDeck <- function(txt) grepl('class="reveal"|reveal\\.js', txt)

# Minimal URL host/segment split (base only; no URL parser needed).
.urlHost <- function(url) tolower(sub("^[a-z]+://([^/]+).*$", "\\1", url, ignore.case = TRUE))
.urlSegs <- function(url) {
  p <- sub("[?#].*$", "", sub("^[a-z]+://[^/]+", "", url, ignore.case = TRUE))
  Filter(nzchar, strsplit(p, "/", fixed = TRUE)[[1]])
}

# Is the `gh` CLI available? (Preinstalled on GitHub-hosted runners.)
.hasGh <- function() nzchar(Sys.which("gh"))

# Best-effort remote reachability, cached per run; 2xx/3xx = ok.
#  * github.com links are verified through the AUTHENTICATED GitHub API via the
#    `gh` CLI (a private repo/user is invisible to an unauthenticated web HEAD,
#    but the token can see it). The web path maps to `repos/{o}/{r}` (>=2 path
#    segments) or `users/{name}` (1 segment); a missing repo/user still 404s, so
#    a genuinely dead link is still caught. `gh` reads its own token from the
#    environment (GH_TOKEN / GITHUB_TOKEN) and only ever contacts GitHub. Falls
#    back to an unauthenticated probe if `gh` is not installed.
#  * everything else uses base libcurl with no credentials.
# Never throws.
.remoteStatus <- function(url, cache, timeout = 10L) {
  if (!is.null(cache[[url]])) return(cache[[url]])
  res <- tryCatch({
    if (.urlHost(url) %in% c("github.com", "www.github.com") && .hasGh()) {
      segs <- .urlSegs(url)
      api  <- if (length(segs) >= 2L) sprintf("repos/%s/%s", segs[1], sub("\\.git$", "", segs[2]))
              else if (length(segs) == 1L) sprintf("users/%s", segs[1])
              else "rate_limit"
      st <- suppressWarnings(system2("gh", c("api", api, "--silent"),
                                     stdout = FALSE, stderr = FALSE, timeout = timeout))
      ok <- identical(as.integer(st), 0L)
      list(ok = ok, detail = if (ok) "GitHub API ok" else "GitHub API not found/unreachable")
    } else {
      args <- list(url = url, redirect = TRUE, verify = TRUE)
      if ("timeout" %in% names(formals(curlGetHeaders))) args$timeout <- timeout
      st <- attr(do.call(curlGetHeaders, args), "status")
      if (is.null(st)) st <- NA_integer_
      list(ok = !is.na(st) && st >= 200 && st < 400, detail = paste("HTTP", st))
    }
  }, error = function(e) list(ok = FALSE, detail = conditionMessage(e)))
  cache[[url]] <- res
  res
}

# Truncate a long href (e.g. an inlined data: URI) so the audit stays readable.
.short <- function(s, n = 200L) ifelse(nchar(s) > n, paste0(substr(s, 1L, n), "..."), s)

# Inspect every .html under courseRoot; return a data.frame
# (file, href, type, status, detail), status PASS/FAIL/SKIPPED.
.scanCourseLinks <- function(courseRoot, checkRemote = TRUE, timeout = 10L) {
  empty <- data.frame(file = character(), href = character(), type = character(),
                      status = character(), detail = character(), stringsAsFactors = FALSE)
  courseRoot <- normalizePath(courseRoot, winslash = "/", mustWork = FALSE)
  htmlFiles <- list.files(courseRoot, pattern = "\\.html$", recursive = TRUE, full.names = TRUE)
  if (!length(htmlFiles)) return(empty)

  idCache     <- new.env(parent = emptyenv())
  remoteCache <- new.env(parent = emptyenv())
  getIds <- function(path) {
    key <- normalizePath(path, winslash = "/", mustWork = FALSE)
    if (is.null(idCache[[key]])) idCache[[key]] <- .extractIds(.stripCode(.slurp(path)))
    idCache[[key]]
  }

  rows <- list()
  rec <- function(file, href, type, status, detail = "")
    rows[[length(rows) + 1L]] <<- data.frame(
      file = file, href = .short(href), type = type, status = status,
      detail = trimws(gsub("[[:space:]]+", " ", detail)), stringsAsFactors = FALSE)

  for (hf in htmlFiles) {
    rel    <- substring(normalizePath(hf, winslash = "/", mustWork = FALSE),
                        nchar(courseRoot) + 2L)
    txt    <- .stripCode(.slurp(hf))
    reveal <- .isRevealDeck(txt)

    for (href in .extractHrefs(txt)) {
      h <- trimws(href)
      if (!nzchar(h)) next
      if (grepl("^(data:|javascript:)", h, ignore.case = TRUE)) next
      if (grepl("^(mailto:|tel:)", h, ignore.case = TRUE)) {
        rec(rel, h, "other", "SKIPPED", "not auto-checkable"); next
      }

      if (grepl("^(https?:)?//", h, ignore.case = TRUE)) {
        if (!checkRemote) { rec(rel, h, "remote", "SKIPPED", "remote check disabled"); next }
        url <- if (grepl("^//", h)) paste0("https:", h) else h
        r <- .remoteStatus(url, remoteCache, timeout)
        rec(rel, h, "remote", if (r$ok) "PASS" else "FAIL", r$detail)
        next
      }

      filePart <- h; frag <- NA_character_
      if (grepl("#", h, fixed = TRUE)) {
        parts    <- strsplit(h, "#", fixed = TRUE)[[1]]
        filePart <- parts[1]
        frag     <- if (length(parts) > 1L) paste(parts[-1], collapse = "#") else ""
      }
      type <- if (is.na(frag)) "local" else "anchor"

      targetHtml <- hf
      if (nzchar(filePart)) {
        target <- file.path(dirname(hf), utils::URLdecode(filePart))
        if (!file.exists(target)) { rec(rel, h, type, "FAIL", "target file not found"); next }
        targetHtml <- target
      }

      if (is.na(frag) || !nzchar(frag) || grepl("^/", frag)) {
        rec(rel, h, type, "PASS", "ok"); next
      }

      targetIsReveal <- if (identical(targetHtml, hf)) reveal else .isRevealDeck(.slurp(targetHtml))
      if (reveal || targetIsReveal || !grepl("\\.html$", targetHtml, ignore.case = TRUE)) {
        rec(rel, h, type, "PASS", "anchor not validated (reveal/non-html)"); next
      }
      if (frag %in% getIds(targetHtml)) rec(rel, h, type, "PASS", "ok")
      else                              rec(rel, h, type, "FAIL", paste0("missing #", frag))
    }
  }

  if (!length(rows)) return(empty)
  do.call(rbind, rows)
}

# Public entry: scan, sort failures first, write the TSV audit, warn + annotate.
checkCourseLinks <- function(courseFolder = "docs", checkRemote = TRUE,
                             reportFile = NULL, timeout = 10L) {
  root <- normalizePath(courseFolder, winslash = "/", mustWork = FALSE)
  if (is.null(reportFile)) reportFile <- file.path(dirname(root), "link-check-report.tsv")

  audit <- .scanCourseLinks(courseFolder, checkRemote = checkRemote, timeout = timeout)
  if (!nrow(audit)) {
    message("Link check: no links found under ", courseFolder)
    return(invisible(audit))
  }

  audit <- audit[order(match(audit$status, c("FAIL", "PASS", "SKIPPED")),
                       audit$file, audit$href), , drop = FALSE]
  utils::write.table(audit, reportFile, sep = "\t", row.names = FALSE, quote = FALSE)

  fails     <- audit[audit$status == "FAIL", , drop = FALSE]
  ghActions <- tolower(Sys.getenv("GITHUB_ACTIONS")) == "true"
  for (i in seq_len(nrow(fails))) {
    msg <- sprintf("Broken %s link in %s: %s (%s)",
                   fails$type[i], fails$file[i], fails$href[i], fails$detail[i])
    if (ghActions)
      cat(sprintf("::warning file=%s::%s\n", file.path(basename(root), fails$file[i]), msg))
    warning(msg, call. = FALSE)
  }
  message(sprintf("Link check: %d link(s) — %d failed, %d passed, %d skipped; report at %s",
                  nrow(audit), sum(audit$status == "FAIL"),
                  sum(audit$status == "PASS"), sum(audit$status == "SKIPPED"), reportFile))
  invisible(audit)
}

## ---- CLI entry point (used by the link-check workflow) ---------------------
## Runs only when invoked as `Rscript link-check.R ...` (a `--file=` arg is
## present), not when the functions are source()d for reuse. Exits non-zero when
## any link is broken so CI shows a red mark (set LINK_CHECK_FAIL_ON_BROKEN=false
## to keep it report-only). checkCourseLinks() itself stays non-fatal.
if (any(grepl("^--file=", commandArgs(FALSE)))) {
  a       <- commandArgs(trailingOnly = TRUE)
  folder  <- if (length(a) >= 1L && nzchar(a[[1]])) a[[1]] else "docs"
  remote  <- !tolower(Sys.getenv("LINK_CHECK_REMOTE", "true"))          %in% c("false", "0", "no")
  failOn  <- !tolower(Sys.getenv("LINK_CHECK_FAIL_ON_BROKEN", "true"))  %in% c("false", "0", "no")
  res     <- checkCourseLinks(folder, checkRemote = remote)
  nFail   <- if (nrow(res)) sum(res$status == "FAIL") else 0L
  if (failOn && nFail > 0L) {
    message(sprintf("Failing the check: %d broken link(s).", nFail))
    quit(status = 1L, save = "no")
  }
}
