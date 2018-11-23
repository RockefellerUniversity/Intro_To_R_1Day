sample1 <- rnorm(100,100,20)
sample2 <- rnorm(100,200,20)
hist(sample1)
hist(sample2)
res <- t.test(sample1,sample2)
res
boxplot(sample1,sample2,col=c("red","green"))
summary(sample1)
summary(sample2)
sessionInfo()

