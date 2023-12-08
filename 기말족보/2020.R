library(tidyverse)

#1

myFb = function(k) {
  if (k < 3){
    return("k must be an integer greater than 2")
  }
  res <- vector("double",k)
  res[1]<-0;res[2]<-1
  for(i in 1:(k-2)){
    res[i+2] = res[i]+res[i+1]
  }
  return(res)
}

myFb(6)
myFb(15)
myFb(2)

#2

mpg %>% filter(drv %in% c('4','f')) %>% 
  mutate(rhc = (hwy + cty)/2) %>% 
  ggplot(mapping = aes(x=drv,y=rhc)) + 
  geom_boxplot() +
  facet_wrap(~year)
  
#3

mpg %>% View()

mpg %>% 
  filter(drv %in% c('4','f')) %>% 
  group_by(drv) %>% 
  summarise(cty_Mean = mean(cty), hwy_Mean = mean(hwy), ratio = cty_Mean/hwy_Mean)

#4
rm(list=ls())
fmax=function(x){
  tmax=x[1]
  smax=-Inf
  k=length(x) 
  for(i in 2:k) {
    if (tmax <x[i]) {smax=tmax;tmax=x[i]}
    else if (smax < x[i]){smax= x[i]}
  }
  return(list(smax = smax, tmax = tmax))
}

x=c(5,3,9,3,7,5,1)
fmax(x)

#5

mu <- c(x1=-5, x2=5) 
sigma <- c(x1=2, x2=1) 

set.seed(123456)
map_dfc(.x=list("x1","x2"), ~ rnorm(n = 3, mean = mu[.x], sd = sigma[.x]))%>% 
  rename(x1 = ...1, x2= ...2)
