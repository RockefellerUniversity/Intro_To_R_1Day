filesToRead <- dir("../ExpressionResults/",pattern = "*\\.txt",full.names=T)
fileRead <- vector("list",length=length(filesToRead))
for(i in 1:length(filesToRead)){
  fileRead[[i]] <- read.delim(filesToRead[i],header=F,sep="\t")
  colnames(fileRead[[i]]) <- c("GeneNames",basename(filesToRead[i]))
}
mergedTable <- NULL
for(i in fileRead){
  if(is.null(mergedTable)){
    mergedTable <- i
  }else{
    mergedTable <- merge(mergedTable,i,by=1,all=T)
  }
  
  print(nrow(mergedTable))
}

mergedTable[1:3,] 

Annotation <- read.table("../ExpressionResults/Annotation.ann",sep="\t",h=T)
annotatedExpression <- merge(Annotation,mergedTable,by=1,all.x=F,all.y=T)
annotatedExpression[1:2,]

table(Annotation$Pathway)
summary(Annotation$Pathway)
correlation <- cor(annotatedExpression[,grep("ExpressionResults",colnames(annotatedExpression))])

boxplot(annotatedExpression[,grep("ExpressionResults",colnames(annotatedExpression))],
        horizontal=T,las=2,names=gsub("ExpressionResults|\\.txt","",colnames(annotatedExpression[,grep("ExpressionResults",colnames(annotatedExpression))])))

indexGroupOne <- grep("[1-5].txt",colnames(annotatedExpression))
indexGroupTwo <- grep("[6-9,0].txt",colnames(annotatedExpression))
ttestResults <- apply(annotatedExpression,1,function(x) t.test(as.numeric(x[indexGroupOne]),as.numeric(x[indexGroupTwo])))


str(ttestResults[[1]])

testResult <- sapply(ttestResults,function(x) c(log2(x$estimate[2]) - log2(x$estimate[1]), x$statistic,x$p.value))
testResult <- t(testResult)
colnames(testResult) <- c("logFC","tStatistic","pValue")
annotatedResult <- cbind(annotatedExpression[,1:3],testResult)
annotatedResult <- annotatedResult[order(annotatedResult$tStatistic),]
annotatedResult[1:2,]