params <-
list(isSlides = "no")

## ----setup, include=FALSE-----------------------------------------------------
suppressPackageStartupMessages(require(knitr))
knitr::opts_chunk$set(echo = TRUE, tidy = T)


## ----xaringan-themer, include=FALSE, warning=FALSE----------------------------
library(xaringanthemer)
style_mono_accent(
  base_color = "#23373B",
  header_font_google = google_font("Montserrat"),
  text_font_google   = google_font("Fira Sans", "300", "300i"),
  code_font_google   = google_font("Fira Code")
)


## ----results='asis',include=TRUE,echo=FALSE-----------------------------------
if(params$isSlides != "yes"){
  cat("# Introduction to R (part 2)

---
"    
  )
  
}



## ----echo=T,eval=T------------------------------------------------------------
aVector <- c(1,2,3,4,5,6,7,8,9,10)
aMatrix <- matrix(aVector,ncol=2,nrow=5,byrow = TRUE)
aFactor <- factor(c("R","Python","R","R","Python"),levels = c("R","Python"))
aDataFrame <- data.frame(Number=c(1,2,3,4,5),Factor=aFactor)


## ----echo=T,eval=T------------------------------------------------------------
aVector <- c(1,2,3,4,5,6,7,8,9,10)
aVector[10]
aVector[10] <- 0
aVector



## ----echo=T,eval=T,tidy=FALSE-------------------------------------------------
aMatrix <- matrix(aVector,ncol=2,
                  nrow=5,byrow = TRUE)
aMatrix
aMatrix[1,]
aMatrix[,1]


## ----echo=T,eval=T,tidy=FALSE-------------------------------------------------
aMatrix[1,1] <- 0
aMatrix[,2] <- 100
aMatrix


## ----echo=T,eval=T,tidy=FALSE-------------------------------------------------
aMatrix <- matrix(aVector,ncol=2,
                  nrow=5,byrow = TRUE)
aMatrix



## ----echo=T,eval=T,tidy=FALSE-------------------------------------------------
aMatrix[1,2] <- "Word"
aMatrix


## ----echo=T,eval=T------------------------------------------------------------
aVector <- c(1,2,3,4,5,6,7,8,9,10)
aVector > 9
aFactor <- factor(c("R","Python","R","R","Python"),levels = c("R","Python"))
aDataFrame <- data.frame(Number=c(1,2,3,4,5),Factor=aFactor)
aDataFrame
aDataFrame$Factor == "R"


## ----echo=T,eval=T------------------------------------------------------------
aVector <- c(1,2,3,4,5,6,7,8,9,10)
aVector > 5
aVector[aVector > 5] <- 10
aVector


## ----echo=T,eval=T,tidy=T-----------------------------------------------------

aFactor <- factor(c("R","Python","R","R","Python"),
                  levels = c("R","Python"))
aDataFrame <- data.frame(Number=c(1,2,3,4,5),
                         Factor=aFactor)
aDataFrame[aDataFrame$Factor == "R",2] <- "NotPython"
aDataFrame


## ----echo=T,eval=T,tidy=FALSE-------------------------------------------------

aDataFrame <- data.frame(Number=c(1,2,3,4,5),
                         Factor=aFactor)
aDataFrame$Factor <- factor(aDataFrame$Factor,
                            levels = c("R","Python","NotPython"))
aDataFrame[aDataFrame$Factor == "R",2] <- "NotPython"
aDataFrame


## ----echo=T,eval=T------------------------------------------------------------
Table <- read.table("data/readThisTable.csv",sep=",",header=T,row.names=1)
Table[1:3,]

## ----echo=T,eval=F------------------------------------------------------------
# write.table(Table,file="data/writeThisTable.csv", sep=",", row.names =F,col.names=T)


## ----echo=T,eval=F------------------------------------------------------------
# ?merge


## ----results='asis',include=TRUE,echo=FALSE-----------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Conditions and Loops

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 

---
"    
  )
}else{
  cat("# Conditions and Loops

---
"    
  )
  
}


## -----------------------------------------------------------------------------
x <- 1:10
x[x < 4]


## ----message=T----------------------------------------------------------------
x <- TRUE
if(x){
  message("x is true")
}
x <- FALSE
if(x){
  message("x is true")
}



## ----message=T----------------------------------------------------------------
x <- 10
y <- 4
if(x > y){
  message("The value of x is ",x," which is greater than ", y)
}


## ----message=T----------------------------------------------------------------
y <- 20
if(x > y){
  message("The value of x is ",x," which is greater than ", y)
}



## ----message=T----------------------------------------------------------------
x <- 3
if(x < 5){
  message(x, " is less than to 5")
   }else{
     message(x," is greater than or equal to 5")
}


## ----message=T----------------------------------------------------------------
x <- 10
if(x < 5){
  message(x, " is less than 5")
   }else{
     message(x," is greater than or equal to 5")
}



## ----message=TRUE-------------------------------------------------------------
x <- 5
if(x > 5){
  message(x," is greater than 5")
  }else if(x == 5){
    message(x," is 5")
  }else{
    message(x, " is less than 5")
  }


## -----------------------------------------------------------------------------
x <- 1:10
x


## ----message=TRUE-------------------------------------------------------------
ifelse(x <= 3,"lessOrEqual","more") 


## -----------------------------------------------------------------------------
ifelse(x == 3,"same",
       ifelse(x < 3,"less","more")
      ) 


## ----message=TRUE-------------------------------------------------------------
x <- 1
while(x < 3){
  message("x is ",x," ")
  x <- x+1
}
message("Finally x is not less than 3")


## ----message=TRUE-------------------------------------------------------------
x <- 1:5
for(i in x){
  message(i," ", appendLF = F)
}


## ----message=TRUE-------------------------------------------------------------
x <- toupper(letters[1:5])
for(i in x){
  message(i," ", appendLF = F)
}


## ----message=T----------------------------------------------------------------
geneName <- c("Ikzf1","Myc","Igll1")
expression <- c(10.4,4.3,6.5)
1:length(geneName)
for(i in 1:length(geneName)){
  message(geneName[i]," has an RPKM of ",expression[i])
}


## ----echo=T,eval=F------------------------------------------------------------
# x <- 1:13
# 
# for(i in 1:13){
#   if(i > 10){
#     message("Number ",i," is greater than 10")
#   }else if(i == 10){
#     message("Number ",i," is  10")
#   }else{
#     message("Number ",i," is less than 10")
#   }
# }


## ----message=T,echo=F---------------------------------------------------------
x <- 1:13

for(i in 1:13){
  if(i > 10){
    message("Number ",i," is greater than 10")
  }else if(i == 10){
    message("Number ",i," is  10") 
  }else{
    message("Number ",i," is less than  10") 
  }
}


## ----message=T,eval=F---------------------------------------------------------
# x <- 1:13
# 
# for(i in 1:13){
#   if(i < 10){
#     message("Number ",i," is less than 10")
#   }else if(i == 10){
#     message("Number ",i," is  10")
#     break
#   }else{
#     message("Number ",i," is greater than  10")
#   }
# }


## ----message=T,eval=T,echo=F--------------------------------------------------
x <- 1:13

for(i in 1:13){
  if(i < 10){
    message("Number ",i,
            " is less than 10")
  }else if(i == 10){
    message("Number ",i,
            " is  10")
    break
  }else{
    message("Number ",i,
            " is greater than  10") 
  }
}


## -----------------------------------------------------------------------------
matExample <- matrix(c(1:4),nrow=2,ncol=2,byrow=T)
matExample


## -----------------------------------------------------------------------------
apply(matExample,1,mean)


## -----------------------------------------------------------------------------
apply(matExample,2,mean)


## -----------------------------------------------------------------------------
apply(matExample,1,paste,collapse=";")


## -----------------------------------------------------------------------------
lapply(c(1,2),mean)


## -----------------------------------------------------------------------------
lapply(list(1,c(NA,1),2),mean, na.rm=T)


## -----------------------------------------------------------------------------
exampleVector <- c(1,2,3,4,5)
exampleList <- list(1,2,3,4,5)
sapply(exampleVector, mean, na.rm=T)
sapply(exampleList, mean, na.rm=T)


## ----tidy=FALSE---------------------------------------------------------------
exampleList <- list(row1=1:5, 
                    row2=6:10, 
                    row3=11:15)
exampleList


## -----------------------------------------------------------------------------
lapply(exampleList, quantile)


## -----------------------------------------------------------------------------
sapply(exampleList, quantile)


## ----tidy=FALSE---------------------------------------------------------------
exampleList <- list(df=data.frame(sample=paste0("patient",1:2), data=c(1,12)),
                    vec=c(1,3,4,5))
sapply(exampleList, summary)


## ----results='asis',include=TRUE,echo=FALSE-----------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Custom functions

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 

---
"    
  )
}else{
  cat("# Custom functions

---
"    
  )
  
}


## ----makingfunctions,eval=FALSE-----------------------------------------------
# myFirstFunction  <- function(MYARGUMENT){
#   ...................
#   ..CODE_TO_EXECUTE..
#   ...................
#   return(MYRESULT)
# }
# 
# myFirstFunction(MYARGUMENT=MY_USER_SUPPLIED_ARGUMENT)
# 


## ----makingfunctionsb---------------------------------------------------------
myFirstFunction  <- function(num1,num2){
  sumNum <- num1+num2
  return(sumNum)
}

myResult <- myFirstFunction(num1=2,num2=3)

myResult


## ----makingfunctionsc,error=TRUE----------------------------------------------
try({
myFirstFunction  <- function(num1,num2){
  sumNum <- num1+num2
  multipleNum <- num1*num2
  return(sumNum,multipleNum)
}

myResult <- myFirstFunction(num1=2,num2=3)

})


## ----makingfunctionsd,error=FALSE---------------------------------------------
myFirstFunction  <- function(num1,num2){
  sumNum <- num1+num2
  multipleNum <- num1*num2
  VectorOfResults <- c(sumNum,multipleNum)
  names(VectorOfResults) <- c("multiple","sum")
  return(VectorOfResults)
}

myResult <- myFirstFunction(num1=2,num2=3)
myResult


## ----makingfunctionse,error=FALSE---------------------------------------------
myFirstFunction  <- function(num1,num2){
  sumNum <- num1+num2
  multipleNum <- num1*num2
  InputNumbers <- c(FirstNum=num1,SecondNum=num2)
  DF <- data.frame(Sum=sumNum,Multiple=multipleNum)
  listToReturn <- list(Input=InputNumbers,Result=DF)
  return(listToReturn)
}

myResult <- myFirstFunction(num1=2,num2=3)
myResult


## ----makingfunctionsf,error=FALSE---------------------------------------------
myFirstFunction  <- function(num1,num2){
  sumNum <- num1+num2
  multipleNum <- num1*num2
  InputNumbers <- c(FirstNum=num1,SecondNum=num2)
  DF <- data.frame(Sum=sumNum,Multiple=multipleNum)
  listToReturn <- list(Input=InputNumbers,Result=DF)
  message("Before return")
  return(listToReturn)
  message("After return")
}

myResult <- myFirstFunction(num1=2,num2=3)
myResult


## ----makingfunctionsg,error=FALSE---------------------------------------------
myFirstFunction  <- function(num1,num2){
  sumNum <- num1+num2
  multipleNum <- num1*num2
  InputNumbers <- c(FirstNum=num1,SecondNum=num2)
  DF <- data.frame(Sum=sumNum,Multiple=multipleNum)
  listToReturn <- list(Input=InputNumbers,Result=DF)
  listToReturn
}

myResult <- myFirstFunction(num1=2,num2=3)
myResult


## ----makingfunctionsh,error=TRUE----------------------------------------------
try({
myFirstFunction  <- function(num1,num2){
  sumNum <- num1+num2
  return(sumNum)
}
myResult <- myFirstFunction(num1=2,num2=3)
myResult
sumNum
})


## ----makingfunctionsi,error=FALSE---------------------------------------------
my3rdNumber <- 4
myFirstFunction  <- function(num1,num2){
  sumNum <- num1+num2+my3rdNumber
  return(sumNum)
}
myResult <- myFirstFunction(num1=2,num2=3)
myResult


## ----makingfunctionsj,error=FALSE---------------------------------------------
my3rdNumber <- 4
myFirstFunction  <- function(num1,num2){
  my3rdNumber <- num1+num2+my3rdNumber
  return(my3rdNumber)
}
myResult <- myFirstFunction(num1=2,num2=3)
myResult
my3rdNumber


## ----makingfunctionsk,error=FALSE---------------------------------------------
my3rdNumber <- 4
myFirstFunction  <- function(num1,num2){
  my3rdNumber <<- num1+num2+my3rdNumber
  return(my3rdNumber)
}
myResult <- myFirstFunction(num1=2,num2=3)
myResult
my3rdNumber


## ----makingfunctionsl,error=FALSE---------------------------------------------
myFirstFunction  <- function(num1=1,num2=3){
  my3rdNumber <- num1+num2+my3rdNumber
  return(my3rdNumber)
}
myFirstFunction()
myFirstFunction(3,4)


## ----makingfunctions_zscores--------------------------------------------------
my_zscore  <- function(my_number, my_vector){
  my_mean <- mean(my_vector)
  message("Mean is ", my_mean)
  diff_from_mean <- my_number-my_mean
  stdev <- sd(my_vector)
  my_z <- diff_from_mean/stdev
  return(my_z)
}

A <- rnorm(20)

my_zscore(my_number=A[1], my_vector=A)



## ----makingfunctionsO,error=FALSE,eval=FALSE----------------------------------
# debug(myFirstFunction)
# undebug(myFirstFunction)


## ----message=F----------------------------------------------------------------
sapply(A, my_zscore, my_vector=A)



## ----results='asis',include=TRUE,echo=FALSE-----------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Getting Additional Libraries

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 

---
"    
  )
}else{
  cat("# Getting Additional Libraries

---
"    
  )
  
}


## ----eval=F-------------------------------------------------------------------
# library(ggplot2)


## ----eval=F-------------------------------------------------------------------
# library()


## ----eval=F-------------------------------------------------------------------
# install.packages("Hmisc")


## ----eval=F-------------------------------------------------------------------
# install.packages("BiocManager")


## ----eval=F-------------------------------------------------------------------
# # Bioconductor package
# BiocManager::install("Rsamtools")
# # CRAN package
# BiocManager::install("ggplot2")


## ----eval=F-------------------------------------------------------------------
# install.packages("devtools")
# devtools::install_github('satijalab/seurat-data')


## ----results='asis',include=TRUE,echo=FALSE-----------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Scripts

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 

---
"    
  )
}else{
  cat("# Scripts

---
"    
  )
  
}


## -----------------------------------------------------------------------------
source("scripts/dayOfWeek.r")
dayOfWeek()


## ----eval=F-------------------------------------------------------------------
# args <- commandArgs(TRUE)
# myFirstArgument <- args[1]
# myFirstArgument


## ----eval=F-------------------------------------------------------------------
# as.numeric(myFirstArgument)

