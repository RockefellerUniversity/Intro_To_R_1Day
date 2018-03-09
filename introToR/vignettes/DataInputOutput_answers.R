## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = T,eval = T)

## ----message=T-----------------------------------------------------------

geneExpr <- system.file("extdata", "/data/GeneExpression.txt", package = "introToR")

geneExprMeth <- system.file("extdata", "data/GeneExpressionWithMethods.txt", package = "introToR")

geneExprNotes <- system.file("extdata", "data/GeneExpressionWithNotes.txt", package = "introToR")

#geneExpression <- read.table("../data/GeneExpression.txt",h=T,sep="\t",row.names=1)
geneExpression <- read.table(geneExpr,h=T,sep="\t",row.names=1)

## ----message=T-----------------------------------------------------------
sampleMeans <- c(mean(geneExpression[,1]),mean(geneExpression[,2]),mean(geneExpression[,3]),mean(geneExpression[,4]),mean(geneExpression[,5]),mean(geneExpression[,5]))
names(sampleMeans) <- colnames(geneExpression)
sampleMeans
# Alternatively we could use the colMeans() function.
colMeans(geneExpression)

## ----message=T-----------------------------------------------------------
#geneExpression <- read.table("../data/GeneExpressionWithMethods.txt",h=T,sep="\t",row.names=1,skip=3)
geneExpression <- read.table(geneExprMeth,h=T,sep="\t",row.names=1,skip=3)
geneExpression

## ----message=T-----------------------------------------------------------
#geneExpression <- read.table("../data/GeneExpressionWithNotes.txt",h=T,sep="\t",row.names=1,comment.char = ">")
geneExpression <- read.table(geneExprNotes,h=T,sep="\t",row.names=1,comment.char = ">")
geneExpression

## ----message=T-----------------------------------------------------------
#geneExpression <- read.table("../data/GeneExpression.txt",h=T,sep="\t",row.names=1)
geneExpression <- read.table(geneExpr,h=T,sep="\t",row.names=1)
orderedExpression <- geneExpression[order(geneExpression$Sample_1.hi,decreasing=T),]
expressionDF <- cbind(rownames(orderedExpression),orderedExpression)
colnames(expressionDF)[1] <- "geneNames"
write.table(expressionDF,"orderedExpression.txt",sep=",",col.names = T,row.names=F)

