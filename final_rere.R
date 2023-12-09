4장
rm(list=ls())
library(dplyr)
library(tidyverse)
mtcars %>% as_tibble() %>% 
  filter(mpg >= median(mpg), mpg <= quantile(mpg, prob=0.75))%>% 
  print(n=3)

airquality %>% as_tibble() %>% 
  filter(is.na(Ozone) | is.na(Solar.R)) %>% 
  print(n=3)

iris %>% 
  as_tibble() %>% 
  slice(5:10)

iris %>% 
  as_tibble() %>% 
  slice(-(5:10))

iris %>% 
  as_tibble() %>% 
  slice(n())

iris %>% 
  as_tibble() %>% 
  slice_head(n=3)

iris %>% 
  as_tibble() -> iris_t

iris_t %>% 
  slice_sample(n=5)

iris_t %>% 
  slice_sample(prop = 0.02)

iris_t %>% 
  arrange(desc(Petal.Length)) %>% 
  slice_head(n=2)

iris_t %>% 
  slice_min(Petal.Length, n=2)

mtcars %>% arrange(mpg)
mtcars %>% arrange(mpg, desc(wt))

airquality %>% 
  filter(Month ==5, Day %in% c(1:10)) %>% 
  arrange(Ozone) %>% 
  arrange(!is.na(Ozone))


airquality %>% 
  filter(Month ==5, Day %in% c(1:10)) %>% 
  arrange(desc(Ozone)) %>% 
  arrange(!is.na(Ozone))

df1 <- tibble(id = rep(1:3, times = 2:4), x1 = c(1:2,1:3,1:4))
df1
df1 %>% distinct(id, .keep_all = TRUE)
df1 %>% arrange(id,desc(x1)) %>% distinct(id, .keep_all = TRUE)

mtcars
mtcars_t <- mtcars %>% 
  rownames_to_column(var='row.name') %>% 
  as_tibble()
mtcars_t

mtcars_t %>% dplyr::select(where(is.numeric) & contains("c"))
mtcars_t %>% dplyr::select(model = row.name, everything())

mtcars_t %>% dplyr::rename_with(toupper, contains("a"))

iris_t
iris_t %>% relocate(ends_with("th"), .after = Species)
airquality
airquality %>% group_by(Month) %>% summarise(avg_OZ=mean(Ozone, na.rm=TRUE))
airquality %>% group_by(Month) %>% summarise(na_OZ=sum(is.na(Ozone)),nonna_OZ=sum(!is.na(Ozone)))
airquality %>% group_by(Month) %>% summarise(first = min(Day), last = max(Day))
airquality %>% group_by(Month) %>% summarise(first = min(Ozone,na.rm=TRUE), last = max(Ozone,na.rm=TRUE))
airquality %>% group_by(Month) %>% mutate(avg_OZ = mean(Ozone,na.rm = TRUE)) %>% 
  summarise(below_day = sum(Ozone<avg_OZ,na.rm=TRUE))

mpg %>% group_by(cyl) %>% 
  dplyr::select(1:2, hwy) %>% 
  filter(hwy == max(hwy)) %>% 
  arrange(.by_group = TRUE)
iris_t
iris_t %>% summarise(across(where(is.numeric),mean))

iris_t %>% summarise(across(where(is.numeric),mean),
                     across(where(is.factor), nlevels))

iris_t %>% 
  summarise(n = n(), across(where(is.numeric),sd))

iris_t %>% 
  summarise(across(where(is.numeric),sd), n=n())

iris_t %>% 
  summarise(across(starts_with("Se"),list(M=mean, SD=sd),
                   .names = "{fn}_{col}"))

iris %>% 
  group_by(Species) %>% 
  summarise(across(where(is.numeric), ~length(unique(.x))))

mean_sd <- list(
  mean = ~mean(.x, na.rm=TRUE),
  sd = ~sd(.x, na.rm=TRUE)
)

airquality %>% 
  as_tibble() %>% 
  summarise(across(c(Ozone,Solar.R),mean_sd))

# iris에서 요인을 문자형 변수로 전환
iris_t %>% 
  mutate(across(where(is.factor),as.character))

iris_t %>% 
  mutate(across(where(is.numeric), ~.x/2.54))

iris_t %>% 
  filter(across(contains("Len"), ~.x >= 6.5))

iris_t %>% 
  filter(across(.fns=~ !is.na(.x)))

mpg %>% 
  as_tibble() %>% 
  distinct(across(1:2),.keep_all=TRUE)

mpg %>% count(across(c(manufacturer,model)),sort=TRUE)

df1 <- tibble(x = 1:2, y = 3:4, z = 5:6)
df1 %>% rowwise() %>% 
  mutate(total = sum(c(x,y,z)))

df2
df2 <- tibble(id = 1:3, w = 10:12, x = 20:22,
              y = 30:32, z = 40:42)
df2 %>% 
  rowwise() %>% 
  summarise(total=sum(c_across(w:z)))

df2 %>% 
  rowwise(id) %>% 
  mutate(total= sum(c_across(where(is.numeric)))) %>% 
  ungroup() %>% 
  mutate(across(w:z, ~.x/total))

airquality %>% 
  as_tibble() %>%
  filter(Wind>=mean(Wind) & Temp<mean(Temp)) %>% 
  dplyr::select(c(Ozone,Solar.R,Month)) -> air_sub1

airquality %>% 
  as_tibble() %>%
  filter(Wind<mean(Wind) & Temp>=mean(Temp)) %>% 
  dplyr::select(c(Ozone,Solar.R,Month)) -> air_sub2

air_sub1 %>% 
  summarise(n=n(), m_oz = mean(Ozone,na.rm=TRUE), m_solar=mean(Solar.R,na.rm=TRUE))

air_sub2 %>% 
  summarise(n=n(), m_oz = mean(Ozone,na.rm=TRUE), m_solar=mean(Solar.R,na.rm=TRUE))

air_sub1 %>%
  group_by(Month) %>% 
  summarise(n=n(), m_oz = mean(Ozone,na.rm=TRUE), m_solar=mean(Solar.R,na.rm=TRUE))

air_sub2 %>%
  group_by(Month) %>% 
  summarise(n=n(), m_oz = mean(Ozone,na.rm=TRUE), m_solar=mean(Solar.R,na.rm=TRUE))

mtcars %>% 
  rownames_to_column(var="model") %>% 
  as_tibble() %>% 
  dplyr::select(c(1:5,wt,am)) -> cars

cars %>% 
  mutate(disp_cc = disp*16.4) %>% 
  dplyr::select(-disp) %>% 
  mutate(type= case_when(
    disp_cc>=2000 ~ "Large",
    disp_cc>=1500 ~ "Midsize",
    disp_cc>=1000 ~ "Small",
    TRUE ~ "Compact"
  )) %>% 
  filter(am==1 & cyl ==8) %>% 
  dplyr::select(c(1:2,disp_cc,type)) 
cars
cars %>% 
  mutate(disp_cc = disp*16.4) %>% 
  dplyr::select(-disp) %>% 
  group_by(cyl) %>% 
  summarise(n=n(),across(c(mpg,disp_cc,hp,wt),mean))

airquality %>% slice_sample(n=10) -> air1
?drop
airquality %>% drop(air1)

df <- tibble(Name = c("Park","Lee","Kim"), A = c(14,21,15), B=c(12,16,5),C=c(4,8,10))
df

df %>% rowwise(Name) %>% mutate(total=sum(c(A,B,C)))%>% 
    ungroup() %>% mutate(across(A:C,~ .x/total))
c_across()
df
df2 %>% 
  rowwise(id) %>% 
  mutate(total= sum(c_across(where(is.numeric)))) %>% 
  ungroup() %>% 
  mutate(across(w:z, ~.x/total))
library(tidyverse)
Cars93 %>% dplyr::select(Manufacturer,Model,MPG.highway,Cylinders,Weight,Origin) -> car
car %>% mutate(make = paste(Manufacturer,Model,sep="_")) %>% 
  dplyr::select(-c(Manufacturer,Model)) -> car

car %>% group_by(Cylinders) %>% 
  summarise(n=n()) %>% 
  arrange(desc(n))
car %>% filter(!Cylinders %in% c('3','5','rotary')) %>% 
  filter(MPG.highway==max(MPG.highway)) %>%
  dplyr::select(make, MPG.highway)

mpg %>% 
  filter(class != "2seater") %>% 
  ggplot() + 
  geom_point(mapping=aes(x=displ, y=hwy)) +
  facet_wrap(~class, ncol=2, dir="v")

?facet_wrap

mpg %>% 
  filter(cyl != 5, drv != "r") %>% 
  ggplot(mapping=aes(x=displ,y=hwy)) +
  geom_point() +
  facet_grid(drv ~ cyl)

ggplot(data=mpg, mapping=aes(x=displ,y=hwy)) +
  geom_point(mapping=aes(color=drv)) +
  geom_smooth(mapping=aes(linetype=drv),se=FALSE)

ggplot(data=mpg, mapping=aes(x=displ,y=hwy)) +
  geom_point()+
  geom_smooth(mapping=aes(group=drv),se=FALSE)


예: mpg의 변수 displ과 hwy의 산점도. drv에 따라 점의 색 구분. 비모수 회귀곡선 추가하되 drv가 4인 데이터만을 대상으로 추정.

ggplot(data=mpg, mapping=aes(x=displ, y=hwy)) +
  geom_point(mapping=aes(color=drv)) +
  geom_smooth(data=mpg %>% filter(drv==4), se=FALSE, color="RED")
mpg_1 <- mpg %>%
  mutate(am=substr(trans,1,nchar(trans)-4)) %>%
  filter(cyl!=5)
ggplot(data=mpg_1, mapping=aes(x=as.factor(cyl),hwy)) +
  geom_boxplot(mapping=aes(fill=am)) +
  xlab("Number of Cylinders")

ggplot(data=mpg, mapping=aes(x=displ, y=hwy)) +
  geom_point() +
  geom_smooth() +
  coord_cartesian(xlim=c(3,6))

library(lattice)
ggplot(data=barley, mapping=aes(x=variety,y=yield,color=year)) + 
  geom_point() +
  coord_flip() +
  facet_wrap(~site)

ggplot(data=barley, mapping=aes(x=variety,y=yield,color=site, shape=year)) +
  geom_point() +
  coord_flip()

barley %>% 
  group_by(variety) %>% 
  summarise(mean_yield = mean(yield)) %>% 
  arrange(desc(mean_yield))

mpg %>% 
  group_by(fl) %>% 
  summarise(n=n())

mpg %>% filter(!fl %in%c('c','d','e')) %>% 
  group_by(fl) %>% 
  ggplot(mapping=aes(x=fl)) +
  geom_bar(aes(y=..count../sum(..count..))) +
  ylab("prop")

mpg %>% filter(!fl %in%c('c','d','e')) %>% 
  group_by(trans) %>% 
  mutate(n=n()) %>% 
  ungroup() %>% 
  mutate(am = substr(trans,1,nchar(trans)-4)) %>% 
  ggplot(mapping=aes(x=fl,fill=am)) +
  geom_bar(position="fill")

mpg %>% filter(!fl %in%c('c','d','e')) %>% 
  mutate(n=n()) %>% 
  ungroup() %>% 
  mutate(am = substr(trans,1,nchar(trans)-4)) %>% 
  ggplot(mapping=aes(x=fl,y=hwy)) +
  geom_boxplot() +
  facet_wrap(~am, ncol = 1) +
  coord_flip()

airquality %>% 
  group_by(Month) %>% 
  summarise(Missing= is.na(Ozone)) %>% 
  ggplot(mapping = aes(x=Month)) +
  geom_bar(mapping = aes(fill=Missing), position="fill")  +
  ylab("Percentage of Missing Ozone")

airquality %>% 
  group_by(Month) %>% 
  summarise(Mean_Ozone= mean(Ozone, na.rm=TRUE)) %>% 
  ggplot(mapping = aes(x=Month)) +
  geom_bar(stat="identity", mapping=aes(y=Mean_Ozone),fill="blue")

airquality %>% 
  mutate(temp_group = case_when(
    Temp >= mean(Temp) ~ "High Temp",
    Temp < mean(Temp) ~ "Low Temp"
  )) %>% 
  mutate(wind_group=case_when(
    Wind >= mean(Wind) ~ "High Wind",
    Wind < mean(Wind) ~ "Low Wind"
  )) %>% 
  ggplot(mapping=aes(x=Solar.R,y=Ozone)) +
  geom_point() +
  facet_grid(temp_group~wind_group)
?case_when

mtcars %>% 
  rownames_to_column(var="model") %>% 
  as_tibble() ->mtcars_t
  arrange(mpg,desc(disp)) %>% 
  dplyr::select(c(model,mpg,disp,wt)) %>% 
  print(n=5)

mtcars_t %>% 
  mutate(gp_wt=ifelse(wt>=median(wt),"Heavy","Not heavy")) %>% 
  ggplot(mapping=aes(x=disp,y=mpg)) +
  geom_point() +
  geom_smooth(se=FALSE,method=lm) +
  facet_wrap(~gp_wt)

mpg_1<- mpg %>% 
  filter(cyl==4) %>% 
  mutate(year=as.factor(year)) %>% 
  dplyr::select(c(model,year,displ,cty,hwy)) %>% 
  arrange(year,desc(displ),cty)
mpg_1 %>% mutate(gp_displ=ifelse(displ>=2.0,"Large","Small")) %>% 
  ggplot(mapping=aes(x=cty,y=hwy,color=gp_displ)) +
  geom_point() + 
  facet_wrap(~year,ncol=1)

mpg_1 %>% mutate(gp_displ=ifelse(displ>=2.0,"Large","Small")) %>% 
  ggplot(mapping=aes(x=gp_displ, y= hwy)) +
  geom_boxplot() + 
  facet_wrap(~year)

my_plot <- function(x,y,...){
  z_x <- (x-mean(x,na.rm=TRUE))/sd(x,na.rm=TRUE)
  z_y <- (y-mean(y,na.rm=TRUE))/sd(y,na.rm=TRUE)
  ggplot(data.frame(x=z_x,y=z_y))+
    geom_point(aes(x,y),...)
}

library(ggplot2)
cars %>% View()
with(cars, my_plot(x=mpg,y=dist,shape=20,color="red",size=2))

my_center <- function(x, type){
  switch(type, mean=mean(x), med = median(x))
}

x<-c(1,2,3,4,50)

my_center(x, type="med")
my_center(x, type="mean")

res <- vector("double", 5)
seq(length(res))
for(i in seq_along(res)){
  print(i)
}
for(i in 1:5){
  print(i)
}
for(i in seq(res)){
  print(i)
}

fac.x <- 1
for(i in 1:5){
  fac.x = fac.x *i
  cat(i,"!=",fac.x,"\n")
}

x <- list(a1=1:5, a2=rnorm(5), a3=c(TRUE, FALSE, TRUE, TRUE))
x
lapply(x,mean)
sapply(x,mean)
unlist(lapply(x,mean))

m <- -2:2
m
sig = 0.5
res <- vector("double",length(m))
for(i in seq_along(res)){
  res[i] <- mean(rnorm(n=10, mean=m[i], sd = 0.5))
}
res

set.seed(1234)
m <- -2:2
x <- lapply(m, rnorm, n=10, sd=0.5)
sapply(x, mean)

A <- matrix(c(0.8,1.3,1.0, 1.1, 1.3, 1.3, 0, 1.2, 0.2, 0.6, 1.4, 0.6), nrow=3)
rownames(A) <- c("Park", "Lee", "Kim")
colnames(A) <- paste0("trial", 1:4)
A
apply(A, 2, mean)
apply(A, 1, mean)
apply(A, 1, range)
apply(A, 2, range)

data(Cars93, package="MASS")
with(Cars93, tapply(MPG.city,Origin,mean))

with(Cars93, tapply(MPG.city,Origin,mean,simplify = FALSE))

x_g<-with(Cars93, split(MPG.city,Origin))
lapply(x_g,mean)
sapply(x_g,mean)

Cars93 %>% 
  group_by(Origin) %>% 
  summarise(across(MPG.city,.fns=mean))

airs <- airquality %>% 
  dplyr::select(-Month,-Day)
sapply(airs, mean, na.rm=TRUE)
airs %>% 
  summarise(across(.fns=mean,na.rm=TRUE))

airs %>% 
  map_dbl(function(x) sum(x,na.rm=TRUE) / sum(!is.na(x)))
airs %>% 
  map_dbl(~ sum(.x, na.rm=TRUE)/sum(!is.na(.x)))

df2 <- list(x1=rnorm(n=5, mean=-1), x2=rnorm(n=5, mean=1)) %>% 
  map(summary)
df2
df2 %>% 
  map_dbl("1st Qu.")

mu <-c(x1=-5,x2=5)
sig <-c(x1=2,x2=1)
map2(.x=mu, .y=sig,rnorm, n=5)
map2_dfc(.x=mu,.y=sig,rnorm,n=3)

my_gplot <- function(data, x, y){
  ggplot(data, aes(x,y)) +
    geom_point()
}
exdat=tibble(x=c(2,5,3,7,6),y=c(3,6,5,7,8))
exdat
my_gplot(exdat,x,y)
my_gplot(mtcars,hp,mpg)

my_gplot1 <- function(data, x, y){
  ggplot(data, aes({{x}},{{y}})) +
    geom_point()
}
my_gplot1(exdat,x,y)
my_gplot1(mtcars,hp,mpg)
my_gplot(mtcars_t,hp,mpg)


res <- vector("double", 12)
res[1]= 0; res[2]=1;
for(i in 1:(length(res)-2)){
  res[i+2] = res[i] + res[i+1]
}
res

mtcars %>% 
  dplyr::select(1:6) %>%
  map_dbl(~ mean(.x) ~ sd(.x))
slice_head(str(airquality))
split
with(airquality, select(1:4))
split(airquality %>% dplyr::select(1:4), airquality$Month) %>% 
  map(~colMeans(.x,na.rm=TRUE))

split(airquality %>% dplyr::select(1:4), airquality$Month) %>% 
  map(~colMeans(.x,na.rm=TRUE))

split(airquality %>% dplyr::select(1:4), airquality$Month) %>% 
  map(~sum(is.na(.x)))

air_g <- with(airquality, split(everything,Month))
air_g
split(airquality,airquality$Month) %>% 
  dplyr::select(1:4) %>% 
  map(~ mean(.))

airquality %>% group_by(Month) %>% 
  map(1:4, ~sum(is.na(.x)))

  map(~ summarise(.x, across(everything(), ~ sum(is.na(.)))))
  
airquality %>% group_by(Month) %>%
  dplyr::select(1:4) %>% 
  summarise(across(everything(),mean,na.rm=TRUE, .names = "{col}_Mean"))





2022-1
y=c(2,5,1,7,9,-1,-3)
fpop=function(x, k, ...) {
  w=sort(x,...)[k]
  w
}
fpop(y,2)

fpop(y,2,decreasing=T) 
# [1] 7
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
  list(fb=res,ave=hap/k)
}
myFb(15)

2022-3
kk1=tibble(name=rep(c("Park","Lee","Kim"),3), sell=c(14,21,15,12,16,5,4,8,10),
           item=rep( c("A","B","C"),each=3))
kk1

kk1 %>% group_by(name) %>% mutate(msel=mean(sell)) %>% distinct(name,msel)

2-22=4
data(mpg, package = "ggplot2")
ggplot(data=mpg, mapping=aes(x=displ,y=hwy))+
  geom_point(data=mpg %>% filter(drv %in% c('f','r')),mapping=aes(color=drv,shape=drv)) +
  geom_smooth(se=FALSE)
2022-5
data(Cars93, package="MASS")
with(Cars93, tapply(MPG.city,Origin,function(x) max(x)-min(x)))

2020-1

myFb = function(k){
  if(k<3) return("k must be an integer greater than 2")
  res= vector("double",k)
  res[1]=0; res[2]=1
  for(i in 1:(k-2)){
    res[i+2] = res[i] + res[i+1]
  }
  res
}
myFb(6)
myFb(15)

2020-2

mpg %>% filter(drv %in% c('4','f')) %>% 
  mutate(rhc= (hwy+cty)/2) %>% 
  ggplot(mapping=aes(x=drv,y=rhc)) +
  geom_boxplot() +
  facet_wrap(~year)

2020-3

mpg %>% filter(drv %in% c('4','f')) %>% 
  group_by(drv) %>% 
  summarise(cty_Mean=mean(cty,na.rm=TRUE), hwy_Mean=mean(hwy,na.rm=TRUE), ratio=(cty_Mean/hwy_Mean))

2020-4

fmax=function(x) { 
  tmax=x[1]
  smax=-Inf 
  k=length(x) 
  for(i in 2:k) {
    if (tmax <x[i]) {smax=tmax;tmax=x[i]}
    else if(smax < x[i] & x[i] != tmax){smax=x[i]}}
  list(smax=smax,tmax=tmax)
}
x=c(5,3,9,3,7,5,1)
fmax(x)
y=c(5,3,9,7,8,5,9)
fmax(y)
# $smax
# [1] 7
# $tmax [1] 9
# 
# 

set.seed(123456)
mu <- c(x1=-5, x2=5)
sigma <- c(x1=2,x2=1)
map_dfc(mu, ~rnorm(n=3,mean=mu, sd=sigma))
