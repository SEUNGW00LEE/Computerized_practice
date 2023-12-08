2022-1

y=c(2,5,1,7,9,-1,-3)

fpop=function(x, k, ...) {
  w = sort(x,...)[k]
  w
  }
fpop(y,2)

2022-2

myFb=function(k) {
  if (k < 3) return("k must be an integer greater than 2")
  res <- vector("double", k) 
  res[1] <- 0; res[2] <- 1 
  hap=1
  for (i in 1:(k-2)) {
    res[i+2] <- res[i]+res[i+1]
    hap = hap + res[i+2]
  }
  return(list(fb=res,ave = hap/k))
}
myFb(15)

2022-3

kk1=tibble(name=rep(c("Park","Lee","Kim"),3), sell=c(14,21,15,12,16,5,4,8,10),
           item=rep( c("A","B","C"),each=3))
kk1 %>% group_by(name) %>% distinct
kk1 %>% dplyr::select(name, sell) %>% group_by(name) %>% summarise(msel = sum(sell)/3)

kk1 %>% group_by(name) %>% summarise(msel = mean(sell)) %>% arrange(desc(name))
kk1 %>% group_by(name) %>% mutate(total_sell = sum(sell)) %>% rowwise() %>% summarise(name,msel= total_sell/3) %>% distinct(name,msel)

2022-4

ggplot(data=mpg, mapping=aes(x=displ, y=hwy)) +
  geom_point(data=mpg %>% filter(drv==c('f','r')),mapping=aes(color=drv,shape=drv))+
  geom_smooth(se=FALSE,color="black")

2022-5  

data(Cars93, package="MASS")
with(Cars93, tapply(MPG.city,Origin, function(x) max(x) - min(x)))  


2020-1

myFb=function(k) {
  if(k<3){
    return("k must be an integer greater than 2")
  }
  res <- vector("double", k)
  res[1] = 0; res[2] = 1
  for(i in 1:(k-2)){
    res[i+2] = res[i] + res[i+1]
  }
  return(res)
}
myFb(6)
myFb(15)
myFb(2)

2020-2

mpg %>%
  filter(drv %in% c('4','f'))  %>%
  mutate(rhc=(hwy+cty)/2) %>% 
  ggplot(mapping=aes(x=drv,y=rhc)) +
  geom_boxplot() +
  facet_wrap(~year)

2020-3

mpg %>% 
  filter(drv %in% c('4','f')) %>% 
  group_by(drv) %>% 
  summarise(cty_Mean = mean(cty),
            hwy_Mean = mean(hwy),
            ratio = cty_Mean / hwy_Mean) 

2020-4

fmax=function(x) { 
  tmax=x[1]
  smax=-Inf
  k=length(x)
  for(i in 2:k) {
  if (tmax <x[i]) {smax=tmax;tmax=x[i]}
  else if (x[i]<tmax & smax < x[i]) {smax=x[i]}
  }
  return(list(smax=smax,tmax=tmax))
}
x=c(5,3,9,9,7,5,1)
fmax(x)

2020-5

set.seed(123456)
mu <- c(x1=-5, x2=5)
sigma<- c(x1=2,x2=1)
map_dfc(mu, ~rnorm(mean=mu,sd=sigma,n=3))
map2_dfc(.x=mu, .y=sigma, rnorm, n=3)

