#1번 문제

ff=data.frame(c("2018-02-08","2018-01-05"),
              c("2018-02-16","2018-01-07"))
#1번 정답
#a
data.frame(DAYS=paste(c((as.Date(ff[[2]][1])) - as.numeric(as.Date(ff[[1]][1])) + 1,as.numeric(as.Date(ff[[2]][2])) - as.numeric(as.Date(ff[[1]][2])) + 1),"days"))
#b
data.frame(DAYS=c(as.Date(ff[[2]]) - as.Date(ff[[1]]))+1)

#2번 문제
qqq=list(matrix(c("a","b","c","d"),nrow=2),b1=c(1,2))

#2번 정답
#a
paste(c(qqq[[1]][1],qqq[[1]][2]),c(qqq[[2]][1],qqq[[2]][2]), sep="")
#b
paste(qqq[[1]][,1], qqq$b1, sep="")

#3번 문제
q1=c(73,18,83,52,70,66)

#3번 정답

#a
sum(q1[seq(from=3,to=length(q1))] > q1[seq(from=1,to=length(q1)-2)])
#b
sum(diff(q1, lag=2)>0)

#4번 문제

q1=c(73,18,83,52,70,66)
aa=!max(q1)==q1
bb=cumsum(aa)

#4번 정답

#(a)
bb[bb[seq(from=2,to=length(bb))] - bb[seq(from=1,to=length(bb)-1)] == 0] + 1
#(b)

bb[diff(bb)==0] + 1

#5번 문제

ee=data.frame(x=5:7)
y=8:6

#5번 정답
tibble(w= ee$x, y, z= abs(ee$x-y))

#1
data.frame(DAYS=c(as.Date(ff[[2]])-as.Date(ff[[1]])+1))
#2
paste(qqq[[1]][,1],qqq[[2]],sep="")
#3
sum(q1[c(-length(q1),-(length(q1)-1))]<q1[c(-1,-2)])
#4
sum(bb<c(1:length(bb)))-1
#5
tibble(w=ee$x, y, z=abs(y-ee$x))
