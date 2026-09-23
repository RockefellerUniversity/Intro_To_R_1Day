aVector <- c(1,2,3,4,5,6,7,8,9,10)
aMatrix <- matrix(aVector,ncol=2,nrow=5,byrow = TRUE)
aFactor <- factor(c("R","Python","R","R","Python"),levels = c("R","Python"))
aDataFrame <- data.frame(Number=c(1,2,3,4,5),Factor=aFactor)

aVector <- c(1,2,3,4,5,6,7,8,9,10)
aVector[10]
aVector[10] <- 0
aVector


aMatrix <- matrix(aVector,ncol=2,
                  nrow=5,byrow = TRUE)
aMatrix
aMatrix[1,1]
aMatrix[,2]

aMatrix[1,1] <- 0
aMatrix[,2] <- 100
aMatrix

aMatrix <- matrix(aVector,ncol=2,
                  nrow=5,byrow = TRUE)
aMatrix


aMatrix[1,2] <- "Word"
aMatrix

aVector <- c(1,2,3,4,5,6,7,8,9,10)
aVector > 9
aFactor <- factor(c("R","Python","R","R","Python"),levels = c("R","Python"))
aDataFrame <- data.frame(Number=c(1,2,3,4,5),Factor=aFactor)
aDataFrame
aDataFrame$Factor == "R"

aVector <- c(1,2,3,4,5,6,7,8,9,10)
aVector > 5
aVector[aVector > 5] <- 10
aVector


aFactor <- factor(c("R","Python","R","R","Python"),
                  levels = c("R","Python"))
aDataFrame <- data.frame(Number=c(1,2,3,4,5),
                         Factor=aFactor)
aDataFrame[aDataFrame$Factor == "R",2] <- "NotPython"
aDataFrame


aDataFrame <- data.frame(Number=c(1,2,3,4,5),
                         Factor=aFactor)
aDataFrame$Factor <- factor(aDataFrame$Factor,
                            levels = c("R","Python","NotPython"))
aDataFrame[aDataFrame$Factor == "R",2] <- "NotPython"
aDataFrame

Table <- read.table("data/readThisTable.csv",sep=",",header=T,row.names=1)
Table[1:3,]
# write.table(Table,file="data/writeThisTable.csv", sep=",", row.names =F,col.names=T)

# ?merge

x <- 1:10
x[x < 4]

x <- TRUE
if(x){
  message("x is true")
}
x <- FALSE
if(x){
  message("x is true")
}


x <- 10
y <- 4
if(x > y){
  message("The value of x is ",x," which is greater than ", y)
}

y <- 20
if(x > y){
  message("The value of x is ",x," which is greater than ", y)
}


x <- 3
if(x < 5){
  message(x, " is less than 5")
   }else{
     message(x," is greater than or equal to 5")
}

x <- 10
if(x < 5){
  message(x, " is less than 5")
   }else{
     message(x," is greater than or equal to 5")
}


x <- 5
if(x > 5){
  message(x," is greater than 5")
  }else if(x == 5){
    message(x," is 5")
  }else{
    message(x, " is less than 5")
  }

x <- 1:10
x

ifelse(x <= 3,"lessOrEqual","more")

ifelse(x == 3,"same",
       ifelse(x < 3,"less","more")
      )

x <- 1
while(x < 3){
  message("x is ",x," ")
  x <- x+1
}

x <- 1:5
for(i in x){
  message(i)
}

x <- letters[1:5]
for(i in x){
  message(i)
}

geneName <- c("Ikzf1","Myc","Igll1")
expression <- c(10.4,4.3,6.5)
seq_along(geneName)
for(i in seq_along(geneName)){
  message(geneName[i]," has an RPKM of ",expression[i])
}

# 
# for(i in 1:8){
#   if(i > 5){
#     message("Number ",i," is greater than 5")
#   }else if(i == 5){
#     message("Number ",i," is 5")
#   }else{
#     message("Number ",i," is less than 5")
#   }
# }

for(i in 1:8){
  if(i > 5){
    message("Number ",i," is greater than 5")
  }else if(i == 5){
    message("Number ",i," is 5")
  }else{
    message("Number ",i," is less than 5")
  }
}

# for(i in 1:8){
#   if(i < 5){
#     message("Number ",i," is less than 5")
#   }else if(i == 5){
#     message("Number ",i," is 5")
#     break
#   }else{
#     message("Number ",i," is greater than 5")
#   }
# }

x <- 1:8

for(i in 1:8){
  if(i < 5){
    message("Number ",i,
            " is less than 5")
  }else if(i == 5){
    message("Number ",i,
            " is 5")
    break
  }else{
    message("Number ",i,
            " is greater than 5")
  }
}

matExample <- matrix(c(1:4),nrow=2,ncol=2,byrow=T)
matExample

apply(matExample,1,mean)

apply(matExample,2,mean)

apply(matExample,1,paste,collapse=";")

lapply(c(4,16),sqrt)

lapply(list(c(2,4),c(NA,9)),mean, na.rm=T)

exampleVector <- c(4,9,16)
exampleList <- list(4,9,16)
sapply(exampleVector, sqrt)
sapply(exampleList, sqrt)

exampleList <- list(row1=1:10,
                    row2=6:15,
                    row3=10:20)
exampleList

lapply(exampleList, quantile)

sapply(exampleList, quantile)

exampleList <- list(df=data.frame(sample=paste0("patient",1:2), data=c(1,12)),
                    vec=c(1,3,4,5))
sapply(exampleList, summary)

# myFirstFunction  <- function(MYARGUMENT){
#   ...................
#   ..CODE_TO_EXECUTE..
#   ...................
#   return(MYRESULT)
# }
# 
# myFirstFunction(MYARGUMENT=MY_USER_SUPPLIED_ARGUMENT)
# 

myFirstFunction  <- function(num1,num2){
  sumNum <- num1+num2
  return(sumNum)
}

myResult <- myFirstFunction(num1=2,num2=3)

myResult

try({
myFirstFunction  <- function(num1,num2){
  sumNum <- num1+num2
  multipleNum <- num1*num2
  return(sumNum,multipleNum)
}

myResult <- myFirstFunction(num1=2,num2=3)

})

myFirstFunction  <- function(num1,num2){
  sumNum <- num1+num2
  multipleNum <- num1*num2
  VectorOfResults <- c(sumNum,multipleNum)
  names(VectorOfResults) <- c("sum","multiple")
  return(VectorOfResults)
}

myResult <- myFirstFunction(num1=2,num2=3)
myResult

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

try({
myFirstFunction  <- function(num1,num2){
  sumNum <- num1+num2
  return(sumNum)
}
myResult <- myFirstFunction(num1=2,num2=3)
myResult
sumNum
})

my3rdNumber <- 4
myFirstFunction  <- function(num1,num2){
  sumNum <- num1+num2+my3rdNumber
  return(sumNum)
}
myResult <- myFirstFunction(num1=2,num2=3)
myResult

my3rdNumber <- 4
myFirstFunction  <- function(num1,num2){
  my3rdNumber <- num1+num2+my3rdNumber
  return(my3rdNumber)
}
myResult <- myFirstFunction(num1=2,num2=3)
myResult
my3rdNumber

my3rdNumber <- 4
myFirstFunction  <- function(num1,num2){
  my3rdNumber <<- num1+num2+my3rdNumber
  return(my3rdNumber)
}
myResult <- myFirstFunction(num1=2,num2=3)
myResult
my3rdNumber

myFirstFunction  <- function(num1=1,num2=3){
  my3rdNumber <- num1+num2+my3rdNumber
  return(my3rdNumber)
}
myFirstFunction()
myFirstFunction(3,4)

my_zscore  <- function(my_number, my_vector){
  my_mean <- mean(my_vector)
  message("Mean is ", my_mean)
  diff_from_mean <- my_number-my_mean
  stdev <- sd(my_vector)
  my_z <- diff_from_mean/stdev
  return(my_z)
}

set.seed(42)
A <- rnorm(20)

my_zscore(my_number=A[1], my_vector=A)


# debug(myFirstFunction)
# undebug(myFirstFunction)

sapply(A, my_zscore, my_vector=A)


# library(ggplot2)

# library()

# install.packages("Hmisc")

# install.packages("BiocManager")

# # Bioconductor package
# BiocManager::install("Rsamtools")
# # CRAN package
# BiocManager::install("ggplot2")

# install.packages("remotes")
# remotes::install_github('satijalab/seurat-data')

source("data/scripts/dayOfWeek.r")
dayOfWeek()

# args <- commandArgs(TRUE)
# myFirstArgument <- args[1]
# myFirstArgument

# as.numeric(myFirstArgument)
