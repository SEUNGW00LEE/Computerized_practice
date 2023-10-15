#학번 : 201912644 이름 : 이승우

#1

x=c(1,7,5,9,6,2)

sum(x[seq(2,length(x))]-x[seq(1,length(x)-1)]>0)
  
#2

abc=list(a=c(5,10),matrix(c(2,3,4,5,6,7),nrow=3))

abc[[2]]*rep(abc[[1]],each=3)


#3
x=c(1,7,5,9,6,2)
y=c(8,3)
k1=2
k2=5

append(append(x,y[1],k1),y[2],k2+(k1<=k2))


#4
library(tidyverse)
wyz=tibble(i=c("2018-02-08","2018-01-05"),e=c("2018-02-16","2018-01-07"))
hh="patcient"
gg=c(1,2)

paste0(hh,gg[1:2],":",as.Date(wyz[[2]]) - as.Date(wyz[[1]]) + 1)
paste(hh,gg[1:2],":",as.Date(wyz[[2]]) - as.Date(wyz[[1]]) + 1,sep="")
