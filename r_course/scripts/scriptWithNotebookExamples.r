#' ---
#' title: "CWB making notes example"
#' author: "Tom Carroll"
#' date: "Day 3 of CWB"
#' ---
#' Generate random numbers for sample 1 and sample 2
sample1 <- rnorm(100,100,20)
sample2 <- rnorm(100,200,20)
#' Histogram for sample 1
#+ fig.width=3, fig.height=3
hist(sample1)
#' Histogram for sample 1
#+ fig.width=3, fig.height=3
hist(sample2)
#' Perform t-test
res <- t.test(sample1,sample2)
res
#' Boxplot of Results
#+ fig.width=5, fig.height=5
boxplot(sample1,sample2,col=c("red","green"))
#' Summary for sample 1
summary(sample1)
#' Summary for sample 2
summary(sample2)

#' Session Information
sessionInfo()

