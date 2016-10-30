## ----echo=T,eval=T-------------------------------------------------------
Table <- read.table("data/readThisTable.csv",sep=",",header=T,row.names=1)
Table[1:3,]

## ----echo=T,eval=F-------------------------------------------------------
## write.table(Table,file="data/writeThisTable.csv", sep=",", row.names =F,col.names=T)

## ----echo=T,eval=T-------------------------------------------------------
1- pnorm(8,mean=8,sd=3)

## ----echo=T,eval=T-------------------------------------------------------
tTestExample <- read.table("data/tTestData.csv",sep=",",header=T)
Result <- t.test(tTestExample$A,tTestExample$B,alternative ="two.sided", var.equal = T)
Result

## ------------------------------------------------------------------------
x <- 1:10
x[x < 4]

## ----message=T-----------------------------------------------------------
x <- TRUE
if(x){
  message("x is true")
}
x <- FALSE
if(x){
  message("x is true")
}


## ----message=T-----------------------------------------------------------
x <- 10
y <- 4
if(x > y){
  message("The value of x is ",x," which is greater than ", y)
}

## ----message=T-----------------------------------------------------------
y <- 20
if(x > y){
  message("The value of x is ",x," which is greater than ", y)
}




## ----message=T-----------------------------------------------------------
x <- 10
if(x < 5){
  message(x, " is less than to 5")
   }else{
     message(x," is greater than or equal to 5")
}

## ----message=T-----------------------------------------------------------
x <- 3
if(x < 5){
  message(x, " is less than 5")
   }else{
     message(x," is greater than or equal to 5")
}


## ---- message=TRUE-------------------------------------------------------
x <- 5
if(x > 5){
  message(x," is greater than 5")
  }else if(x == 5){
    message(x," is 5")
  }else{
    message(x, " is less than 5")
  }

## ------------------------------------------------------------------------
x <- 1:10
x

## ---- message=TRUE-------------------------------------------------------
ifelse(x <= 3,"lessOrEqual","more") 

## ------------------------------------------------------------------------
ifelse(x == 3,"same",
       ifelse(x < 3,"less","more")
       ) 

## ---- message=TRUE-------------------------------------------------------
x <- 1
while(x != 3){
  message("x is ",x," ")
  x <- x+1
}
message("Finally x is 3")

## ---- message=TRUE-------------------------------------------------------
x <- 1:5
for(i in x){
  message("Loop",i," ", appendLF = F)
}

## ---- message=TRUE-------------------------------------------------------
x <- toupper(letters[1:5])
for(i in x){
  message("Loop",i," ", appendLF = F)
}

## ----message=T-----------------------------------------------------------
geneName <- c("Ikzf1","Myc","Igll1")
expression <- c(10.4,4.3,6.5)
1:length(geneName)
for(i in 1:length(geneName)){
  message(geneName[i]," has an RPKM of ",expression[i])
}

## ----echo=T,eval=F-------------------------------------------------------
## x <- 1:13
## 
## for(i in 1:13){
##   if(i > 10){
##     message("Number ",i," is greater than 10")
##   }else if(i == 10){
##     message("Number ",i," is  10")
##   }else{
##     message("Number ",i," is less than  10")
##   }
## }

## ----message=T,echo=F----------------------------------------------------
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

## ----message=T,eval=F----------------------------------------------------
## x <- 1:13
## 
## for(i in 1:13){
##   if(i < 10){
##     message("Number ",i," is less than 10")
##   }else if(i == 10){
##     message("Number ",i," is  10")
##     break
##   }else{
##     message("Number ",i," is greater than  10")
##   }
## }

## ----message=T,eval=T,echo=F---------------------------------------------
x <- 1:13

for(i in 1:13){
  if(i < 10){
    message("Number ",i," is less than 10")
  }else if(i == 10){
    message("Number ",i," is  10")
    break
  }else{
    message("Number ",i," is greater than  10") 
  }
}

## ------------------------------------------------------------------------
matExample <- matrix(c(1:4),nrow=2,ncol=2,byrow=T)
matExample

## ------------------------------------------------------------------------
apply(matExample,1,mean)

## ------------------------------------------------------------------------
apply(matExample,2,mean)

## ------------------------------------------------------------------------
apply(matExample,1,paste,collapse=";")

## ------------------------------------------------------------------------
lapply(c(1,2),mean)

## ------------------------------------------------------------------------
lapply(list(1,c(NA,1),2),mean, na.rm=T)

## ------------------------------------------------------------------------
exampleVector <- c(1,2,3,4,5)
exampleList <- list(1,2,3,4,5)
sapply(exampleVector,mean,na.rm=T)
sapply(exampleList,mean,na.rm=T)

## ------------------------------------------------------------------------
exampleList <- list(row1=1:5, row2=6:10, row3=11:15)
exampleList

## ------------------------------------------------------------------------
lapply(exampleList,quantile)

## ------------------------------------------------------------------------

sapply(exampleList,quantile)

## ------------------------------------------------------------------------
exampleList <- list(df=data.frame(sample=paste0("patient",1:2), data=c(1,12)), vec=c(1,3,4,5))
sapply(exampleList,summary)

## ----message=T-----------------------------------------------------------
x=rnorm(100,70,10)
y <- jitter(x,amount=1)+20
mean(x)

lmExample <- data.frame(X=x,Y=y)
lmResult <- lm(Y~X,data=lmExample)

## ----message=T-----------------------------------------------------------
plot(Y~X,data=lmExample,main="Line of best fit with lm()",
     xlim=c(0,150),ylim=c(0,150))
abline(lmResult,col="red",lty=3,lwd=3)

## ----message=T-----------------------------------------------------------
myFirstFunction <- function(myArgument1,myArgument2){
  myResult <- (myArgument1*myArgument2)
  return(myResult)
}
myFirstFunction(4,5)

## ----message=T-----------------------------------------------------------

mySecondFunction <- function(myArgument1,myArgument2=10){
  myResult <- (myArgument1*myArgument2)
  return(myResult)
}
mySecondFunction(4,5)
mySecondFunction(4)

## ----message=T-----------------------------------------------------------

mySecondFunction <- function(myArgument1,myArgument2){
  if(missing(myArgument2)){
    message("Value for myArgument2 not provided so will square myArgument1")
    myResult <- myArgument1*myArgument1
  }else{
    myResult <- (myArgument1*myArgument2)   
  }
  return(myResult)
}
mySecondFunction(4)

## ----message=T-----------------------------------------------------------
myforthFunction <- function(myArgument1,myArgument2=10){
  myResult <- (myArgument1*myArgument2)
  return(myResult)
  print("I returned the result")
}
myfifthFunction <- function(myArgument1,myArgument2=10){
(myArgument1*myArgument2)
}

myforthFunction(4,5)
myfifthFunction(4,5)


## ----message=T-----------------------------------------------------------
mySixthFunction <- function(arg1,arg2){
  result1 <- arg1*arg2
  result2 <- date()
  return(list(Calculation=result1,DateRun=result2))
}
result <- mySixthFunction(10,10)
result

## ----message=T,error=TRUE------------------------------------------------
mySeventhFunction <- function(arg1,arg2){
  internalValue <- arg1*arg2
  return(internalValue)
}
result <- mySeventhFunction(10,10)
internalValue
arg1

## ------------------------------------------------------------------------
source("scripts/dayOfWeek.R")
dayOfWeek()

## ----eval=F--------------------------------------------------------------
## args <- commandArgs(TRUE)
## myFirstArgument <- args[1]
## myFirstArgument
## as.numeric(myFirstArgument

## ----eval=F--------------------------------------------------------------
## as.numeric(myFirstArgument)

## ----eval=F--------------------------------------------------------------
## library(ggplot2)

## ----eval=F--------------------------------------------------------------
## library()

## ----eval=F--------------------------------------------------------------
## install.packages("Hmisc")

