#1
aa=data.frame(x1=c("11","12"), y1=c(T,F), z1=factor(c(2,5)))

matrix(c(as.numeric(aa[[1]]),as.numeric(aa[[2]]),as.numeric(as.character(aa[[3]]))),nrow=2)

cbind(as.numeric(aa[[1]]),as.numeric(aa[[2]]),as.numeric(as.character(aa[[3]])))

#2

abc=list(a=c(5,10),matrix(c(1,1,1,2,2,2),nrow=2,byrow=T))

abc[[1]] * abc[[2]]

#3

q1=c(18,72,87,29,26,52)

mean(q1[seq(1,length(q1),2)] / q1[seq(2,length(q1),2)])

#4

y2=as.Date("2020-09-20")

seq(seq(seq(y2, by="year",length=8)[8],by="month",length=3)[3],by="day",length=20)[20]

#5

q4= c("F","M","F","F","M","F","R","R","R")

sum(q4=="F") - sum(q4=="M")
c(M=abs(sum(q4=="F") - sum(q4=="M")), R=abs(sum(q4=="M")-sum(q4=="R")))
