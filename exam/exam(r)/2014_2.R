rm(list=ls())
#1
q1=c(88,72,32,65,28,16)
mean(q1[q1<=20|q1>=70])

#2
q1=c(88,72,32,65,28,16)

as.character(cut(q1, breaks=c(-Inf, 60 ,Inf), labels=c("B","A")) )

#4
q1=c(88,72,32,65,28,16)

#5

help.search("genotype")
library(MASS)
head(genotype,2)

head(women$height+women$weight,5)

x=matrix(c(1,1,1,3,7,2),3)
y=c(5,2,1)
x
y         
solve(t(x) %*% diag(y) %*% x) -diag(2)

