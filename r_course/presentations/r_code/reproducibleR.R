params <-
list(isSlides = "no")

## ----setup, include=FALSE---------------------------------------------------------------------------------------------------------
suppressPackageStartupMessages(require(knitr))
knitr::opts_chunk$set(echo = TRUE, tidy = T)


## ---- results='asis',include=TRUE,echo=FALSE--------------------------------------------------------------------------------------
if(params$isSlides != "yes"){
  cat("# Reproducible Research


"    
  )
  
}



## ----setwd_introtoR,eval=F--------------------------------------------------------------------------------------------------------
## setwd("/PathToMyDownload/Reproducible_R/r_course")
## # e.g. setwd("~/Downloads/Intro_To_R_1Day/r_course")


## ---- results='asis',include=TRUE,echo=FALSE--------------------------------------------------------------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Creating Documents from R Scripts

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 


"    
  )
}else{
  cat("# Creating Documents from R Scripts


"    
  )
  
}



## ----eval=F,echo=TRUE-------------------------------------------------------------------------------------------------------------
## library(rmarkdown)
## render("scripts/script.r")


## ----eval=F,echo=TRUE-------------------------------------------------------------------------------------------------------------
## render("scripts/script.r", output_format="html_document")


## ----eval=F,echo=TRUE,tidy=FALSE--------------------------------------------------------------------------------------------------
## render("scripts/script.r", output_format="html_document",
##        output_file="myRenderedDoc.html",output_dir="scripts")


## ---- results='asis',include=TRUE,echo=FALSE--------------------------------------------------------------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Comments

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 


"    
  )
}else{
  cat("# Comments


"    
  )
  
}



## ----eval=F-----------------------------------------------------------------------------------------------------------------------
## # Generate some random numbers
## myRandNumbers <- rnorm(100,10,2)


## ----eval=F-----------------------------------------------------------------------------------------------------------------------
## #' this would be placed as code
## # Generate some random numbers
## myRandNumbers <- rnorm(100,10,2)


## ----eval=F-----------------------------------------------------------------------------------------------------------------------
## 
## #'
## #' title: "BRC making notes example"
## #' author: "Tom Carroll"
## #' date: "Reproducible R"
## #'
## #' this would be placed as text in html
## # Generate some random numbers (This is a comment with code)
## myRandNumbers <- rnorm(100,10,2)


## ----eval=F-----------------------------------------------------------------------------------------------------------------------
## 
## #' Some comments for text.
## #+ fig.width=3, fig.height=3
## myRandNumbers <- rnorm(100, 10, 2)
## hist(myRandNumbers)


## ---- results='asis',include=TRUE,echo=FALSE--------------------------------------------------------------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Markdown

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 


"    
  )
}else{
  cat("# Markdown


"    
  )
  
}



## ---- results='asis',include=TRUE,echo=FALSE--------------------------------------------------------------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Markdown Syntax

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 


"    
  )
}else{
  cat("# Markdown Syntax


"    
  )
  
}



## ----results='asis',eval=F--------------------------------------------------------------------------------------------------------
## Italics = _Italics_ or *Italics*
## Bold  =  __Bold__ or **Bold**


## ---- results='asis',include=TRUE,echo=FALSE--------------------------------------------------------------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# rMarkdown

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 


"    
  )
}else{
  cat("# rMarkdown


"    
  )
  
}



## ----fig.width=5,fig.height=2-----------------------------------------------------------------------------------------------------
hist(rnorm(1000))


## ----eval=F-----------------------------------------------------------------------------------------------------------------------
## hist(rnorm(1000))


## ----fig.width=5,fig.height=2,echo=FALSE------------------------------------------------------------------------------------------
hist(rnorm(1000))


## ----tidy=T,fig.width=5,fig.height=2----------------------------------------------------------------------------------------------
        hist( 
rnorm(100  )
)


## ---- collapse=T------------------------------------------------------------------------------------------------------------------
temp <- rnorm(10)
temp

