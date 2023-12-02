#' chapter 3

library(readr)

#' read_table2

read_table2()
read_table2("*.txt", col_types="dcd")

#' read_table2 option

#' col_types : 자료 유형을 나타냄 : c(문자형),i(정수형),d(실수형),n(숫자형),l(논리형),f(요인),D(날짜)
#' 변수 이름 없으면 반드시 col_names 사용 , col_names+FALSE : X1,X2, ...
#' comment : 주석의 기호 지정 (#으로 쓰여져있으면 comment = "#")
#' skip : 무시할 행의 개수
#' na : 결측값이 NA가 아닌 다른 기호로 입력된 경우 (ex: na= "-")
#' ex: na=c(".","NA") --> .와 NA 모두 결측값으로 입력

#' read_csv()
#' 규칙(문자로시작하고 중간에 빈칸이 없어야함)에 어긋나는 변수에 ``적용
#' col_types, comment, skip, na 옵션 동일하게 작동

#' read_fwf()
#' 고정 포맷 파일 불러오기
#' (ex)
#' 24M2000
#' 35F3100
#' 28F3800
#' 21F2800
#' read_fwf(".txt", 
#'    col_position=fwf_widths(widths=c(2,1,4),
#'    col_names=c("age","gender","income"))
#' )
#' or
#' read_fwf(".txt",
#'    col_position = fwf_positions(start= c(1,3,4),
#'                                 end = c(2,3,7),
#'                                 col_names=c("age","gender","income"))
#' )
#' 
#' 데이터 프레임 --> 외부로 저장
#' 
#' write_delim : 빈칸으로 구분
#' write_csv : comma 구분
#' write_txv : tap 으로 구분
#' 
#' excel 파일 불러오기
#' library(xlsx) : read_xlsx
#' library(readxl) : read_excel
#' 
#' sas 파일 불러오기
#' library(haven) : read_sas
#' 
#' html 테이블 불러오기 
#' library(rvest) : read_html, hteml_nodes, hteml_table

#' chapter 4

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
#     2.
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


