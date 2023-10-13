#1

ff = data.frame(c("2018-02-08","2018-01-05"),c("2018-02-16","2018-01-07"))
ff[[1]]
ff[[2]]
data.frame(DAYS=as.Date(ff[[2]])-as.Date(ff[[1]])+1)

#2

qqq = list(matrix(c("a","b","c","d"),nrow=2),b1=c(1,2))

paste0(qqq[[1]][1:2],qqq[[2]][1:2])

#3

q1=c(73,18,83,52,70,66)

sum(q1[seq(3,length(q1),1)]-q1[seq(1,length(q1)-2,1)]>0)

#4

q1=c(73,18,83,70,66)
aa=!max(q1)==q1
bb=cumsum(aa)

bb[bb[seq(2,length(bb),1)]-bb[seq(1,length(bb)-1,1)]==0]+1

sum(bb == c(1:length(bb)))+1






#5

ee=data.frame(x=5:7)
y=8:6
tibble(w=ee$x, y, z=abs(w-y))
