testC <- readChar("/Users/tcarroll/Downloads/htqc/r_course/convertion.md", file.info("/Users/tcarroll/Downloads/htqc/r_course/convertion.md")$size)
testCC <- strsplit(testC,"\n")
presBreaks <- grep("^=*=$",testCC[[1]])
testCC[[1]][grep("^=*=$",testCC[[1]])-1] <- paste0("##",
  testCC[[1]][grep("^=*=$",testCC[[1]])-1])
testCC[[1]][grep("^=*=$",testCC[[1]])] <- "\n"
lapply(testCC[[1]], cat, "\n", file="test.md", append=TRUE)
getwd()
