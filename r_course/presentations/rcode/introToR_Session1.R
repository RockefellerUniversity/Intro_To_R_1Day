## ----eval=F--------------------------------------------------------------
## setwd("/PathToMyDownload/Intro_To_R_1Day")
## # e.g. setwd("~/Downloads/Intro_To_R_1Day")

## ----prompt=T------------------------------------------------------------
3+1

2*2

sqrt(25)-1

## ------------------------------------------------------------------------
min(2,4,6)
sum(2,4,6)
max(2,4,6)

## ------------------------------------------------------------------------
?sqrt

## ------------------------------------------------------------------------
min(5,4,6)
min(6,4,5)

## ----eval=F--------------------------------------------------------------
## dir()
## dir(full.names=T)

## ----eval=F--------------------------------------------------------------
## dir(full.names=T)
## # Is equivalent to...
## dir(".",NULL,FALSE,T)

## ------------------------------------------------------------------------
x <- 10

## ------------------------------------------------------------------------
x

## ------------------------------------------------------------------------
x

## ------------------------------------------------------------------------
x <- 20
x

## ------------------------------------------------------------------------
x + sqrt(25)

## ------------------------------------------------------------------------
y <- x + sqrt(25)
y

## ------------------------------------------------------------------------
x
length(x)

## ------------------------------------------------------------------------
x <- c(1,2,3,4,5,6,7,8,9,10)
x
length(x)

## ------------------------------------------------------------------------
y <- 6:10
y

## ------------------------------------------------------------------------
seq(from=1,to=5,by=2)
rep(c(1,5,10),3)

## ------------------------------------------------------------------------
x
x[1]
x[8]

## ------------------------------------------------------------------------
x[c(1,6)]

## ------------------------------------------------------------------------
x[-5]

## ------------------------------------------------------------------------
x
x[5] <- -5
x

## ------------------------------------------------------------------------
y
x[y] <- 0
x

## ------------------------------------------------------------------------
x[1]

## ------------------------------------------------------------------------
sqrt(4)

## ------------------------------------------------------------------------
x <- c(1,2,3,4,5,6,7,8,9,10)
x
y <- x*2
y

## ------------------------------------------------------------------------
x+y

## ------------------------------------------------------------------------
x <- c(1,2,3,4,5,6,7,8,9,10)
x
x+c(1,2)

## ------------------------------------------------------------------------
x+c(1,2,3)

## ------------------------------------------------------------------------
y <- c("ICTEM","CommonWealth","Wolfson")
y[2]

## ------------------------------------------------------------------------
x <- c(1:3)
names(x) <- y
x

## ------------------------------------------------------------------------
x[c("ICTEM","Wolfson")]

## ------------------------------------------------------------------------
x[c("Strand")]

## ------------------------------------------------------------------------
geneList <- c("Gene1","Gene2","Gene3","Gene4","Gene5","Gene1","Gene3")
unique(geneList)

## ------------------------------------------------------------------------
z <- c(T,F,T,F,T,F,T,F,T,F) 
# z <-  c(TRUE,FALSE,TRUE,FALSE,TRUE,FALSE,TRUE,FALSE,TRUE,FALSE) 
z

## ------------------------------------------------------------------------
x <- 1:10
x[z]

## ------------------------------------------------------------------------
geneList <- c("Gene1","Gene2","Gene3","Gene4","Gene5","Gene1","Gene3")
secondGeneList <- c("Gene5","Gene3")
logical_index <- geneList %in% secondGeneList
logical_index

geneList[logical_index]

## ------------------------------------------------------------------------
x <- 1:10
x > 5
x[x > 5]

## ------------------------------------------------------------------------
x <- 1:10
!x > 4
x > 4 & x < 7
x > 4 | x < 7

## ------------------------------------------------------------------------
x <- 1:10
x
x[x > 4 & x < 7]
x[x > 4 & !x < 7]

## ------------------------------------------------------------------------
narrowMatrix <- matrix(1:10, nrow=5, ncol=2)
narrowMatrix

wideMatrix <- matrix(1:10, nrow=2, ncol=5)
wideMatrix

## ------------------------------------------------------------------------
wideMatrix <- matrix(1:10, nrow=2, ncol=5)
wideMatrix

wideMatrixByRow <- matrix(1:10, nrow=2, ncol=5, byrow=TRUE)
wideMatrixByRow

## ------------------------------------------------------------------------
dim(narrowMatrix)
nrow(narrowMatrix)
ncol(narrowMatrix)

## ------------------------------------------------------------------------
x <- 1:10
y <- 11:20
z <- 21:22
newMatrix <- cbind(x,y)
newMatrix

## ------------------------------------------------------------------------
newerMatrix <- rbind(newMatrix,z)
newerMatrix

## ------------------------------------------------------------------------
recycledMatrix2 <- matrix(1:5,ncol=2,nrow=3)
recycledMatrix2

## ------------------------------------------------------------------------
recycledMatrix3 <- rbind(recycledMatrix2,c(1:5))
recycledMatrix3

## ------------------------------------------------------------------------
namedMatrix <- matrix(1:10,ncol=5,nrow=2)
colnames(namedMatrix) <- paste("Column",1:5,sep="_")
rownames(namedMatrix) <- paste("Row",1:2,sep="_")
namedMatrix

## ------------------------------------------------------------------------
colnames(namedMatrix)
rownames(namedMatrix)

## ------------------------------------------------------------------------
narrowMatrix

## ------------------------------------------------------------------------
narrowMatrix[2,1]

## ------------------------------------------------------------------------
narrowMatrix[,2]

## ------------------------------------------------------------------------
narrowMatrix[3,]

## ------------------------------------------------------------------------
narrowMatrix[c(2,3),]

## ------------------------------------------------------------------------
colnames(narrowMatrix) <- paste("Column",1:2,sep="_")
rownames(narrowMatrix) <- paste("Row",1:5,sep="_")
narrowMatrix[,"Column_1"]
narrowMatrix["Row_1",]
narrowMatrix["Row_1","Column_1"]

## ------------------------------------------------------------------------
narrowMatrix
narrowMatrix[,1]
narrowMatrix[,1] < 5

## ------------------------------------------------------------------------
narrowMatrix[narrowMatrix[,1] < 5,]

## ------------------------------------------------------------------------
narrowMatrix
narrowMatrix[1,1]+2
narrowMatrix[1,]+2
mean(narrowMatrix)


## ------------------------------------------------------------------------
narrowMatrix
narrowMatrix[1,1] <- 10
narrowMatrix[,2] <- 1
narrowMatrix

## ----error=T-------------------------------------------------------------
narrowMatrix[,2] *2

## ------------------------------------------------------------------------
narrowMatrix[1,1] <- "Not_A_Number"
narrowMatrix

## ----error=T-------------------------------------------------------------
narrowMatrix[,2] *2

## ------------------------------------------------------------------------
vectorExample <- c("male","female","female","female")
factorExample <- factor(vectorExample)
factorExample
levels(factorExample)

## ------------------------------------------------------------------------
summary(vectorExample)
summary(factorExample)

## ------------------------------------------------------------------------
factorExample <- factor(vectorExample,levels=c("male","female"))
factorExample
summary(factorExample)

## ------------------------------------------------------------------------
factorExample <- factor(vectorExample,levels=c("male","female"))
factorExample[1] < factorExample[2]

## ------------------------------------------------------------------------
factorExample <- factor(c("small","big","big","small"),ordered=TRUE,levels=c("small","big"))
factorExample
factorExample[1] < factorExample[2]

## ------------------------------------------------------------------------
factorExample <- factor(c("small","big","big","small"))
factorExample[1] <- c("big")
factorExample

factorExample[1] <- c("huge")
factorExample


## ------------------------------------------------------------------------
levels(factorExample) <- c("big","small","huge")
factorExample[1] <- c("huge")
factorExample

## ------------------------------------------------------------------------
patientName <- c("patient1","patient2","patient3","patient4")
patientType <- factor(rep(c("male","female"),2))
survivalTime <- c(1,30,2,20)
dfExample <- data.frame(Name=patientName, Type=patientType,Survival_Time=survivalTime)
dfExample

## ------------------------------------------------------------------------
dfExample
dfExample[dfExample[,"Survival_Time"] > 10,]

## ------------------------------------------------------------------------
dfExample <- data.frame(Name=patientName,Type=patientType,Survival_Time=survivalTime)
dfExample$Survival_Time
dfExample[dfExample$Survival_Time < 10,]

## ------------------------------------------------------------------------
dfExample$Surv

## ---- eval=F-------------------------------------------------------------
## dfExample[,"Surv"]

## ------------------------------------------------------------------------
dfExample
dfExample$newColumn <- rep("newData",nrow(dfExample))
dfExample

## ------------------------------------------------------------------------
dfExample[dfExample[,"Survival_Time"] < 10,"Survival_Time"] <- 0
dfExample

## ------------------------------------------------------------------------
dfExample[dfExample[,"Survival_Time"] < 10,"Name"] <- "patientX"
dfExample

## ------------------------------------------------------------------------
dfExample <- data.frame(Name=patientName,Type=patientType,Survival_Time=survivalTime)

levels(dfExample[,"Name"]) <- c(levels(dfExample[,"Name"]) , "patientX")
dfExample[dfExample[,"Survival_Time"] < 10,"Name"] <- "patientX"
dfExample


## ------------------------------------------------------------------------
dfExample <- data.frame(Name=patientName,
                        Type=patientType,
                        Survival_Time=survivalTime,
                        stringsAsFactors = F)


dfExample[dfExample[,"Survival_Time"] < 10,"Name"] <- "patientX"
dfExample


## ------------------------------------------------------------------------
testOrder <- c(2,1,3)
testOrder
testOrder[order(testOrder)]
testOrder[order(testOrder,decreasing=T)]

## ------------------------------------------------------------------------
testOrder <- c(2,1,NA,3)
testOrder[order(testOrder,decreasing=T,na.last=T)]
testOrder[order(testOrder,decreasing=T,na.last=F)]

## ------------------------------------------------------------------------
dfExample
dfExample[order(dfExample$Surv, decreasing=T),]

## ------------------------------------------------------------------------
dfExample[order(dfExample$Type,
                dfExample$Survival,
                decreasing=T),]

## ------------------------------------------------------------------------
dfExample <- data.frame(Name=patientName,
                        Type=patientType,
                        Survival_Time=survivalTime)
dfExample 

## ------------------------------------------------------------------------
dfExample2 <- data.frame(Name=patientName[1:3],
                        height=c(6.1,5.1,5.5))

dfExample2

## ------------------------------------------------------------------------
mergedDF <- merge(dfExample,dfExample2,by=1,all=F)
mergedDF

## ------------------------------------------------------------------------
firstElement <- c(1,2,3,4)
secondElement <- matrix(1:10,nrow=2,ncol=5)
thirdElement <- data.frame(colOne=c(1,2,4,5),colTwo=c("One","Two","Three","Four"))
myList <- list(firstElement,secondElement,thirdElement)
myList

## ------------------------------------------------------------------------
myNamedList <- list(First=firstElement,Second=secondElement,Third=thirdElement)
myNamedList

## ------------------------------------------------------------------------
myList <- list(firstElement,secondElement,thirdElement)
myList[1]
myList[[1]]

## ------------------------------------------------------------------------
myNamedList$First

## ------------------------------------------------------------------------
myNamedList <- list(First=firstElement,Second=secondElement,Third=thirdElement)
myNamedList <- c(myNamedList,list(fourth=c(4,4)))
myNamedList[c(1,4)]


## ------------------------------------------------------------------------
myList <- c(myList,c(4,4))
myList


## ------------------------------------------------------------------------
myNamedList <- list(First=c(1,2,3),Second=c(2,6,7),Third=c(1,4,7))
myNamedList
flatList <- unlist(myNamedList)
flatList[1:7]

## ------------------------------------------------------------------------
myNamedList <- list(First=c(1,2,3),Second=c(2,6,7),Third=c(1,4,7))
flatList <- unlist(myNamedList)
listAsMat <- matrix(flatList,
                    nrow=length(myNamedList),
                    ncol=3,
                    byrow=T,
                    dimnames=list(names(myNamedList)))
listAsMat

## ----echo=F--------------------------------------------------------------
minRep <- rbind(cbind(matrix(rnorm(12,4),ncol=3,byrow = T),matrix(c(rnorm(9,4),rnorm(3,8)),ncol=3,byrow = T)),
cbind(matrix(rnorm(12,10),ncol=3,byrow = T),matrix(c(rnorm(6,3),rnorm(6,10)),ncol=3,byrow = T)))
colnames(minRep) <- paste0(c("Sample_"),
                      1:5,".",sort(rep(c("hi","low"),3)))
minRepdf <- data.frame(Gene_Name=paste("Gene",letters[1:8],sep="_"),minRep)
#minRepdf$Gene_Name <- paste("Gene",letters[1:8],sep="_")
#write.table(minRepdf,file="readThisTable.csv",sep=",",row.names=F)
kable(minRepdf)


## ----echo=T--------------------------------------------------------------
Table <- read.table("data/readThisTable.csv",sep=",",header=T)
Table[1:4,1:3]

## ----echo=T--------------------------------------------------------------
Table <- read.table("data/readThisTable.csv",sep=",",header=T,row.names=1)
Table[1:4,1:3]

## ----echo=T--------------------------------------------------------------
Table <- read.table("data/readThisTable.csv",sep=",",header=T,stringsAsFactors=F)

## ----echo=T--------------------------------------------------------------
URL <- "http://mrccsc.github.io/readThisTable.csv"
Table <- read.table(URL,sep=",",header=T)
Table[1:2,1:3]

## ----eval=F--------------------------------------------------------------
## Table <- read.table(file="clipboard",sep=",",header=T)

## ----echo=T--------------------------------------------------------------
x <- scan("data/readThisTable.csv",sep=",",
what = c(list(""),rep(list(NULL), 6)),skip=1)
x[1:3]

## ----echo=T--------------------------------------------------------------
write.table(Table,file="data/writeThisTable.csv",sep=",")

## ----echo=T--------------------------------------------------------------
write.table(Table,file="data/writeThisTable.csv", sep=",", row.names =F,col.names=T)

