rm(list=ls())

q1 = c(88,72,32,65,28,16)

mean(q1[q1>=70 | q1<=20])

q1 = c(88,72,32,65,28,16)
q2 = as.character(factor(q1>=60, labels=c("B","A")))
q3 = cut(q1, breaks=c(0, 60,100), labels=c("B","A"))
q2
q3()

q2 = cut(q1, breaks=c(-Inf, 60, Inf), labels=c("B", "A"))

(q1[seq(1,length(q1)-1)] + q1[seq(2,length(q1))] )/ 2
q1
c(q1[q1<60],q1[q1>=60]+1)

help.search("genotype")
library(MASS)
head(genotype, 2)

head(women)
head(women$height + women$weight, 5)


