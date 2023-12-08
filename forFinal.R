######
##4###
######

#' %>% 
#' x %>%  f() -> f(x)
#' x %>%  f(y) -> f(x,y)
#' x %>%  f(y, .) -> f(y,x)

library(dplyr)
x <- 1:5
y <- log(x)
x %>% mean()
x %>%  plot(y)
x %>%  plot(y,.)

x %>% log() %>% mean() # == mean(log(x))
x %>% log() %>% mean() %>% sqrt() # == sqrt(mean(log(x)))

#파이프를 통해 할당

x = 1:5
u = x %>% mean
u
v <- x %>% mean
v
x %>%  mean -> w
w

s = as_tibble(airquality) %>%  print(n=3)
dim(s)

#filter
library(tidyverse)
mtcars_t <- as_tibble(mtcars)
mtcars_t
mtcars_t %>%  filter(mpg >= 30)
mtcars_t %>%  filter(mpg>=30, wt<1.8) # & 대신 , 를 사용할 수 있다.

mtcars_t %>% filter(mpg <= 30, cyl %in% c(6,8), am ==1)

mtcars_t %>% 
  filter(
    mpg >= median(mpg), mpg <= quantile(mpg, probs=0.75) 
    ) %>% 
      print(n=3)

mtcars_t %>% 
  filter(
    between(mpg, median(mpg), quantile(mpg, probs = 0.75))
  )

airs <- as_tibble(airquality) %>% print(n=3)

airs %>% 
  filter(is.na(Ozone) | is.na(Solar.R)) %>% 
  print(n=3)

#slice : 행 번호를 직접 입력하여 특정 행 선택 또는 제거

iris_t <- as_tibble(iris)
iris_t %>% slice(5:10)
iris_t %>%  slice(-(5:10)) %>% 
  print(n=3)
#마지막행 선택
iris_t %>% slice(n()) # n() : 행의 개수를 게는 함수

iris_t %>%  slice_head(n = 3)
iris_t %>%  slice_tail(n = 3)
iris_t %>%  slice_sample(n = 3)
iris_t %>%  slice(prop = 0.02, replace=TRUE) # 0.02퍼센트 행 복원 추출

iris_t %>%  slice_max(Sepal.Width, n = 2)#가장 큰 것 #선택하고자하는 개수(n), 또는 비율(prop)
iris_t %>%  slice_max(Sepal.Width, prop=0.02)
iris_t %>%  slice_min(Petal.Length, prop=0.02)

#arange() 변수 기준으로 재배열
# arrange(df, var_1,var2) #var_1 : 제1정렬기준, var2_2: 제2장렬기준
# 오름차순(작은것부터)가 디폴트, desc() : 내림차순으로 

mtcars_t %>% arrange(mpg) %>% print(n=3)
mtcars_t %>% arrange(mpg, desc(wt)) %>% print(n=3)

air <- as_tibble(airquality)
air
airs_1 <- air %>%  filter(Month == 5, Day <= 10)
airs_1
airs_1 %>% arrange(!is.na(Ozone)) 
# 중요 ! : 결측값을 가장 앞으로 배치 == is.na(x)
airs_1 %>% arrange(!is.na(Ozone), desc(Ozone))

#distinct() : 중복행 제거
# option : .keep_all = TRUE : 모든 변수 유지, 중복된 행 중 첫번째 행만 유지
# FALSE : 해당 변수만
df1 <- tibble(id=rep(1:3, times=2:4), x1 = c(1:2,1:3,1:4))
df1
df1 %>% distinct(id, .keep_all = TRUE)
df1 %>%  distinct(id)
df2 <-  tibble(id=rep(1:3, each=2), x1=c(2,2,3,1,4,4))
df2
df2 %>% distinct(.keep_all = TRUE)
rm(list=ls())
#select : 열 선택
mtcars
mtcars_t <- mtcars %>% 
  rownames_to_column(var="row.name") %>% 
  as_tibble()
mtcars_t
mtcars_t %>% select(1:3,7)
mtcars_t %>%  select(row.name:cyl,wt)

# 열 제거 : ! , -
mtcars_t %>% select(-c(1:3,7))
mtcars_t %>% select(!c(1:3,7))
mtcars_t %>% select(1:3, !1)
# 1,2,3과 1을 제외한 나머지의 합집합 == 전체
mtcars_t %>% select(1:3,-1)
# 1,2,3에서 1을 제외한 2,3
mtcars_t %>%  select(-c(1:3),-1)
# 1,2,3을 제외하고 첫번째

# where(fn) 
# fn : 결과가 TRUE or FALSE인 predicate 함수
# where(fn) : 결과가 TRUE인 변수 선택

mpg %>%  print(n=3)
#숫자형 변수 선택
mpg %>% select(where(is.numeric))

# everything() : 모든 변수 선택
# last_col() : 마지막 변수 선택

# starts_with("x") : x로 시작하는 변수 선택
# ends_with("x") : x로 끝나는 변수 선택
# contains("x") : x를 포함하는 변수 
# num_range("x", 1:10) : x1,x2, ... , x10과 동일
# all_of(vec): vec에 이름 있는 변수 선택, 단 없는 변수 이름이 vec에 있으면 오류 발생
# any_of(vec) : all_of(vec)과 동일, 데이터프레임에 없는 이름이 vec에 있어도 오류 발생하지않음

mtcars_t %>% select(1, last_col())
mtcars_t %>% select(starts_with("m"))
mtcars_t %>% select(ends_with("p"))
mtcars_t %>% select(contains("A"))
vars <- c("model","mpg","wt")
mtcars_t %>% select(any_of(vars))
mtcars_t %>% select(all_of(vars))#에러발생
mtcars_t %>% select(where(is.numeric), contains("c"))

#열이름 변경
# select, rename, rename_with

mtcars_t <- mtcars %>% 
  rownames_to_column(var = "row.name") %>% 
  as_tibble()
mtcars_t %>% select(model = row.name) # row.name을 model로 이름 변경
mtcars_t %>% select(model = row.name, everything()) #모든 열 유지

mtcars_t %>% rename(model = row.name)
#rename_with() : 많은 변수 이름을 공통된 양식으로 변경하는 경우

mtcars_t %>% rename_with(toupper)

mtcars_t %>% rename_with(toupper, contains("a"))

#relocate : 열 위치 변경

iris_t <- as_tibble(iris)
iris_t
iris_t %>% relocate(Species)#Species 맨앞으로

iris_t %>% relocate(ends_with("th"), .after=(Species))

# mutate() , transmute : 새로운 열 추가

mtcars_t %>% mutate(kml = mpg*0.43,
                    gp_kml = if_else(kml>=10, "good", "bad")) %>% relocate(kml, gp_kml)
mtcars_t %>% mutate(kml = mpg*0.43,
                    gp_kml = case_when(
                      kml < 8 ~ "bad",
                      kml < 11 ~ "good",
                      TRUE ~ "excellent"
                    )) %>% relocate(kml, gp_kml)

# summarise()

mpg %>% 
  summarise(n = n(), n_hwy = n_distinct(hwy), #n() : 전체 행 개수, n_distinct() : 서로 다른 값을 갖고 있는 행의 개수
            avg_hwy = mean(hwy))
                    
mpg %>% 
  summarise(avg_hwy = mean(hwy), rng_hwy. = range(hwy))

# groupby()

by_cyl <- mpg %>% group_by(cyl)
by_cyl

by_cyl %>% tally() # 각 그룹에 속한 자료 개수 확인
mpg %>% count(cyl)
by_cyl %>% ungroup()

airs_M <- airquality %>% group_by(Month)
airs_M %>% summarise(avg_Oz = mean(Ozone, na.rm=TRUE))
airs_M %>% summarise(n_miss = sum(is.na(Ozone)),
                     n_obs = sum(!is.na(Ozone)))
# first(), las(), nth()
airs_M %>% summarise(first_Oz = first(Ozone),
                     last_Oz = last(Ozone))
#월별 Ozone의 가장 작은 값과 큰 값

airs_M %>% summarise(min_Oz = min(Ozone, na.rm=TRUE),
                     max_Oz = max(Ozone,na.rm=TRUE))

#월별 Ozone의 개별 값이 전체 기간 동안의 평균값보다 작은 날 수

airs_M %>% summarise(below_mean = sum(Ozone < mean(airquality$Ozone,na.rm=TRUE),na.rm = TRUE))

#select : 열 선택

mpg %>% group_by(cyl) %>% select(hwy)
mpg %>% group_by(cyl) %>% arrange(hwy, .by_group = TRUE) # cyl이 첫번째 정렬변수

mpg %>% select(cyl, hwy) %>% 
  mutate(std_hwy = hwy - mean(hwy), rank = min_rank(hwy))
# min_rank : 입력된 벡터의 오름차순 순위 계산(작을수록 낮은 순위)
mpg %>% select(cyl,hwy) %>% 
  group_by(cyl) %>%
  mutate(std_hwy = hwy - mean(hwy), rank=min_rank(hwy))

# mpg의 cyl 그룹별 hwy가 가장 큰 값을 갖는 행 선택

mpg %>% group_by(cyl) %>%
  select(1:2,hwy) %>% 
  filter(hwy == max(hwy)) %>% 
  arrange(hwy, .by_group = TRUE)

# airquality에서 Ozone의 월별 첫날과 마지막 날, 가장 큰 값과 가장 작은 값 을 갖는 행 선택

air_M <- airquality %>% group_by(Month) %>% select(1,5,6)
air_M %>% slice_head(n=1)
air_M %>% slice_tail(n=1)
#slice_max, slice_min
air_M %>% slice_max(Ozone, n=1)
air_M %>% slice_min(Ozone, n=1)

#n() : 행 개수 계산, cur_data() : 각 그룹별 데이터를 따로 불러옴
library(dplyr)
mpg %>% group_by(cyl) %>% summaray(data=cur_data())

# skip! 혹시 몰라서 회귀모델
# 예제 (skip)
# - mpg에서 cyl 그룹별로 hwy를 반응변수, displ을 설명변수로 하는 회귀모형 적합하고 결정계수 계산
# - 그룹별케이스가5를초과하지않는그룹자료는제외
mpg %>%
group_by(cyl) %>%
filter(n() > 5) %>%
summarise(r2 = summary(lm(hwy ~ displ,
                          data = cur_data()))$r.squared)

# across() : 다수의 열을 대상으로 하는 작업
mtcars %>%
  summarise(mpg=mean(mpg), cyl=mean(cyl),
            disp=mean(disp), hp=mean(hp))
#훨씬 빠르게 할 수 있음!
mtcars %>% summarise((across(mpg:hp, mean)))

iris_t <- as_tibble(iris)
iris_t %>% 
  summarise(across(where(is.numeric),mean))
# iris에서 숫자형 변수는 평균, 요인은 수준의 개수
iris_t %>% 
  summarise(across(where(is.numeric),mean),
            across(where(is.factor), nlevels)) # 수준의 개수 : nlevels

#전체 행의 개수와 숫자형 변수의 표준편차
iris_t %>% 
  summarise(n = n(), across(where(is.numeric),sd))
# n이 먼저 생성되고 across에서 다시 sd 계산에 들어가므로 NA 생성
iris_t %>% 
  summarise(across(where(is.numeric),sd), n=n())

# iris에서 “Se”로 시작하는 변수의 평균과 표준편차
iris_t %>% 
  summarise(across(starts_with("Se"),list(M=mean,SD=sd))) #list 사용!

#열이름 형식 변경
iris_t %>% 
  summarise(across(starts_with("Se"),list(M=mean,SD=sd),
                   .names="{fn}_{col}")) #디폴트 : {col}_{fn}

#iris에서 각 숫자형 변수의 결측값 개수
iris_t %>% 
  summarise(across(where(is.numeric), ~sum(is.na(.x)))) ##!!!! ~sum(is.na(.x)) 기억!!!

iris %>% 
  group_by(Species) %>% 
  summarise(across(where(is.numeric), ~ length(unique(.x))))

# airquality에서 Ozone과 Solar.R의 평균과 표준편차

airquality %>% 
  summarise(across(c(Ozone,Solar.R), list(M=~mean(.x,na.rm=TRUE),SD=~sd(.x,na.rm=TRUE))))

# iris에서 요인을 문자형 변수로 전환

iris_t <- as_tibble(iris)

iris_t %>% 
  mutate(across(where(is.factor),~as.character(.x)))

# 센티미터 단위로 측정된 자료를 인치 단위로 변환

iris_t %>% 
  mutate(across(where(is.numeric), ~ .x/2.54))

# iris에서 이름에 ‘Len’이 있는 변수의 자료가 모두 6.5 이상이 되는 행 선택
iris_t %>% 
  filter(across(contains("Len"), ~ .x>= 6.5))

# airquality에서 적어도 하나의 결측값이 있는 행 제거

airquality %>% as_tibble() %>% 
  filter(across(.fns = ~ !is.na(.x)))
airquality %>% as_tibble() %>% 
  na.omit()

# mpg에서 처음 두 변수 manufacturer와 model의 자료가 중복되지 않는 행 선택

mpg %>% as_tibble() %>% distinct(across(1:2), .keep_all=TRUE)

# manufacturer와 model으로 구성되는 그룹에 속한 행 개수 계산하여 내림차순 으로 정렬

mpg %>% as_tibble() %>% count(across(1:2), sort=TRUE)

#행단위작업 : rowwise()

df1 <- tibble(x=1:2,y=3:4,z=5:6)
df1
df1 %>% rowwise() #행단위로 그룹을 생성

df1 %>% 
  rowwise() %>% 
  mutate(total = sum(c(x,y,z)))

df2 <- tibble(id = 1:3, w = 10:12, x = 20:22,
              y = 30:32, z = 40:42)
df2 %>% 
  rowwise() %>% 
  summarise(total=sum(c_across(where(is.numeric))))

df2 %>% 
  rowwise(id) %>%  #id는 연산과정에서 제외됨
  summarise(total=sum(c_across(where(is.numeric)))) 

df2 %>% 
  rowwise(id) %>% 
  mutate(total = sum(c_across(where(is.numeric)))) %>% 
  ungroup() %>% 
  mutate(across(w:z, ~.x/total))


#------------------------------------------------------------------------------#
#' 연습문제
#' 
#'    1.

#1)
airquality %>% 
  filter(Wind >= mean(Wind), Temp < mean(Temp)) %>% 
  select(c(Ozone, Solar.R, Month)) -> air_sub1
air_sub1
#2)
airquality %>% 
  filter(Wind < mean(Wind), Temp >= mean(Temp)) %>% 
  select(c(Ozone, Solar.R, Month)) -> air_sub2
air_sub2
#3)
air_sub1 %>% as_tibble() %>% 
  summarise(n = n(), m_oz=mean(Ozone, na.rm=TRUE), m_solar = mean(Solar.R,na.rm=TRUE))
air_sub2 %>% as_tibble() %>% 
  summarise(n = n(), m_oz=mean(Ozone, na.rm=TRUE), m_solar = mean(Solar.R,na.rm=TRUE))

#4)

air_sub1 %>% as_tibble() %>% 
  group_by(Month) %>% 
  summarise(n = n(), m_oz=mean(Ozone, na.rm=TRUE), m_solar = mean(Solar.R,na.rm=TRUE))

air_sub2 %>% as_tibble() %>% 
  group_by(Month) %>% 
  summarise(n = n(), m_oz=mean(Ozone, na.rm=TRUE), m_solar = mean(Solar.R,na.rm=TRUE))
rm(list=ls())
#2.
#1)
mtcars %>% rownames_to_column(var="model") %>% as_tibble()

#2)
mtcars %>% 
  rownames_to_column(var="model") %>% as_tibble() %>% 
  select(c(model,mpg,cyl,disp,hp,wt,am)) -> cars

#3)
cars %>% 
  mutate(disp_cc = disp * 16.4) %>% 
  select(-disp) -> cars

#4)
?case_when
cars %>% 
  mutate(type = case_when(
    disp_cc < 1000 ~ "Compact",
    disp_cc < 1500 ~ "Small",
    disp_cc < 2000 ~ "Midsize",
    disp_cc >= 2000 ~ 'Large'
  )) -> cars
cars
#5)
cars %>% filter(am==1,cyl==8) %>% 
  select(-c(cyl,hp,wt,am))



#6)
cars %>% group_by(cyl) %>% 
  select(c(cyl,mpg,disp_cc,hp,wt)) %>% 
  summarise(across(mpg:wt,mean)) %>% 
  mutate(n=n()) %>% 
  relocate(n, .after=cyl)

#   3.

airquality %>% 
  slice_sample(n=10) -> air_1
air_1
airquality = airquality.drop(air_1)


#4.

df <- tibble(Name = c("Park","Lee","Kim"), A = c(14,21,15), B=c(12,16,5),C=c(4,8,10))
#1)
df %>% rowwise() %>% 
  mutate(total=sum(A,B,C))

#2)  
df %>% rowwise() %>% 
  mutate(total=sum(A,B,C)) %>% 
  ungroup() %>% 
  mutate(ratio=total / sum(total))

#5

library(MASS)


#1)
Cars93 %>% dplyr::select(c(Manufacturer,Model,MPG.highway,Cylinders,Weight,Origin)) -> car
car
#2)
car %>% mutate(make = paste(Manufacturer,Model,sep = "_")) %>% 
  dplyr::select(-c(Manufacturer,Model)) %>% 
  relocate(make) -> car
#3)
car %>% group_by(Cylinders) %>% 
  count(Cylinders, sort=TRUE)
car
#4)
car %>% group_by(Cylinders) %>%  
  filter(!Cylinders %in% c("3","5","rotary")) %>% 
  ungroup() -> car
car
#5)

car %>% filter(MPG.highway==max(MPG.highway)) %>% 
  dplyr::select(c(make,MPG.highway))

#------------------------------------------------------------------------------#

######
##6###
######

ggplot(data=mpg) +
  geom_point(mapping=aes(x=displ,y=hwy), color="blue")

ggplot(data=mpg) +
  geom_point(mapping=aes(x=displ,y=hwy,color="blue"))

pp <- mpg %>% 
  filter(class != "2seater") %>% 
  ggplot() +
  geom_point(mapping = aes(x=displ,y=hwy))
pp+ facet_wrap(~class)
pp+ facet_wrap(~class, ncol=2)
pp+ facet_wrap(~class, ncol=2, dir="v")
## facet_grid
# - 한 변수에 의한 faceting:
#   하나의 행으로 패널 배치: facet_grid(. ~ x) 하나의 열로 패널 배치: facet_grid(x ~ .)
# - 두 변수에 의한 faceting: facet_grid(y ~ x) 행 범주: 변수 y의 범주
# 열 범주: 변수 x의 범주
# (y~x): 행~ 열 (.~x):1행~ 열 (x~.): 행~1열
my_plot <- mpg %>% 
  filter(cyl != 5, drv != "r") %>% 
  ggplot() + 
  geom_point(mapping=aes(x=displ,y=hwy))
my_plot
my_plot + facet_grid(drv ~ .)
my_plot + facet_grid(. ~ cyl)
my_plot + facet_grid(drv ~ cyl)

ggplot(data=mpg) +
  geom_point(mapping=aes(x=displ,y=hwy))

ggplot(data=mpg) +
  geom_smooth(mapping=aes(x=displ,y=hwy)) # 비모수 회귀곡선

ggplot(data=mpg)+
  geom_point(mapping=aes(x=displ,y=hwy)) +
  geom_smooth(mapping=aes(x=displ,y=hwy))
  
ggplot(data=mpg, mapping=aes(x=cty,y=hwy))+
  geom_point(position='jitter')

ggplot(data=mpg, mapping=aes(x=cty,y=hwy))+
  geom_jitter(width=0.4, height=0.05)

ggplot(data=mpg, mapping=aes(x=cty,y=hwy))+
  geom_jitter(width=0.05, height=0.4)
mpg
mpg_1 <- mpg %>% 
  mutate(am=substr(trans,1,nchar(trans)-4)) %>% 
  filter(cyl!=5)
mpg_1
p_1 <- ggplot(data=mpg_1,
              mapping=aes(x=as.factor(cyl), fill=am)) +
  xlab("Number of Cylinders")
p_1 + geom_bar()
# position=“stack”, “dodge”, “dodge2”, “fill” 
# 디폴트 : stack, 수직누적

p_1 + geom_bar(position="dodge")
p_1 + geom_bar(position="dodge2")
p_1 + geom_bar(position="fill")
p_1 + geom_bar(position="stack")

ggplot(data=mpg_1, mapping=aes(x=as.factor(cyl),y=hwy)) +
  geom_boxplot() +
  xlab("Number of Cylinders")

ggplot(data=mpg_1, mapping=aes(x=cyl,y=hwy)) +
  geom_boxplot() +
  xlab("Number of Cylinders")

ggplot(data=mpg_1, mapping=aes(x=as.factor(cyl), y=hwy)) +
  geom_boxplot(mapping=aes(fill=am)) +
  xlab("Number of Cylinders")

ggplot(data=mpg_1, mapping=aes(x=as.factor(cyl),y=hwy)) +
  geom_boxplot() +
  facet_wrap(~am)

## 좌표계 : Coordinate system
# coord_cartesian : xy 축 범위 조정 : xlim, ylim

p <- ggplot(data=mpg, mapping=aes(x=displ, y=hwy)) +
  geom_point() + geom_smooth()
p
p + coord_cartesian(xlim=c(3,6))

# scale 함수의 일반적인 형태: scale_*1*_*2*()
# *1*: 수정하고자 하는 시각적 요소; color, x, y, fill 등등 
# *2*: 적용되는 scale 지칭; discrete, continuous 등등
#' ex) scale_x_continuous(limits=c(3,6))
#' scale_x_continuous(name="Engine")

p + xlim(3,6) + xlab("Engine Displacement") #범위 벗어난 자료 삭제
p + coord_cartesian(xlim=c(3,6)) +
  xlab("Engine Displacement")

ggplot(data=mpg, mapping=aes(x=class, y=hwy)) +
  geom_boxplot() +
  coord_flip()

ggplot(data=mpg,mapping=aes(x="",y=hwy)) +
  geom_boxplot() +
  xlab("") +
  coord_flip()


#------------------------------------------------------------------------------#

#1

library(lattice)


# 1-1)
ggplot(data=barley, mapping=aes(x=variety,y=yield,color=year)) +
  geom_point() +
  coord_flip() -> p

p + facet_wrap(~site)

# 1-2

ggplot(data=barley, mapping=aes(x=variety, y=yield, color=site, shape=year)) +
  geom_point() +
  coord_flip()

# 1-3

barley %>% 
  group_by(variety) %>% 
  summarise(mean_yield = mean(yield)) %>% 
  arrange(desc(.))

#2 - 1

mpg %>% 
  group_by(fl) %>% 
  count()

#2 - 2

mpg %>% 
  group_by(fl) %>% 
  filter(!(fl %in% c('c','e','d'))) %>% 
  ggplot(mapping=aes(x=fl)) +
  geom_bar(aes(y=..count../sum(..count..))) +
  ylab("prop")
#2-3
mpg %>% 
  group_by(fl) %>% 
  filter(!(fl %in% c('c','e','d'))) %>% 
  ungroup() %>% 
  group_by(trans) %>% 
  summarise(n=n())

#2-4
mpg %>% 
  group_by(fl) %>% 
  filter(!(fl %in% c('c','e','d'))) %>% 
  ungroup() %>% 
  mutate(am = substr(trans,1,nchar(trans)-4)) %>% 
  ggplot(mapping=aes(x=fl,fill=am)) +
  geom_bar(position='fill')

#2-5

mpg %>% 
  group_by(fl) %>% 
  filter(!(fl %in% c('c','e','d'))) %>% 
  ungroup() %>% 
  ggplot(mapping=aes(x=fl,y=hwy)) +
  geom_boxplot()
#2-6

mpg %>% 
  group_by(fl) %>% 
  filter(!(fl %in% c('c','e','d'))) %>% 
  ungroup() %>% 
  mutate(am = substr(trans,1,nchar(trans)-4)) %>% 
  ggplot(mapping=aes(x=fl,y=hwy)) +
  geom_boxplot() +
  coord_flip() +
  facet_wrap(~am, dir="v")

# 3-1

airquality %>% 
  group_by(Month) %>% 
  mutate(Missing = is.na(Ozone)) %>% 
  ggplot(mapping=aes(x=Month,fill=Missing)) +
  geom_bar(position="fill")

#3-2
airquality %>% 
  group_by(Month) %>% 
  summarise(mean_oz = mean(Ozone,na.rm=TRUE)) %>% 
  ggplot(mapping = aes(x=Month)) +
  geom_bar(stat='identity',aes(y=mean_oz), position="dodge2")

#3-3 ####모르겠다!! 이게 최선인데

airquality %>% 
  mutate(cat_temp = case_when(
    Temp >= mean(Temp)  ~ "High Temp",
    Temp < mean(Temp) ~ "Low Temp"),
    cat_wind=case_when(
      Wind >= mean(Wind) ~ "High Wind",
      Wind < mean(Wind) ~ "Low Wind"
    )) %>% 
  ggplot(mapping=aes(x=Solar.R,y=Ozone)) +
  geom_point() +
  facet_wrap(~cat_temp + cat_wind)

#4-1
mtcars
mtcars %>%
  rownames_to_column(var="model") %>% 
  as_tibble() %>% 
  dplyr::select(c(model,mpg,disp,wt)) %>% 
  arrange(mpg,desc(disp)) -> mtcars_t

#4-2

mtcars_t %>% 
  mutate(gp_wt=ifelse(wt>median(wt),"Heavy","Not Heavy")) %>% 
  ggplot(mapping=aes(x=disp,y=mpg,color=gp_wt)) +
  geom_point() +
  geom_smooth(method="lm",se=FALSE)

#4-3

mtcars_t %>% 
  mutate(gp_wt=ifelse(wt>median(wt),"Heavy","Not Heavy")) %>% 
  ggplot(mapping=aes(x=disp,y=mpg)) +
  geom_point() +
  geom_smooth(method="lm",se=FALSE) +
  facet_wrap(~gp_wt)

#5
mpg
mpg %>% 
  filter(cyl == 4) %>% 
  mutate(year=as.factor(year)) %>% 
  dplyr::select(c(model,year,displ,cty,hwy)) %>% 
  arrange(year,desc(displ),cty)


#------------------------------------------------------------------------------#

#####
# 7 #
#####

CI_mean<-function(x,conf=0.95){
  m <- mean(x)
  se <- sd(x) / sqrt(length(x))
  alpha <- 1 -conf
  c(m-qnorm(1-alpha/2)*se,m+qnorm(1-alpha/2)*se)
}

set.seed(12345679)
x <- rnorm(n=100)
CI_mean(x)
CI_mean(x, conf=0.90)

# ... : 함수의 마지막 변수로 지정, 기존의 함수를 이용하여 함수를 정의하는 경우 매우 유용함
y <- c(x,NA)
y
CI_mean(y)
CI_mean(y,na.rm=TRUE) #error 발생
CI_mean_dot <- function(x,conf=0.95,...){
  m <- mean(x,...)
  se <- sd(x,...) / sqrt(sum(!is.na(x)))
  alpha <- 1 -conf
  c(m-qnorm(1-alpha/2)*se,m+qnorm(1-alpha/2)*se)
}
CI_mean_dot(y,na.rm=TRUE)

CI_mean_dot1 <- function(x,conf=0.95,aa=F){
  m <-mean(x,na.rm=aa)
  se <- sd(x,na.rm=aa)/sum(!is.na(x))
  alpha <- 1- conf
  c(m-qnorm(1-alpha/2)*se, m+qnorm(1-alpha/2)*se)
}

CI_mean_dot1(y,aa=T)

 CI_mean_dot2 <- function(x,conf=0.95,na.rm=F){
  m <- mean(x,na.rm=na.rm)
  se <- sd(x,na.rm=na.rm)/sqrt(sum(!is.na(x)))
  alpha <- 1-conf
  c(m-qnorm(1-alpha/2)*se, m+qnorm(1-alpha/2)*se)
}
 x=c(1,3,5,7,9,NA)
 CI_mean_dot2(x,na.rm=T)

my_plot <- function(x,y, ...){
  z_x <- (x-mean(x))/sd(x)
  z_y <- (y-mean(y))/sd(y)
  ggplot(data.frame(x=z_x,y=z_y)) +
    geom_point(aes(x,y),...)
}
 
library(ggplot2)
with(cars, my_plot(x=speed,y=dist,shape=20,color="red",size=2))

my_power <- function(first,second){first^second}
my_power(second=5,first=2)
my_power(s=5,f=2)
my_power(2,5)

# return 에 의한 출력, return 없으면 마지막 표현식의 실행결과

my_desc <- function(x,...){
  m.x <- mean(x,...); sd.x <- sd(x,...)
  res <- list(mean=m.x,sd=sd.x)
  return(res)
}

with(cars, my_desc(x=dist))
with(airquality, my_desc(x=Ozone, na.rm=TRUE))

my_desc_1 <- function(x,...){
  m.x <- mean(x,...); sd.x <- sd(x,...)
  list(mean=m.x,sd=sd.x)
}

with(cars, my_desc_1(x=dist))

find_roots <- function(a,b,c){
  if(a==0){
    roots <- c("Not quadratic eqation")
  } else{
    D <- b^2-4*a*c
    
    if (D > 0){
      roots <- c((-b+sqrt(D))/2*a,(-b-sqrt(D))/2*a)
    } else if (D==0){
      roots <- -b / (2*a)
    } else {
      roots = c("No real root")
    }
  }
  return(roots)
}
find_roots(1,4,3)


### ifelse(조건, 표현식1, 표현식2)

x <- c(10,3,6,9)
y <- c(1,5,4,12)
ifelse(x>y,x,y)

score <- c(80,75,40,98)
#예: 주어진 점수가 50미만이면 ‘Fail’, 50 이상이면 ‘Pass’를 점수와 함께 출력

grade <- ifelse(score<50,"Fail","Pass")
data.frame(score, grade)

#switch : switch(표현식, 선택항목리스트)
rm(list=ls())
(x <- sample(1:3,1))
switch(x, "Park","Lee","Kim")
switch("aa", aa="bb",bb="aa")

#예: 주어진 자료의 특성을 보고, 자료의 대푯값으로 평균과 중앙값 중 선택하는 함수 작성
rm(list=ls())
my_center <- function(x,type){
  switch(type, mean=mean(x), med=median(x))
}

x <- c(1,2,3,4,50)
my_center(x,"med")
my_center(x,"mean")

# & , | : vector의 element 별로 조건 체크
# &&, || : vector의 첫번째 값만 체크

x=c(1,2,5,7,8)
y=c(3,7,5,2,1)
w=2
u=7
(x>2) & (y>3)
(x>2) && (y>3)
(w>2) & (u>3)
(w>2) && (u>3)
(x>2) | (y>3)
(x>2) || (y>3)

x=runif(1)-0.5;x
if(x<0) print(abs(x))

if(x<0) print(abs(x)) else print(x)

ifelse(x<0, abs(x),x)

ifelse(x<0, c("x is negative"),c("x is positive"))

if(x>=-0.5 && x <=0.5) print(x) else print("wrong number")

for(i in 1:5){print(i)}

res <- vector("double", 5)
res
for(i in seq_along(res)){
  res[i] <- mean(rnorm(10))
}
res
round(res,3)

my_desc <- function(x, fun){fun(x)}
x <- rnorm(2000)
my_desc(x, mean)
my_desc(x, median)

#' while과 for의 차이점
#' for : 반복횟수 고정, while: 조건이 만족되는동안 반복

i = 1
while(i<=5){
  print(i)
  i = i + 1
}

fac.x <- 1
i <- 1
while(i <= 5){
  fac.x <- fac.x * i
  cat(i, "!=", fac.x, "\n", sep="")
  i <- i + 1
}

sum.x=0
i=1
while(i<=5){
  sum.x = sum.x+i
  cat("sum to ",i," = ",sum.x,"\n",sep="")
  i = i + 1
}

sum.x=0
x=c(1,1,1,8,7,6)
k=length(x)
i = 1
while(i <= k){
  sum.x=sum.x+x[i]
  i = i + 1
}
sum.x/k

sum.x=0
i=1
while(i<=10){
  if( i %in% c(2,4,6,8,10)){
    sum.x = sum.x + 2*i
  }
  else{
    sum.x = sum.x + i
  }
  i = i + 1
}
sum.x

#피보나치수열

pivo = vector("integer", 12)
i=1
pivo[1] <- 0
pivo[2] <- 1
while(i <= 10){
  pivo[i + 2] = pivo[i] + pivo[i + 1]
  i = i + 1
}
pivo



# lapply(), sapply()
# lapply() : 결과 리스트
# sapply() : 결과가 벡터 또는 행렬

x <- list(a1=1:5, a2=rnorm(5), a3=c(TRUE,FALSE,TRUE,TRUE))

lapply(x,mean)
sapply(x,mean)
unlist(lapply(x,mean))

set.seed(1234)
m <- -2 : 2
res <- vector("double", length(m))
for (i in seq_along(res)){
  res[i] <- mean(rnorm(n=10, mean=m[i], sd=0.5))
}
res

m<- -2:2
x <- lapply(m, rnorm, n=10, sd=0.5)
sapply(x,mean)

y <- lapply(m, rnorm, n=  10)
y <- lapply(m, rnorm, n=10,sd=0.5)
sapply(y,mean)

#margin : 1 = 행방향, 2 = 열방향

A <- matrix(c(0.8,1.3,1.0, 1.1, 1.3, 1.3, 0, 1.2, 0.2, 0.6, 1.4, 0.6), nrow=3)
A
rownames(A) <- c("Park", "Lee", "Kim")
colnames(A) <- paste0("trial", 1:4)
A
apply(A,1,mean)
apply(A,1,range)
apply(A,2,mean)

#' tapply 
#' tapply(X, INDEX, FUN, simplify=TRUE)
#' 
#' * apply 정리
#' lapply : list의 각 요소에 대해 함수 적용, 리스트로 처리
#' sapply : s=simplify, lapply와의 유일한 차이점 = 벡터 형태로 단순하게 처리
#' apply : list가 아닌 행렬을 받아서 처리
#' tapply : tapply(x,f, 함수, simplify= TRUE)
#' x 를 f (요인)별로 함수 처리, default : sapply처럼 simplify, simplify=FALSE -> lapply처럼

library(dplyr)
library(MASS)
Cars93 %>% View()

data(Cars93, package = "MASS")

with(Cars93, tapply(MPG.city, Origin, mean))
Cars93
with(Cars93, tapply(MPG.city,Origin,mean,simplify = FALSE))

x_g <- with(Cars93, split(MPG.city, Origin))
x_g
str(x_g)
lapply(x_g,mean)
#split(A,B) : A를 B의 값 별로 분리
rm(list=ls())
library(dplyr)
data(Cars93, package = "MASS")
Cars93
Cars93 %>% 
  group_by(Origin) %>% 
  summarise(m=mean(MPG.city), n=n())


airquality %>% View()
airs <- airquality %>% 
  dplyr::select(-Month, -Day)
apply(airs,2,mean,na.rm=TRUE)

# purrr 
# map(.x, .f, ...): lapply와 비슷한데 더 개선된 기능

library(tidyverse)

x <- list(a1=1:5, a2=rnorm(5), a3=c(TRUE, FALSE, TRUE, TRUE))

x
lapply(x, mean)
map(x,mean) #lapply와 동일하게 출력

map_dbl(x,mean) # 벡터로 출력

airs %>% 
  map_dbl(function (x) sum(x, na.rm=TRUE)/sum(!is.na(x)))

# map( )에서 가능한 기능
# - 사용자 정의 함수의 시작인 function( )을 물결표(~)로 대치
# - 한변수만사용되는함수인경우,변수대신점(.)또는.x사용

airs %>% 
  map_dbl(~ sum(.x,na.rm=TRUE) / sum(!is.na(.x)))

df1 <- list(x1=1:3, x2=2:4, x3=3:6)
df1
map_int(df1,2) #인덱싱이 실행, 두번째 리스트가 출력

df2 <- list(x1=rnorm(n=5, mean=-1), x2=rnorm(n=5, mean=1)) %>% map(summary)
df2
df2 %>% 
  map_dbl("Mean")

#map2 : 두개의 리스트를 입력 변수로 특정 함수를 반복 적용
# map2 (.x,.y,.f, ...)
# 두 개의 입력 리스트(벡터)길이가 같아야함, 길이가 1인 벡터의 경우만 순환법칙 적용

mu <- c(x1= -5, x2= 5)
sigma <- c(x1=2,x2=1)
map2(.x=mu,.y=sigma, rnorm, n=5)
#map2_dfc : 결과를 데이터프레임(tibble)러 츨력 : map2_dfc()

map2_dfc(.x = mu, .y = sigma, rnorm, n=3)

#------------------------------------------------------------------------------------------------------------

#1
rm(list=ls())
pivo <- vector("integer", 12)
pivo[1] = 0
pivo[2] = 1
i = 1

for (i in 1:10) {
  pivo[i+2] = pivo[i] + pivo[i+1]
}
i = 1
pivo <- vector("integer", 12)
pivo[1] = 0
pivo[2] = 1
while(i <= 10) {
  pivo[i+2] = pivo[i] + pivo[i+1]
  i = i + 1
}

#2
library(dplyr)
mtcars %>%
  as_tibble() %>% 
  select(mpg:wt) -> mtcars_a
#(2)

fun_mt = list(
  Mean = mean,
  SD = sd
)
fun_mt
method = c("Mean", "SD")


# 각 열의 평균과 표준편차 계산

#2-2
Mean <- sapply(mtcars_a, mean)
SD <- sapply(mtcars_a, sd)
data.frame(method=c("Mean","SD"), rbind(Mean, SD)) %>% as_tibble()

#2-3
rm(list=ls())
Mean <- map_dbl(mtcars_a, mean) 
SD <- map_dbl(mtcars_a, sd)
data.frame(method=c("Mean","SD"), rbind(Mean, SD)) %>% as_tibble()
# 새로운 데이터프레임 생성
result_df <- data.frame(method = c("Mean", "SD"), rbind(means, sds))

# 결과 출력
print(result_df)


mtcars_a %>% 
  summarise(across(mpg:wt, list(Mean=~mean(.), SD=~sd(.))))

  
map_dbl(mtcars_a, mean)
map_dbl(mtcars_a, sd)

#3

mtcars_a %>% map_dbl(~ c(mean(.x, na.rm=TRUE), sd(.x, na.rm=TRUE)))

#(1)
library(tidyverse)
airquality %>% View()
airquality %>% select(c(Ozone:Temp, Month)) -> airs 
airquality
?split
airs <- with(airquality, split(Month))

airquality %>% group_by(Month) %>% 
  select(Ozone:Temp) %>% 
  map(., mean, na.rm=TRUE)
  
with(airquality, map(Ozone:Temp, Month, mean))
airquality %>% 
  split(Month) %>% 
  map_dbl(~ mean(.x))
split
mtcars_a %>% map_dbl(~ c(mean(.x, na.rm=TRUE), sd(.x, na.rm=TRUE)))
#(2)

#(3)



airquality %>% split(Month) %>% 
  select(Ozone:Temp) 
  summarise(across(Ozone:Temp, mean,na.rm=TRUE, .names = "{col}_Mean"))

airs$Ozone %>% 


#(4)
rm(list=ls())
airs %>% View()
airs %>% group_by(Month) %>% 
  summarise(across(Ozone:Temp, ~sum(is.na(.x))))




