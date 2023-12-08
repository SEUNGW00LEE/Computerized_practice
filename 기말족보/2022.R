rm(list=ls())
install.packages("tidyverse")
library(tidyverse)
#1
y=c(2,5,1,7,9,-1,-3)
fpop=function(x, k, ...) {
  w = sort(x,...)[k]
  w
}

fpop(y,2)

fpop(y,2,decreasing=T)

#2
rm(list=ls())
k=15
res <- vector("double", k) 
res[1] <- 0; res[2] <- 1 
for (i in 1:(k-2)) {
  res[i+2] <- res[i]+res[i+1]
  return(res)
}

myFb=function(k) {
  if (k < 3) return("k must be an integer greater than 2")
  res <- vector("double", k) 
  res[1] <- 0; res[2] <- 1 
  hap=1
  for (i in 1:(k-2)) {
    res[i+2] <- res[i]+res[i+1]
    hap = hap + res[i+2]
  }
  list(fb = res , ave = hap/k)
  }

#3

kk1=tibble(name=rep(c("Park","Lee","Kim"),3), 
           sell=c(14,21,15,12,16,5,4,8,10),
           item=rep( c("A","B","C"),each=3)) 

kk1 %>% group_by(name) %>% summarise(msel=mean(sell))

#4

ggplot(data=mpg,mapping=aes(x=displ, y=hwy)) +
  geom_point(data = mpg %>% filter(drv != '4'), mapping=aes(color=drv,shape=drv)) +
  geom_smooth(se=FALSE)

#5
library(MASS)
data(Cars93, package = "MASS")
Cars93 %>% View()
with(Cars93, tapply(MPG.city,Origin, function(x) max(x) - min(x)))


     