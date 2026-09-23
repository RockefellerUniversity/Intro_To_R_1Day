3+1

2*2

sqrt(25)-1

min(2,4,6)
sum(2,4,6)
max(2,4,6)

?sqrt

min(5,4,6)
min(6,4,5)

# dir()
# dir(full.names=T)

# dir(full.names=T)
# # Is equivalent to...
# dir(".",NULL,FALSE,T)

x <- 10

x

x

x <- 20
x

x

x + sqrt(25)

y <- x + sqrt(25)
y

x
length(x)

x <- c(1,2,3,4,5,6,7,8,9,10)
x
length(x)

y <- 6:10
y

seq(from=1,to=5,by=2)
rep(c(1,5,10),3)

z <- seq(from=2,to=20,by=2)
z
z[1]
z[8]

z[c(1,6)]

z[-5]

z
z[5] <- 1000
z

y
z[y] <- 0
z

x[1]

sqrt(4)

x <- c(1,2,3,4,5,6,7,8,9,10)
x
y <- x*2
y

x+y

x <- c(1,2,3,4,5,6,7,8,9,10)
x
x+c(1,2)

x+c(1,2,3)

y <- c("ICTEM","CommonWealth","Wolfson")
y[2]

x <- c(1:3)
names(x) <- y
x

x[c("ICTEM","Wolfson")]

x[c("Strand")]

geneList <- c("Gene1","Gene2","Gene3","Gene4","Gene5","Gene1","Gene3")
unique(geneList)

z <-  c(TRUE,FALSE,TRUE,FALSE,TRUE,FALSE,TRUE,FALSE,TRUE,FALSE)
# or
z <- c(T,F,T,F,T,F,T,F,T,F)

z

x <- 1:10
x[z]

geneList <- c("Gene1","Gene2","Gene3","Gene4","Gene5","Gene1","Gene3")
secondGeneList <- c("Gene5","Gene3")
logical_index <- geneList %in% secondGeneList
logical_index

geneList[logical_index]

mixedList <- c("protein1","Gene1","Protein2","Gene3","Gene4","Protein4","Gene5","Gene1","Protein5")
logical_index <- grepl("Prot", mixedList)
logical_index

mixedList[logical_index]

logical_index <- grepl("Prot", mixedList, ignore.case=T)
logical_index
mixedList[logical_index]

grep("Prot", mixedList)


x <- 1:10
x > 5
x[x > 5]

x <- 1:10
!x > 4
x > 4 & x < 7
x > 4 | x < 7

x <- 1:10
x
x[x > 4 & x < 7]
x[x > 4 & !x < 7]

narrowMatrix <- matrix(1:10, nrow=5, ncol=2)
narrowMatrix

wideMatrix <- matrix(1:10, nrow=2, ncol=5)
wideMatrix

wideMatrix <- matrix(1:10, nrow=2, ncol=5)
wideMatrix

wideMatrixByRow <- matrix(1:10, nrow=2, ncol=5, byrow=TRUE)
wideMatrixByRow

dim(narrowMatrix)
nrow(narrowMatrix)
ncol(narrowMatrix)

x <- 1:5
y <- 11:15
z <- 21:22
newMatrix <- cbind(x,y)
newMatrix

newerMatrix <- rbind(newMatrix,z)
newerMatrix

recycledMatrix2 <- matrix(1:5,ncol=2,nrow=3)
recycledMatrix2

recycledMatrix3 <- rbind(recycledMatrix2,c(1:5))
recycledMatrix3

namedMatrix <- matrix(1:10,ncol=5,nrow=2)
colnames(namedMatrix) <- paste("Column",1:5,sep="_")
rownames(namedMatrix) <- paste("Row",1:2,sep="_")
namedMatrix

colnames(namedMatrix)
rownames(namedMatrix)

narrowMatrix

narrowMatrix[2,1]

narrowMatrix[,2]

narrowMatrix[3,]

narrowMatrix[c(2,3),]

colnames(narrowMatrix) <- paste("Column",1:2,sep="_")
rownames(narrowMatrix) <- paste("Row",1:5,sep="_")
narrowMatrix[,"Column_1"]
narrowMatrix["Row_1",]
narrowMatrix["Row_1","Column_1"]

narrowMatrix
narrowMatrix[,1]
narrowMatrix[,1] < 5

narrowMatrix[narrowMatrix[,1] < 5,]

narrowMatrix
narrowMatrix[1,1]+2
narrowMatrix[1,]+2

mean(narrowMatrix)


narrowMatrix
narrowMatrix[1,1] <- 10
narrowMatrix[,2] <- 1
narrowMatrix

try({
narrowMatrix[,2] *2
})
narrowMatrix[1,1] <- "Not_A_Number"
narrowMatrix

try({
narrowMatrix[,2] *2
})

vectorExample <- c("mutant","mutant","wild-type","wild-type")
factorExample <- factor(vectorExample)
factorExample
levels(factorExample)

summary(vectorExample)
summary(factorExample)

factorExample <- factor(vectorExample, levels=c("wild-type", "mutant"))
factorExample
summary(factorExample)

factorExample <- factor(vectorExample, levels=c("wild-type", "mutant"))
factorExample[1] < factorExample[2]

factorExample <- factor(c("small","big","big","small"),
                        ordered=TRUE,levels=c("small","big"))
factorExample
factorExample[1] < factorExample[2]

factorExample <- factor(c("small","big","big","small"))
factorExample[1] <- c("big")
factorExample

factorExample[1] <- c("huge")
factorExample


levels(factorExample) <- c("big","small","huge")
factorExample[1] <- c("huge")
factorExample

MouseID <- c("mouse1","mouse2","mouse3","mouse4")
GeneType <- factor(rep(c("mutant","wild-type"),2))
survivalTime <- c(1,30,2,20)
dfExample <- data.frame(Name=MouseID, Type=GeneType, Survival_Time=survivalTime)
dfExample

dfExample
dfExample[dfExample[,"Survival_Time"] > 10,]

dfExample$Survival_Time
dfExample[dfExample$Survival_Time < 10,]

dfExample$Surv

# dfExample[,"Surv"]

dfExample
dfExample$newColumn <- rep("newData",nrow(dfExample))
dfExample

dfExample[dfExample[,"Survival_Time"] < 10,"Survival_Time"] <- 0
dfExample

dfExample[1,"Type"] <- "mutant2"
dfExample

dfExample <- data.frame(Name=MouseID,Type=GeneType,
                        Survival_Time=survivalTime)

levels(dfExample[,"Type"]) <- c(levels(dfExample[,"Type"]) ,
                                "mutant2")

dfExample[1,"Type"] <- "mutant2"
dfExample


dfExample2 <- data.frame(Name=MouseID,
                        Type=GeneType,
                        Survival_Time=survivalTime,
                        stringsAsFactors = T)

dfExample2[dfExample2[,"Survival_Time"] < 10,"Name"] <- "other"
dfExample2


testOrder <- c(20,100,45, 31)
testOrder
order(testOrder)
order(testOrder,decreasing=T)

testOrder[order(testOrder)]
testOrder[order(testOrder,decreasing=T)]

testOrder <- c(2,1,NA,3)
testOrder[order(testOrder,decreasing=T,na.last=T)]
testOrder[order(testOrder,decreasing=T,na.last=F)]

dfExample
dfExample[order(dfExample$Surv, decreasing=T),]

dfExample[order(dfExample$Type,
                dfExample$Surv,
                decreasing=T),]

dfExample <- data.frame(Name=MouseID,
                        Type=GeneType,
                        Survival_Time=survivalTime,
                        stringsAsFactors = T)
dfExample

dfExample2 <- data.frame(Name=MouseID[1:3],
                        Length=c(6.1,5.1,5.5))
dfExample2

mergedDF <- merge(dfExample,dfExample2,by=1,all=F)
mergedDF

firstElement <- c(1,2,3,4)
secondElement <- matrix(1:10,nrow=2,ncol=5)
thirdElement <- data.frame(colOne=c(1,2,4,5),colTwo=c("One","Two","Three","Four"))

myList <- list(firstElement,secondElement,thirdElement)
myList

myNamedList <- list(First=firstElement,Second=secondElement,
                    Third=thirdElement)
myNamedList

myList <- list(firstElement,secondElement,thirdElement)
myList[1]
myList[[1]]

myNamedList$First

myNamedList <- list(First=firstElement,Second=secondElement,
                    Third=thirdElement)
myNamedList <- c(myNamedList,list(fourth=c(4,4)))
myNamedList[c(1,4)]


myList <- c(myList,c(4,4))
myList[3:5]

myNamedList <- list(First=c(1,2,3),Second=c(2,6,7),Third=c(1,4,7))
myNamedList
flatList <- unlist(myNamedList)
flatList[1:7]

myNamedList <- list(First=c(1,2,3),Second=c(2,6,7),Third=c(1,4,7))
flatList <- unlist(myNamedList)
listAsMat <- matrix(flatList,
                    nrow=length(myNamedList),
                    ncol=3,
                    byrow=T,
                    dimnames=list(names(myNamedList)))
listAsMat

class(namedMatrix)
class(dfExample)

namedMatrix

as.character(namedMatrix)

as.vector(namedMatrix)

as.data.frame(namedMatrix)

as.list(namedMatrix)


class(dfExample)

summary(namedMatrix)
summary(dfExample)

namedMatrix[,1]
dfExample$Type

?data.frame

Time <- Sys.time()
Time

class(Time)

?POSIXct

TimeNow <- Sys.time()
TimeNow > Time

Time
Time - 120
TimeNow - Time

format(Time,format="%I O'Clock %p %A on %B %d")
format(Time,format="%I O'Clock %p %A on %B %d",tz = "GMT")

as.character(Time)
as.numeric(TimeNow-Time)

getwd()

# setwd("/PathToMyDownload/Intro_To_R_1Day-master/docs")
# # e.g. setwd("/Users/mattpaul/Downloads/Intro_To_R_1Day-master/docs")

# 
# setwd("/Users/mattpaul/Downloads/Intro_To_R_1Day-master/docs/")
# 

# 
# setwd("Downloads/Intro_To_R_1Day-master/docs/")
# 



Table <- read.table("data/readThisTable.csv",sep=",",header=T)
Table[1:4,1:3]

Table <- read.table("data/readThisTable.csv",sep=",",header=T,row.names=1)
Table[1:4,1:3]

Table <- read.table("data/readThisTable.csv", sep=",", header=T, stringsAsFactors=F)

URL <- "https://raw.githubusercontent.com/RockefellerUniversity/Intro_To_R_1Day/refs/heads/master/docs/data/readThisTable.csv"
Table <- read.table(URL,sep=",",header=T)
Table[1:2,1:3]


# Table <- read.table(file="clipboard",sep=",",header=T)
# Table <- read.table(pipe("pbpaste"),sep=",",header=T)

x <- scan("data/readThisTable.csv",sep=",",
          what = as.list(c("character",rep("numeric", 6))),skip=1)
x[1:3]

write.table(Table, file="data/writeThisTable.csv", sep=",")

write.table(Table, file="data/writeThisTable.csv", sep=",", row.names =F, col.names=T)

head(Table)

tail(Table)
head(Table,3)

# install.packages("rio")

library("rio")

Table <- import("data/readThisTable.csv")
Table[1:2,]

Table <- import("data/readThisXLS.xls",
                which=2)
Table <- import("data/readThisXLS.xls",
                which="Metadata")
Table[1:2,]

Table <- import_list("data/readThisXLS.xls")
names(Table)

## Table[["ExpressionScores"]][1:2,]
Table$ExpressionScores[1:2,]
Table$Metadata[1:2,]

ExpressionScores <- Table$ExpressionScores
export(ExpressionScores,file = "data/writeThisXLSX.xlsx")


names(Table) <- c("expr","meta")
export(Table, file = "data/writeThisMultipleXLSX.xlsx")


firstElement <- c(1,2,3,4)
secondElement <- matrix(1:10,nrow=2,ncol=5)
thirdElement <- data.frame(colOne=c(1,2,4,5),colTwo=c("One","Two","Three","Four"))

myList <- list(firstElement,secondElement,thirdElement)
myList

saveRDS(myList, "my_list.rds")


my_newlist <- readRDS("my_list.rds")
my_newlist

save(Table, myList, file = "my_list.RData")


load("my_list.RData")

