## ----include=FALSE----------------------------------------------------------------------
suppressPackageStartupMessages(require(knitr))


## ----eval=F,echo=TRUE-------------------------------------------------------------------
## library(rmarkdown)
## render("scripts/script.r")


## ----eval=F,echo=TRUE-------------------------------------------------------------------
## render("scripts/script.r", output_format="html_document")


## ----eval=F,echo=TRUE,tidy=FALSE--------------------------------------------------------
## render("scripts/script.r", output_format="html_document",
##        output_file="myRenderedDoc.html",output_dir="scripts")


## ----eval=F-----------------------------------------------------------------------------
## # Generate some random numbers
## myRandNumbers <- rnorm(100,10,2)


## ----eval=F-----------------------------------------------------------------------------
## #' this would be placed as code
## # Generate some random numbers
## myRandNumbers <- rnorm(100,10,2)


## ----eval=F-----------------------------------------------------------------------------
## 
## #'
## #' title: "CWB making notes example"
## #' author: "Tom Carroll"
## #' date: "Day 3 of CWB"
## #'
## #' this would be placed as text in html
## # Generate some random numbers (This is a comment with code)
## myRandNumbers <- rnorm(100,10,2)


## ----eval=F-----------------------------------------------------------------------------
## 
## #' Some comments for text.
## #+ fig.width=3, fig.height=3
## myRandNumbers <- rnorm(100, 10, 2)
## hist(myRandNumbers)


## ----results='asis',eval=F--------------------------------------------------------------
## Italics = _Italics_ or *Italics*
## Bold  =  __Bold__ or **Bold**


## ----fig.width=5,fig.height=2-----------------------------------------------------------
hist(rnorm(1000))


## ----eval=F-----------------------------------------------------------------------------
## hist(rnorm(1000))


## ----fig.width=5,fig.height=2,echo=FALSE------------------------------------------------
hist(rnorm(1000))


## ----tidy=T,fig.width=5,fig.height=2----------------------------------------------------
        hist( 
rnorm(100  )
)


## ----collapse=T-------------------------------------------------------------------------
temp <- rnorm(10)
temp

