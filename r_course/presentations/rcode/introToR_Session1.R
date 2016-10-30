## ----eval=F--------------------------------------------------------------
## setwd("/PathToMyDownload/Reproducible-R")
## # e.g. setwd("~/Downloads/Reproducible-R")

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

## ------------------------------------------------------------------------
treatment <- c(0.02,1.8, 17.5, 55,75.7, 80)

## ----eval=FALSE----------------------------------------------------------
## plot(treatment)

## ---- echo=FALSE,fig.width=8,fig.height=4.5,dpi=300,out.width="1920px",height="1080px"----
plot(treatment)

## ----eval=FALSE----------------------------------------------------------
## plot(treatment, type="o", col="blue")

## ----eval=FALSE----------------------------------------------------------
## title(main="Treatment", col.main="red", font.main=4)

## ----echo=FALSE,fig.width=8,fig.height=4.5,dpi=300,out.width="1920px",height="1080px"----
plot(treatment, type="o", col="blue")
title(main="Treatment", col.main="red", font.main=4)

## ----eval=TRUE-----------------------------------------------------------
control <- c(0, 20, 40, 60, 80,100)

## ----eval=FALSE----------------------------------------------------------
## plot(treatment, type="o", col="blue", ylim=c(0,100))

## ----eval=FALSE----------------------------------------------------------
## lines(control, type="o", pch=22, lty=2, col="red")

## ----eval=FALSE----------------------------------------------------------
## title(main="Expression Data", col.main="red", font.main=4)

## ----echo=FALSE,fig.width=8,fig.height=4.5,dpi=300,out.width="1920px",height="1080px"----
plot(treatment, type="o", col="blue", ylim=c(0,100))
lines(control, type="o", pch=22, lty=2, col="red")
title(main="Expression Data", col.main="red", font.main=4)

## ------------------------------------------------------------------------
g_range <- range(0, treatment, control)

## ----eval=FALSE----------------------------------------------------------
## plot(treatment, type="o", col="blue", ylim=g_range,axes=FALSE, ann=FALSE)

## ----eval=FALSE----------------------------------------------------------
## axis(1, at=1:6, lab=c("Mon","Tue","Wed","Thu","Fri","Sat"))

## ----eval=FALSE----------------------------------------------------------
## axis(2, las=1, at=20*0:g_range[2])

## ----eval=FALSE----------------------------------------------------------
## box()

## ----eval=FALSE----------------------------------------------------------
## lines(control, type="o", pch=22, lty=2, col="red")

## ----eval=FALSE----------------------------------------------------------
## title(main="Data", col.main="red", font.main=4)

## ----eval=FALSE----------------------------------------------------------
## title(xlab="Days", col.lab=rgb(0,0.5,0))
## title(ylab="Values", col.lab=rgb(0,0.5,0))

## ----eval=FALSE----------------------------------------------------------
## legend(1, g_range[2], c("treatment","control"), cex=0.8, col=c("blue","red"), pch=21:22, lty=1:2);

## ----echo=FALSE,fig.width=8,fig.height=3.5,dpi=300,out.width="1920px",height="1080px"----
plot(treatment, type="o", col="blue", ylim=g_range,axes=FALSE, ann=FALSE)
axis(1, at=1:6, lab=c("Mon","Tue","Wed","Thu","Fri","Sat"))
axis(2, las=1, at=20*0:g_range[2])
box()

lines(control, type="o", pch=22, lty=2, col="red")
title(main="Data", col.main="red", font.main=4)
title(xlab="Days", col.lab=rgb(0,0.5,0))
title(ylab="Values", col.lab=rgb(0,0.5,0))
legend(1, g_range[2], c("treatment","control"), cex=0.8, col=c("blue","red"), pch=21:22, lty=1:2);  

## ----eval=FALSE----------------------------------------------------------
## barplot(treatment)

## ----echo=FALSE,fig.width=8,fig.height=4,dpi=300,out.width="1920px",height="1080px"----
barplot(treatment)

## ------------------------------------------------------------------------
data <- read.table("data/example.txt", header=T, sep="\t")

## ----eval=FALSE----------------------------------------------------------
## barplot(data$treatment, main="Treatment", xlab="Days",ylab="values", names.arg=c("Mon","Tue","Wed","Thu","Fri","Sat"),  border="blue", density=c(10,20,30,40,50,60))

## ----echo=FALSE,fig.width=8,fig.height=4.5,dpi=300,out.width="1920px",height="1080px"----
barplot(data$treatment, main="Treatment", xlab="Days",ylab="values", names.arg=c("Mon","Tue","Wed","Thu","Fri","Sat"),  border="blue", density=c(10,20,30,40,50,60))

## ----eval=FALSE----------------------------------------------------------
## barplot(as.matrix(data), main="Data", ylab= "Total", beside=TRUE, col= c("lightblue", "mistyrose", "lightcyan","lavender", "cornsilk","maroon"))

## ----eval=FALSE----------------------------------------------------------
## legend("topleft", c("Mon","Tue","Wed","Thu","Fri","Sat"), cex=0.8,bty="n",
## fill=  c("lightblue", "mistyrose", "lightcyan","lavender", "cornsilk","maroon"));

## ----echo=FALSE,fig.width=8,fig.height=4.5,dpi=300,out.width="1920px",height="1080px"----
barplot(as.matrix(data), main="Data", ylab= "Total", beside=TRUE, col= c("lightblue", "mistyrose", "lightcyan","lavender", "cornsilk","maroon"))
legend("topleft", c("Mon","Tue","Wed","Thu","Fri","Sat"), cex=0.8,bty="n", 
fill=  c("lightblue", "mistyrose", "lightcyan","lavender", "cornsilk","maroon"));


## ----eval=FALSE----------------------------------------------------------
## hist(treatment)	

## ----echo=FALSE,fig.width=8,fig.height=3,dpi=300,out.width="1920px",height="1080px"----
hist(treatment)  

## ------------------------------------------------------------------------
all <- c(data$control, data$treatment)

## ----eval=FALSE----------------------------------------------------------
## hist(all, col="lightblue", ylim=c(0,10))

## ----echo=FALSE,fig.width=5,fig.height=5,dpi=300,out.width="1920px",height="1080px"----
hist(all, col="lightblue", ylim=c(0,10))

## ------------------------------------------------------------------------
max_num <- max(all)

## ----eval=FALSE----------------------------------------------------------
## hist(all, col=heat.colors(max_num), breaks=max_num, xlim=c(0,max_num), right=F,
## main="Histogram", las=1)	

## ----echo=FALSE,fig.width=8,fig.height=4.5,dpi=300,out.width="1920px",height="1080px"----
hist(all, col=heat.colors(max_num), breaks=max_num, xlim=c(0,max_num), right=F, 
main="Histogram", las=1)  

## ------------------------------------------------------------------------
brk <- c(0,30,40,50,60,80,100)

## ----eval=FALSE----------------------------------------------------------
## 
## hist(all, col=heat.colors(length(brk)), breaks=brk,xlim=c(0,max_num), right=F, main="Probability Density",las=1, cex.axis=0.8, freq=F)

## ----echo=FALSE,fig.width=4,fig.height=3,dpi=300,out.width="1920px",height="1080px"----

hist(all, col=heat.colors(length(brk)), breaks=brk,xlim=c(0,max_num), right=F, main="Probability Density",las=1, cex.axis=0.8, freq=F)

## ----eval=FALSE----------------------------------------------------------
## pie(treatment)

## ----echo=FALSE,fig.width=8,fig.height=4.5,dpi=300,out.width="1920px",height="1080px"----
pie(treatment)

## ----eval=FALSE----------------------------------------------------------
## pie(treatment, main="Treatment", col= c("lightblue", "mistyrose", "lightcyan","lavender", "cornsilk","maroon"),
##     labels=c("Mon","Tue","Wed","Thu","Fri","Sat"))	

## ----echo=FALSE,fig.width=5,fig.height=3,dpi=300,out.width="1920px",height="1080px"----
pie(treatment, main="Treatment", col= c("lightblue", "mistyrose", "lightcyan","lavender", "cornsilk","maroon"),labels=c("Mon","Tue","Wed","Thu","Fri","Sat"),cex=1)  

## ------------------------------------------------------------------------
colors <- c("white","grey70","grey90","grey50","black")

## ------------------------------------------------------------------------
treatment_labels <- round(treatment/sum(treatment) * 100, 1)

## ------------------------------------------------------------------------
treatment_labels <- paste(treatment_labels, "%", sep="")

## ----eval=FALSE----------------------------------------------------------
## pie(treatment, main="treatment", col=colors, labels= treatment_labels,cex=0.8)

## ----eval=FALSE----------------------------------------------------------
## legend(1.5, 0.5, c("Mon","Tue","Wed","Thu","Fri","Sat"), cex=0.8,fill=colors)	

## ----echo=FALSE,fig.width=8,fig.height=5,dpi=300,out.width="1920px",height="1080px"----
pie(treatment, main="treatment", col=colors, labels= treatment_labels,cex=0.8)
legend(1.5, 0.5, c("Mon","Tue","Wed","Thu","Fri","Sat"), cex=0.8,fill=colors)  

## ----eval=FALSE----------------------------------------------------------
## dotchart(t(data))	

## ----echo=FALSE,fig.width=8,fig.height=4,dpi=300,out.width="1920px",height="1080px"----
dotchart(t(data))  

## ----eval=FALSE----------------------------------------------------------
## dotchart(t(data), color=c("red","blue","darkgreen"),main="Dotchart", cex=0.8)	

## ----echo=FALSE,fig.width=6,fig.height=3.5,dpi=300,out.width="1920px",height="1080px"----
dotchart(t(data), color=c("red","blue","darkgreen"),main="Dotchart", cex=0.8)  

## ------------------------------------------------------------------------
par(mfrow=c(2,2))

## ------------------------------------------------------------------------
data1 <- read.table("data/gene_data.txt", header=T, sep="\t")
head(data1)

## ----eval=FALSE----------------------------------------------------------
## hist(data1$Untreated1)
## hist(data1$Treated2)
## hist(data1$Untreated2)
## boxplot(data1$Treated1)

## ----echo=FALSE,fig.width=8,fig.height=5,dpi=300,out.width="490px",height="270px"----
hist(data1$Untreated1)
hist(data1$Treated2)
hist(data1$Untreated2)
boxplot(data1$Treated1)

## ----eval=FALSE----------------------------------------------------------
## bmp(filename, width = 480, height = 480, units = "px", point-size = 12)
## jpeg(filename, width = 480, height = 480, units = "px", point-size = 12, quality = 75)

## ----eval=FALSE----------------------------------------------------------
## bmp(file = "control.bmp")
## plot(control)
## dev.off()

## ----eval=FALSE----------------------------------------------------------
## jpeg(file = "control.jpg", quality = 20)
## plot(control)
## dev.off()

## ----eval=FALSE----------------------------------------------------------
## postscript(file = "control.ps")
## plot(control)
## dev.off()

## ----eval=FALSE----------------------------------------------------------
## 
## pdf(file = "control.pdf", paper = "A4")
## plot(control)
## dev.off()

## ------------------------------------------------------------------------
library(lattice)

## ------------------------------------------------------------------------
data <- read.table("data/gene_data.txt", header=T, sep="\t")

## ----eval=FALSE----------------------------------------------------------
## xyplot(Untreated2~Treated2, data=data)

## ----echo=FALSE,fig.width=8,fig.height=5,dpi=300,out.width="1920px",height="1080px"----
xyplot(Untreated2~Treated2, data=data)

## ------------------------------------------------------------------------
tplot<-xyplot(Untreated2~Treated2, data=data)

## ----eval=FALSE----------------------------------------------------------
## print(tplot)

## ----echo=FALSE,fig.width=4,fig.height=3,dpi=300,out.width="1920px",height="1080px"----
print(tplot)

## ----eval=T,fig.width=4,fig.height=3,dpi=300,out.width="1920px",height="1080px"----
tplot2<-update(tplot, main="Drug treatment  in Cells" )
               
print(tplot2)

## ------------------------------------------------------------------------
head(singer)

## ----eval=FALSE----------------------------------------------------------
## 
## bwplot(voice.part ~ height, data=singer, xlab="Height (inches)")

## ----echo=FALSE,fig.width=8,fig.height=5,dpi=300,out.width="1920px",height="1080px"----
bwplot(voice.part ~ height, data=singer, xlab="Height (inches)")

## ----eval=FALSE----------------------------------------------------------
## densityplot( ~ height | voice.part, data = singer, layout = c(2, 4), xlab = "Height (inches)", bw = 5)

## ----eval=FALSE----------------------------------------------------------
## qqmath(~ rnorm(100), distribution = function(p) qt(p, df = 10))
## 

## ----echo=FALSE,fig.width=8,fig.height=5,dpi=300,out.width="1920px",height="1080px"----
qqmath(~ rnorm(100), distribution = function(p) qt(p, df = 10))

## ------------------------------------------------------------------------
library(ggplot2)
head(iris, n = 3)  

## ----eval=FALSE----------------------------------------------------------
## head(iris, n = 10)

## ----eval=FALSE----------------------------------------------------------
## qplot(Sepal.Length, Petal.Length, data = iris)

## ----eval=FALSE----------------------------------------------------------
## qplot(Sepal.Length, Petal.Length, data = iris, color = Species)

## ----eval=FALSE----------------------------------------------------------
## qplot(Sepal.Length, Petal.Length, data = iris, color = Species, size = Petal.Width)

## ----echo=FALSE,fig.width=4,fig.height=3,dpi=300,out.width="1920px",height="1080px"----
qplot(Sepal.Length, Petal.Length, data = iris, color = Species, size = Petal.Width)

## ----eval=FALSE----------------------------------------------------------
## qplot(Sepal.Length, Petal.Length, data = iris, color = Species, xlab = "Sepal Length", ylab = "Petal Length", main = "Sepal vs. Petal Length in Fisher's Iris data")

## ----eval=FALSE----------------------------------------------------------
## qplot(Sepal.Length, Petal.Length, data = iris, geom = "point")
## qplot(Sepal.Length, Petal.Length, data = iris)

## ------------------------------------------------------------------------
movies = data.frame(
    director = c("spielberg", "spielberg", "spielberg", "jackson", "jackson"),
    movie = c("jaws", "avatar", "schindler's list", "lotr", "king kong"),
    minutes = c(124, 163, 195, 600, 187)
)

## ----eval=FALSE----------------------------------------------------------
## qplot(director, data = movies, geom = "bar", ylab = "# movies")

## ----eval=FALSE----------------------------------------------------------
## qplot(director, weight = minutes, data = movies, geom = "bar", ylab = "total length (min.)")

## ----eval=FALSE----------------------------------------------------------
## qplot(Sepal.Length, Petal.Length, data = iris, geom = "line", color = Species)

## ----eval=FALSE----------------------------------------------------------
## qplot(age, circumference, data = Orange, geom = "line", colour = Tree,
##     main = "How does orange tree circumference vary with age?")

## ----echo=FALSE,fig.width=4,fig.height=3,dpi=300,out.width="1920px",height="1080px"----
qplot(age, circumference, data = Orange, geom = "line", colour = Tree,
    main = "Does tree circumference vary with age?")

## ----eval=FALSE----------------------------------------------------------
## qplot(age, circumference, data = Orange, geom = c("point", "line"), colour = Tree)

## ----echo=FALSE,fig.width=4,fig.height=3,dpi=300,out.width="1920px",height="1080px"----
qplot(age, circumference, data = Orange, geom = c("point", "line"), colour = Tree)

## ------------------------------------------------------------------------
patientName <- c("patient1","patient2","patient3","patient4")
patientType <- factor(rep(c("male","female"),2))
survivalTime <- c(1,30,2,20)
dfExample <- data.frame(Name=patientName,Type=patientType,Survival_Time=survivalTime)

## ------------------------------------------------------------------------
table(patientType)

## ------------------------------------------------------------------------
summary(dfExample)

## ------------------------------------------------------------------------
table(dfExample)

## ------------------------------------------------------------------------
ftable(dfExample)

## ------------------------------------------------------------------------
x <- rnorm(100,10,2)
z <- rnorm(100,10,2)
y <- x
cor(x,y) # 
cor(x,-y)
cor(x,z)

## ----echo=F--------------------------------------------------------------
par(mfrow=c(3,1))
plot(x,y) # 
plot(x,-y)
plot(x,z)

par(mfrow=c(1,1))

## ----echo=F--------------------------------------------------------------
kable(minRep[1:2,])

## ----eval=F--------------------------------------------------------------
## cor(minRep)[1:2,2:5]

## ----echo=F--------------------------------------------------------------
cor(minRep)[1:2,2:5,drop=F]

## ----eval=F,echo=T,fig.width=4,fig.height=3,dpi=300,out.width="1920px",height="1080px"----
## image(cor(minRep),axes=F)
## axis(1,at=seq(0,1,length.out=6), colnames(minRep))
## axis(2,at=seq(0,1,length.out=6), colnames(minRep))

## ----eval=T,echo=F,fig.width=4,fig.height=3,dpi=300,out.width="1920px",height="1080px"----
image(cor(minRep),axes=F)
axis(1,at=seq(0,1,length.out=6),gsub(".*_","",colnames(minRep)),las=2)
axis(2,at=seq(0,1,length.out=6),rev(gsub(".*_","",colnames(minRep))),las=2)

## ------------------------------------------------------------------------
rnorm(10,mean=8,sd=3)

## ------------------------------------------------------------------------
dnorm(8,mean=8,sd=3)

## ------------------------------------------------------------------------
pnorm(8,mean=8,sd=3)

## ------------------------------------------------------------------------
qnorm(0.5,mean=8,sd=3)

## ------------------------------------------------------------------------
tTestExample <- read.table("data/tTestData.csv",sep=",",header=T)
tTestExample

## ------------------------------------------------------------------------
var(tTestExample$A)
var(tTestExample$B)
var(tTestExample$C)

## ------------------------------------------------------------------------
var.test(tTestExample$A,tTestExample$B)
var.test(tTestExample$A,tTestExample$C)

## ------------------------------------------------------------------------
result <- var.test(tTestExample$A, tTestExample$B)
str(result)

## ------------------------------------------------------------------------
result$p.value

## ------------------------------------------------------------------------
result$statistic

## ------------------------------------------------------------------------
result$data.name

## ------------------------------------------------------------------------
Result <- t.test(tTestExample$A,tTestExample$B,alternative ="two.sided", var.equal = T)
Result

## ------------------------------------------------------------------------
Result <- t.test(tTestExample$A,tTestExample$C,alternative ="two.sided", var.equal = F)
Result


## ------------------------------------------------------------------------
longFrame <- data.frame(Group = c(rep("A",nrow(tTestExample)),rep("B",nrow(tTestExample))), Value=c(tTestExample$A,tTestExample$B))

result <- t.test(Value~Group,longFrame,alternative ="two.sided",
                 var.equal = T)
result

## ----echo=T,prompt=T-----------------------------------------------------
lmExample <- read.table("data/lmExample.txt",h=T,sep="\t")

## ----echo=T,prompt=T-----------------------------------------------------
lmResult <- lm(Y~X,data=lmExample)
plot(Y~X,data=lmExample,main="Line of best fit with lm()",
     xlim=c(0,150),ylim=c(0,200))
abline(lmResult,col="red",lty=3,lwd=3)

## ----echo=T,prompt=T-----------------------------------------------------
lmResult <- lm(Y~X,data=lmExample)
lmResult

## ----echo=T,prompt=T-----------------------------------------------------
plot(Y~X,data=lmExample,main="Line of best fit with lm()",
     xlim=c(0,100),ylim=c(0,200))
abline(lmResult,col="red",lty=3,lwd=3)

## ----prompt=T------------------------------------------------------------
summary(lmResult)

## ----prompt=T,echo=F-----------------------------------------------------
summary(lmResult)

## ----prompt=T,echo=T-----------------------------------------------------
summary(resid(lmResult))
summary(lmResult$residual)

## ----prompt=T,echo=F-----------------------------------------------------
summary(lmResult)

## ----prompt=T------------------------------------------------------------
summary(lmResult)

## ----prompt=F------------------------------------------------------------
SSE <- sum(resid(lmResult)^2)
TSS <- sum((lmExample$Y - mean(lmExample$Y))^2)
1- SSE/TSS
summary(lmResult)$r.squared

## ----prompt=F------------------------------------------------------------
MSE <- mean(lmResult$residuals^2)
RSS <- sum((predict(lmResult) - mean(lmExample$Y))^2)

summary(lmResult)$fstatistic


