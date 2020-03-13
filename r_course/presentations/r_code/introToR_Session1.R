## ----include=FALSE-------------------------------------------------------------------------------------------------------
suppressPackageStartupMessages(require(knitr))


## ----setwd_introtoR,eval=F-----------------------------------------------------------------------------------------------
## setwd("/PathToMyDownload/Intro_To_R_1Day/r_course")
## # e.g. setwd("~/Downloads/Intro_To_R_1Day/r_course")


## ----simpleCalculations_introtoR,prompt=T--------------------------------------------------------------------------------
3+1

2*2

sqrt(25)-1


## ----usingFunctions_introtoR---------------------------------------------------------------------------------------------
min(2,4,6)
sum(2,4,6)
max(2,4,6)


## ----usingFunctionsSQRT_introtoR-----------------------------------------------------------------------------------------
?sqrt


## ----usingFunctionsArgOrder_introtoR-------------------------------------------------------------------------------------
min(5,4,6)
min(6,4,5)


## ----usingFunctionsSetNames_introtoR,eval=F------------------------------------------------------------------------------
## dir()
## dir(full.names=T)


## ----usingFunctionsDefaultOrder_introtoR,eval=F--------------------------------------------------------------------------
## dir(full.names=T)
## # Is equivalent to...
## dir(".",NULL,FALSE,T)


## ----variablesDefine_introtoR--------------------------------------------------------------------------------------------
x <- 10


## ----variableHold_introtoR-----------------------------------------------------------------------------------------------
x


## ----variableShowForAlterInPlace_introtoR--------------------------------------------------------------------------------
x


## ----variableAlterInPlace_introtoR---------------------------------------------------------------------------------------
x <- 20
x


## ----variableAsValueTheyContain_introtoR---------------------------------------------------------------------------------
x


## ----variableAsValueFromFunTheyContain_introtoR--------------------------------------------------------------------------
x + sqrt(25)


## ----variableCreateNewVariable_introtoR----------------------------------------------------------------------------------
y <- x + sqrt(25)
y


## ----vectorBasic_introtoR------------------------------------------------------------------------------------------------
x
length(x)


## ----vectorCreate_introtoR-----------------------------------------------------------------------------------------------
x <- c(1,2,3,4,5,6,7,8,9,10)
x
length(x)


## ----vectorSeqFromColon_introtoR-----------------------------------------------------------------------------------------
y <- 6:10
y


## ----vectorSeqFromSeqAndRep_introtoR-------------------------------------------------------------------------------------
seq(from=1,to=5,by=2)
rep(c(1,5,10),3)


## ----vectorIndexing_introtoR---------------------------------------------------------------------------------------------
x
x[1]
x[8]


## ----vectorIndexingBy2_introtoR------------------------------------------------------------------------------------------
x[c(1,6)]


## ----vectorIndexingByNeg_introtoR----------------------------------------------------------------------------------------
x[-5]


## ----vectorIndexingAndReplace_introtoR-----------------------------------------------------------------------------------
x
x[5] <- -5
x


## ----vectorIndexingUsingVectors_introtoR---------------------------------------------------------------------------------
y
x[y] <- 0
x


## ----RememberSquareForIndex_introtoR-------------------------------------------------------------------------------------
x[1]


## ----RememberRoundForFunctions_introtoR----------------------------------------------------------------------------------
sqrt(4)


## ----vectorArithmetricOperations_introtoR--------------------------------------------------------------------------------
x <- c(1,2,3,4,5,6,7,8,9,10)
x
y <- x*2
y


## ----vectorArithmetricOperationsMultipleVectors_introtoR-----------------------------------------------------------------
x+y


## ----vectorRecycle_introtoR----------------------------------------------------------------------------------------------
x <- c(1,2,3,4,5,6,7,8,9,10)
x
x+c(1,2)


## ----vectorShorterRecycle_introtoR---------------------------------------------------------------------------------------
x+c(1,2,3)


## ----vectorCharacters_introtoR-------------------------------------------------------------------------------------------
y <- c("ICTEM","CommonWealth","Wolfson")
y[2]


## ----vectorCharacterNames_introtoR---------------------------------------------------------------------------------------
x <- c(1:3)
names(x) <- y
x


## ----vectorCharacterNamesIndex_introtoR----------------------------------------------------------------------------------
x[c("ICTEM","Wolfson")]


## ----vectorCharacterNamesIndexMissing_introtoR---------------------------------------------------------------------------
x[c("Strand")]


## ----vectorUnique_introtoR-----------------------------------------------------------------------------------------------
geneList <- c("Gene1","Gene2","Gene3","Gene4","Gene5","Gene1","Gene3")
unique(geneList)


## ----vectorLogical_introtoR----------------------------------------------------------------------------------------------
z <- c(T,F,T,F,T,F,T,F,T,F) 
# z <-  c(TRUE,FALSE,TRUE,FALSE,TRUE,FALSE,TRUE,FALSE,TRUE,FALSE) 
z


## ----vectorLogicalOtherVector_introtoR-----------------------------------------------------------------------------------
x <- 1:10
x[z]


## ----vectorInFuncion_introtoR--------------------------------------------------------------------------------------------
geneList <- c("Gene1","Gene2","Gene3","Gene4","Gene5","Gene1","Gene3")
secondGeneList <- c("Gene5","Gene3")
logical_index <- geneList %in% secondGeneList
logical_index

geneList[logical_index]


## ----vectorLogicalFromOperators_introtoR---------------------------------------------------------------------------------
x <- 1:10
x > 5
x[x > 5]


## ----vectorLogicalCombine_introtoR---------------------------------------------------------------------------------------
x <- 1:10
!x > 4
x > 4 & x < 7
x > 4 | x < 7


## ----vectorLogicalCombineIndex_introtoR----------------------------------------------------------------------------------
x <- 1:10
x
x[x > 4 & x < 7]
x[x > 4 & !x < 7]


## ----matricesCreate_introtoR---------------------------------------------------------------------------------------------
narrowMatrix <- matrix(1:10, nrow=5, ncol=2)
narrowMatrix

wideMatrix <- matrix(1:10, nrow=2, ncol=5)
wideMatrix


## ----matricesCreateByRow_introtoR----------------------------------------------------------------------------------------
wideMatrix <- matrix(1:10, nrow=2, ncol=5)
wideMatrix

wideMatrixByRow <- matrix(1:10, nrow=2, ncol=5, byrow=TRUE)
wideMatrixByRow


## ----matricesDim_introtoR------------------------------------------------------------------------------------------------
dim(narrowMatrix)
nrow(narrowMatrix)
ncol(narrowMatrix)


## ----matricesCbind_introtoR----------------------------------------------------------------------------------------------
x <- 1:5
y <- 11:15
z <- 21:22
newMatrix <- cbind(x,y)
newMatrix


## ----matricesRbind_introtoR----------------------------------------------------------------------------------------------
newerMatrix <- rbind(newMatrix,z)
newerMatrix


## ----matricesJoinIncompatable_introtoR-----------------------------------------------------------------------------------
recycledMatrix2 <- matrix(1:5,ncol=2,nrow=3)
recycledMatrix2


## ----matricesJoinIncompatableClip_introtoR-------------------------------------------------------------------------------
recycledMatrix3 <- rbind(recycledMatrix2,c(1:5))
recycledMatrix3


## ----matricesNames_introtoR----------------------------------------------------------------------------------------------
namedMatrix <- matrix(1:10,ncol=5,nrow=2)
colnames(namedMatrix) <- paste("Column",1:5,sep="_")
rownames(namedMatrix) <- paste("Row",1:2,sep="_")
namedMatrix


## ----matricesNamesColRow_introtoR----------------------------------------------------------------------------------------
colnames(namedMatrix)
rownames(namedMatrix)


## ----matricesIndexing_introtoR-------------------------------------------------------------------------------------------
narrowMatrix


## ----matricesIndexingShow_introtoR---------------------------------------------------------------------------------------
narrowMatrix


## ----matricesIndexingExample_introtoR------------------------------------------------------------------------------------
narrowMatrix[2,1]


## ----matricesIndexingExampleByCol_introtoR-------------------------------------------------------------------------------
narrowMatrix[,2]


## ----matricesIndexingExampleByRow_introtoR-------------------------------------------------------------------------------
narrowMatrix[3,]


## ----matricesIndexingExampleByMultipleRow_introtoR-----------------------------------------------------------------------
narrowMatrix[c(2,3),]


## ----matricesIndexingExampleByName_introtoR------------------------------------------------------------------------------
colnames(narrowMatrix) <- paste("Column",1:2,sep="_")
rownames(narrowMatrix) <- paste("Row",1:5,sep="_")
narrowMatrix[,"Column_1"]
narrowMatrix["Row_1",]
narrowMatrix["Row_1","Column_1"]


## ----matricesIndexingExampleByLogic_introtoR-----------------------------------------------------------------------------
narrowMatrix
narrowMatrix[,1]
narrowMatrix[,1] < 5


## ----matricesIndexingExampleByLogicRow_introtoR--------------------------------------------------------------------------
narrowMatrix[narrowMatrix[,1] < 5,]


## ----matricesArithmetric_introtoR----------------------------------------------------------------------------------------
narrowMatrix
narrowMatrix[1,1]+2
narrowMatrix[1,]+2
mean(narrowMatrix)



## ----matricesReplace_introtoR--------------------------------------------------------------------------------------------
narrowMatrix
narrowMatrix[1,1] <- 10
narrowMatrix[,2] <- 1
narrowMatrix


## ----matricesOneTypeOnlyNoError_introtoR,error=T-------------------------------------------------------------------------
narrowMatrix[,2] *2

## ----matricesOneTypeOnlyExampleForError_introtoR-------------------------------------------------------------------------
narrowMatrix[1,1] <- "Not_A_Number"
narrowMatrix


## ----matricesOneTypeOnlyWithError_introtoR,error=T-----------------------------------------------------------------------
narrowMatrix[,2] *2


## ----factorsIntro_introtoR-----------------------------------------------------------------------------------------------
vectorExample <- c("male","female","female","female")
factorExample <- factor(vectorExample)
factorExample
levels(factorExample)


## ----factorsSummaryFunction_introtoR-------------------------------------------------------------------------------------
summary(vectorExample)
summary(factorExample)


## ----factorsDisplayOrder_introtoR----------------------------------------------------------------------------------------
factorExample <- factor(vectorExample,levels=c("male","female"))
factorExample
summary(factorExample)


## ----factorsNominal_introtoR---------------------------------------------------------------------------------------------
factorExample <- factor(vectorExample,levels=c("male","female"))
factorExample[1] < factorExample[2]


## ----factorsOrdinal_introtoR---------------------------------------------------------------------------------------------
factorExample <- factor(c("small","big","big","small"),
                        ordered=TRUE,levels=c("small","big"))
factorExample
factorExample[1] < factorExample[2]


## ----factorsOrder_introtoR-----------------------------------------------------------------------------------------------
factorExample <- factor(c("small","big","big","small"))
factorExample[1] <- c("big")
factorExample

factorExample[1] <- c("huge")
factorExample



## ----factorsAddNew_introtoR----------------------------------------------------------------------------------------------
levels(factorExample) <- c("big","small","huge")
factorExample[1] <- c("huge")
factorExample


## ----dataframesIntro_introtoR--------------------------------------------------------------------------------------------
patientName <- c("patient1","patient2","patient3","patient4")
patientType <- factor(rep(c("male","female"),2))
survivalTime <- c(1,30,2,20)
dfExample <- data.frame(Name=patientName, Type=patientType,Survival_Time=survivalTime)
dfExample


## ----dataframesReplacement_introtoR--------------------------------------------------------------------------------------
dfExample
dfExample[dfExample[,"Survival_Time"] > 10,]


## ----dataframesReplacementbyDollar_introtoR------------------------------------------------------------------------------
dfExample <- data.frame(Name=patientName,Type=patientType,Survival_Time=survivalTime)
dfExample$Survival_Time
dfExample[dfExample$Survival_Time < 10,]


## ----dataframesIndexbyDollar_introtoR------------------------------------------------------------------------------------
dfExample$Surv


## ----dataframesIndexbyName_introtoR, eval=F------------------------------------------------------------------------------
## dfExample[,"Surv"]


## ----dataframesNewbyDollar_introtoR--------------------------------------------------------------------------------------
dfExample
dfExample$newColumn <- rep("newData",nrow(dfExample))
dfExample


## ----dataframesNoReplace_introtoR----------------------------------------------------------------------------------------
dfExample[dfExample[,"Survival_Time"] < 10,"Survival_Time"] <- 0
dfExample


## ----dataframesNoReplaceString_introtoR----------------------------------------------------------------------------------
dfExample[dfExample[,"Survival_Time"] < 10,"Name"] <- "patientX"
dfExample


## ----dataframesAndFactors_introtoR---------------------------------------------------------------------------------------
dfExample <- data.frame(Name=patientName,Type=patientType,
                        Survival_Time=survivalTime)

levels(dfExample[,"Name"]) <- c(levels(dfExample[,"Name"]) ,
                                "patientX")

dfExample[dfExample[,"Survival_Time"] < 10,"Name"] <- "patientX"
dfExample



## ----dataframesAndNoFactors_introtoR-------------------------------------------------------------------------------------
dfExample <- data.frame(Name=patientName,
                        Type=patientType,
                        Survival_Time=survivalTime,
                        stringsAsFactors = F)


dfExample[dfExample[,"Survival_Time"] < 10,"Name"] <- "patientX"
dfExample



## ----dataframesOrder_introtoR--------------------------------------------------------------------------------------------
testOrder <- c(2,1,3)
testOrder
testOrder[order(testOrder)]
testOrder[order(testOrder,decreasing=T)]


## ----dataframesOrderWithNA_introtoR--------------------------------------------------------------------------------------
testOrder <- c(2,1,NA,3)
testOrder[order(testOrder,decreasing=T,na.last=T)]
testOrder[order(testOrder,decreasing=T,na.last=F)]


## ----dataframesOrderDecreasing_introtoR----------------------------------------------------------------------------------
dfExample
dfExample[order(dfExample$Surv, decreasing=T),]


## ----dataframesOrderMultiple_introtoR------------------------------------------------------------------------------------
dfExample[order(dfExample$Type,
                dfExample$Survival,
                decreasing=T),]


## ----dataframesMergeData1_introtoR---------------------------------------------------------------------------------------
dfExample <- data.frame(Name=patientName,Type=patientType,
                        Survival_Time=survivalTime)
dfExample 


## ----dataframesMergeData2_introtoR---------------------------------------------------------------------------------------
dfExample2 <- data.frame(Name=patientName[1:3],
                        height=c(6.1,5.1,5.5))
dfExample2


## ----dataframesMerge_introtoR--------------------------------------------------------------------------------------------
mergedDF <- merge(dfExample,dfExample2,by=1,all=F)
mergedDF


## ----listsExample_introtoR-----------------------------------------------------------------------------------------------
firstElement <- c(1,2,3,4)
secondElement <- matrix(1:10,nrow=2,ncol=5)
thirdElement <- data.frame(colOne=c(1,2,4,5),colTwo=c("One","Two","Three","Four"))


## ----listsCreate_introtoR------------------------------------------------------------------------------------------------
myList <- list(firstElement,secondElement,thirdElement)
myList


## ----listsCreateNnames_introtoR------------------------------------------------------------------------------------------
myNamedList <- list(First=firstElement,Second=secondElement,
                    Third=thirdElement)
myNamedList


## ----listsCreateElements_introtoR----------------------------------------------------------------------------------------
myList <- list(firstElement,secondElement,thirdElement)
myList[1]
myList[[1]]


## ----listsIndexElements_introtoR-----------------------------------------------------------------------------------------
myNamedList$First


## ----listsCombine_introtoR-----------------------------------------------------------------------------------------------
myNamedList <- list(First=firstElement,Second=secondElement,
                    Third=thirdElement)
myNamedList <- c(myNamedList,list(fourth=c(4,4)))
myNamedList[c(1,4)]



## ---- listsCombineVector_introtoR----------------------------------------------------------------------------------------
myList <- c(myList,c(4,4))
myList[3:5]


## ----listsFlatten_introtoR-----------------------------------------------------------------------------------------------
myNamedList <- list(First=c(1,2,3),Second=c(2,6,7),Third=c(1,4,7))
myNamedList
flatList <- unlist(myNamedList)
flatList[1:7]


## ----listsFlattenToMatrix_introtoR---------------------------------------------------------------------------------------
myNamedList <- list(First=c(1,2,3),Second=c(2,6,7),Third=c(1,4,7))
flatList <- unlist(myNamedList)
listAsMat <- matrix(flatList,
                    nrow=length(myNamedList),
                    ncol=3,
                    byrow=T,
                    dimnames=list(names(myNamedList)))
listAsMat


## ----echo=F--------------------------------------------------------------------------------------------------------------
minRep <- rbind(cbind(matrix(rnorm(12,4),ncol=3,byrow = T),matrix(c(rnorm(9,4),rnorm(3,8)),ncol=3,byrow = T)),
cbind(matrix(rnorm(12,10),ncol=3,byrow = T),matrix(c(rnorm(6,3),rnorm(6,10)),ncol=3,byrow = T)))
colnames(minRep) <- paste0(c("Sample_"),
                      1:5,".",sort(rep(c("hi","low"),3)))
minRepdf <- data.frame(Gene_Name=paste("Gene",letters[1:8],sep="_"),minRep)
#minRepdf$Gene_Name <- paste("Gene",letters[1:8],sep="_")
#write.table(minRepdf,file="readThisTable.csv",sep=",",row.names=F)
kable(minRepdf[,1:4], format='html')



## ----echo=T--------------------------------------------------------------------------------------------------------------
Table <- read.table("data/readThisTable.csv",sep=",",header=T)
Table[1:4,1:3]


## ----echo=T--------------------------------------------------------------------------------------------------------------
Table <- read.table("data/readThisTable.csv",sep=",",header=T,row.names=1)
Table[1:4,1:3]


## ----echo=T--------------------------------------------------------------------------------------------------------------
Table <- read.table("data/readThisTable.csv",sep=",",header=T,stringsAsFactors=F)


## ----echo=T--------------------------------------------------------------------------------------------------------------
URL <- "http://rockefelleruniversity.github.io/readThisTable.csv"
Table <- read.table(URL,sep=",",header=T)
Table[1:2,1:3]


## ----eval=F--------------------------------------------------------------------------------------------------------------
## Table <- read.table(file="clipboard",sep=",",header=T)


## ----echo=T--------------------------------------------------------------------------------------------------------------
x <- scan("data/readThisTable.csv",sep=",",
what = c("character",rep("numeric", 6)),skip=1)
x[1:3]


## ----echo=T--------------------------------------------------------------------------------------------------------------
write.table(Table,file="data/writeThisTable.csv",sep=",")


## ----echo=T--------------------------------------------------------------------------------------------------------------
write.table(Table,file="data/writeThisTable.csv", sep=",", row.names =F,col.names=T)


## ----echo=T,eval=FALSE---------------------------------------------------------------------------------------------------
## install.packages("rio")


## ----echo=T,eval=TRUE----------------------------------------------------------------------------------------------------
library("rio")


## ----echo=T,eval=TRUE----------------------------------------------------------------------------------------------------
Table <- import("data/readThisTable.csv")
Table[1:2,]


## ----echo=T,eval=TRUE----------------------------------------------------------------------------------------------------
Table <- import("data/readThisXLS.xls", 
                which=2)
Table <- import("data/readThisXLS.xls", 
                which="Metadata")
Table[1:2,]


## ----echo=T,eval=TRUE----------------------------------------------------------------------------------------------------
Table <- import_list("data/readThisXLS.xls")
names(Table)


## ----echo=T,eval=TRUE----------------------------------------------------------------------------------------------------
## Table[["ExpressionScores"]][1:2,]
Table$ExpressionScores[1:2,]
Table$Metadata[1:2,]


## ----echo=T,eval=TRUE----------------------------------------------------------------------------------------------------
ExpressionScores <- Table$ExpressionScores
export(ExpressionScores,file = "data/writeThisXLSX.xlsx")



## ----echo=T,eval=TRUE----------------------------------------------------------------------------------------------------
names(Table) <- c("expr","meta")
export(Table,file = "data/writeThisMultipleXLSX.xlsx")


