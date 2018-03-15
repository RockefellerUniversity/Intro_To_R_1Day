## ----eval=F--------------------------------------------------------------
## library(rmarkdown)
## render("scripts/script.r")

## ----eval=F--------------------------------------------------------------
## render("scripts/script.r", output_format="html_document")

## ----eval=F--------------------------------------------------------------
## render("scripts/script.r", output_format="html_document", output_file="myRenderedDoc.html",output_dir="scripts")

## ----eval=F--------------------------------------------------------------
## # Generate some random numbers
## myRandNumbers <- rnorm(100,10,2)

## ----eval=F--------------------------------------------------------------
## #' this would be placed as code
## # Generate some random numbers
## myRandNumbers <- rnorm(100,10,2)

## ----eval=F--------------------------------------------------------------
## 
## #' ---
## #' title: "CWB making notes example"
## #' author: "Tom Carroll"
## #' date: "Day 3 of CWB"
## #' ---
## #' this would be placed as text in html
## # Generate some random numbers (This is a comment with code)
## myRandNumbers <- rnorm(100,10,2)

## ----eval=F--------------------------------------------------------------
## 
## #' Some comments for text.
## #+ fig.width=3, fig.height=3
## myRandNumbers <- rnorm(100,10,2)
## hist(myRandNumbers)

## ----results='asis',eval=F-----------------------------------------------
## Italics = _Italics_ or *Italics*
## Bold  =  __Bold__ or **Bold**

