library(dplyr)

#summary : 최소, 최대, 평균, 중앙값, 1사분위수, 3사분위수
#mean : 평균
#sd : 표준편차

rm(list=ls())
speed <- c(4,7,8,9,10, 11, 12, 13, 13, 14)
dist <- c(2,4,16,10, 18, 17, 24, 34, 26, 26)
mean(dist)
sd(dist)
cor(speed,dist)
plot(speed,dist)

install.packages("UsingR")
library(UsingR)

help(package= MASS)
help(plot)

install.packages("tidyverse")
library(tidyverse)

#변환순위 : 문자형 > 숫자형 > 논리형


# 벡터의 생성 : 함수 c()
x <- c(TRUE,FALSE,TRUE)
y1 <- c(1L, 2L, 3L)
y2 <- c(1.1, 3.5, 10.4)
z <- c("one", "two", "three")
x
# 벡터의 구성요소 : typeof
typeof(x)
typeof(y1)
typeof(y2)
typeof(z)

#벡터의 길이 : length
length(y1)
a <- 1; a
c(1, "1", TRUE)
c(3, TRUE, FALSE) #숫자형과 논리형이 같이 있으면 숫자형으로 됨, 숫자형이 변환순위가 더 높기때문에
# --> 3, 1, 0

c(Seoul = 9930, Busan = 3497, Inchon = 2944, Suwon = 1194)

pop <- c(9930, 3497, 2944, 1194)
pop
names(pop) <- c("Seoul", "Busan", "Inchon", "Suwon")
pop

x <- scan()

x
y <- scan(what="character")
#Seoul suwon
#'New York'  # 자료에 인용부호를 사용하나 안사용하나 결과는 같음
y
#[1] "Seoul"    "suwon"    "New York"

x <- c(11,12,13,14)
c(x,15) #벡터에 데이터 추가
y <- c(16,17,18)
c(x,y)

append(x,15)
x

df1 <- data.frame(x=c(2,4,6), y=c("a","b","c"))
View(df1)

append(x, 15, after=2) #두번째 데이터 뒤에 들어감(3번째에 들어감)

append(x,y)
append(x,y, after=3)

1:5
-3:3
1.5:5.4
5:0
seq(from=0,to=5) #0부터 5까지 1씩 증가, 0 1 2 3 4 5
seq(from=0,to=5, by=2) #0부터 5까지 2씩 증가, 0 2 4
seq(from=0,by=2, length=3) #0부터 2씩 증가, 3개, 0 2 4
seq(3) #숫자만 입력되면 1부터 시작, 1씩 증가/감소
seq(-3) 
?seq
seq(from=2, by=3, length=4) #2 5 8 11
seq(from=9, to=45, by=9) #9 18 27 36 45
c(seq(from=1,to=7,by=2), seq(from=2,to=8,length=4))
# 1 3 5 7 2 4 6 8

rep(1, times=3) # 1 1 1
rep(1:3, times=2) # 1 2 3 1 2 3 
rep(c("M","F"),times=c(2,3)) #M M F F F
rep(1:3, each=2) #1 1 2 2 3 3 
rep(1:3, each=2, times=2) #1 1 2 2 3 3 1 1 2 2 3 3 
rep(1:3, length=6) # 1 2 3 1 2 3 
rep(1:3, length=5) # 1 2 3 1 2 
rep(1:3, each = 2, length=8) # 1 1 2 2 3 3 1 1 

x <- c("Park", "Lee", "Kwon") 

#문자열 구성하는 문자 개수
nchar(x) #4 3 4 
nchar("응용통계학과") # 6

# paste : 문자열의 결합
paste("모든","사람에게는","통계적","사고능력이","필요하다.")
paste("모든","사람에게는","통계적","사고능력이","필요하다.", sep="-")
paste("모든","사람에게는","통계적","사고능력이","필요하다.", sep="")

paste("원주율은", pi, "이다")
paste("Stat", 1:3, sep="")
paste0("Stat", 1:3)
# paste( ~, sep="") = paste0(~)
paste(c("Stat","Math"), 1:3, sep="-")
#[1] "Stat-1" "Math-2" "Stat-3"
#letters:알파벳 소문자
#LETTERS:알파벳 대문자

letters
LETTERS

paste0(letters, collapse = "")
paste0(LETTERS, collapse = ",")
paste0(LETTERS, sep = ",")
# sep : 여러 개 문자형 벡터들 결합에 작용 --> 하나하나 따로 만듬
# collapse : 단일 문자형 벡터의 결합에 작용 --> 하나에 다 만듬

#substr (x, start, stop) : start, stop : 정수형 스칼라 또는 벡터(대응되는 숫자끼리 시작점과 끝점 구성)
substr("Statistics", 1,4)

x <- c("동물자원과학과", "응용통계학과", "인권부장")
substr(x, 3, 6)

substr(x, c(1,3), c(2,6)) #순환법칙작용

x <- c("New York, NY", "Ann Arbor, MI", "Chicago, IL")
substr(x, nchar(x)-1, nchar(x))

x <- c("New York, NY", "Ann Arbor, MI", "Chicago, IL")

(y <- strsplit(x, split=','))

unlist(y)

unlist(strsplit("PARK", split=""))

unlist(strsplit("a.b.c", split=".")) #정규표현식이 사용되어 결과를 얻을 수 없음

unlist(strsplit("a.b.c", split="[.]")) # [.] == \\.

x <- c("park", "lee", "kwon")
(y<-toupper(x))

tolower(y)

(substr(x,1,1) <- toupper(substr(x,1,1)))
x

#sub(old,new,문자열) : 문자열의 첫번째 old만 new로 치환

#gsub(olde, new, 문자열) 문자열의 모든 old가 new로 치환

x <- "Park hates stats. He hates math, too"

sub("hat", "lov", x)
#[1] "Park loves stats. He hates math, too"
gsub("hat", "lov", x)
#[1] "Park loves stats. He loves math, too"


# • 예:
#   - 문자열 “banana1” , “banana2” , “banana3” 생성 - 첫번째a를A로변경
# - 모든a를A로 변경

(y <- paste0("banana", c(1:3)))
sub("a","A",y)
gsub("a","A",y)
# 문자열의 일부 삭제는 new에 "" 입력
(z <- "Everybody cannot do it")
gsub("not","",z)

#벡터의 연산

x <- c(7,8,9,10)
y <- c(1,2,3,4)

x+y
x-y
x*y
x/y
x^y

x
x+3
x/4
2^x

# Inf : 양의 무한대
# Inf : 음의 무한대
# NA : Not Available, NULL : 값이 비어있는 상태, 데이터 유형도 없고, 길이도 없다.

c(-1,0,1)/0
sqrt(-1)
Inf - Inf
Inf/Inf

# 벡터 연산의 순환법칙
# 벡터와 벡터의 연산은 대응되는 요소끼리의 연산

c(1,2,3,4,5,6) + c(1,2,3)
#길이가 짧은 c(1,2,3)을 순환 반복하여 c(1,2,3,1,2,3)을 만들어 길이를 같게 만든 후 연산을 수행
#벡터와 스칼라의 연산도 동일하게 수행됨
1:4 + 1:3

abs(-3) #절대값
sqrt(25)
ceiling(3.4513) #작지않은 가작 작은 정수 == 올림
floor(3.123123) #크지않은 가장 큰 정수 == 내림
trunc(5.99) #소수점 버림
round(3.4512,2) #소수점 2자리 반올림

signif(0.003122) #유효수 2자리로 반올림
sin(1) #삼각함수
asin(sin(1)) #역삼각함수
log(2, base=2) #밑이 2인 로그
log(10) #자연로그
log10(10) #상용로그
exp(log(10))

x <- c(1,2,3,4,50)
mean(x)
median(x)
range(x)
IQR(x)
sd(x)
var(x)
sum(x)
min(x)
max(x)
diff(c(1,2,4,7,11))   # 뒷 값 - 앞 값

x <- c(1,0,3,5,NA)
is.na(x)
sum(is.na(x))


x
mean(x, na.rm=TRUE); max(x, na.rm=TRUE)
x <- c(3,8,2)
y <- c(5,4,2)

x > y
x >= y
x < y
x <= y
x == y
x != y

x <- 1:3
x > 2
x < 2
x <= 2 | x >= 3
x <= 2 & x >= 1

#벡터 전체의 비교 결과를 원할 때 : any , all

x <- 1:5
any(x>=4) #전체 중 하나라도
all(x>=4) #전체 모두가

x <- 1:5
x >= 4
sum(x>=4) # x>=4인것의 개수
mean(x>=4) # x>=4인것의 비율

# %in% : 벡터의 구성요소 중 특정 값 포함 여부 확인

x <- 1:5
x %in% c(2,4)
x == c(2,4) # c(2,4,2,4,2,4)로 작용

#벡터의 인덱싱
(y <- c(2,4,6,7,10))
y[c(1,3,5)]
y[c(-2,-4)] #지정된 인덱스 제외
y[c(2,2,2)]
y[6]

pop=c(seoul=9930, busan=3497, inchon=2944, suwon=1194)
pop
pop[c("seoul", "inchon")]

y
y[c(TRUE, TRUE, FALSE, FALSE, TRUE)]
y>3
y[y>3]

x<- c(80,88,90,93,95,94,99,78,101)
x >= mean(x)
x[x >= mean(x)]
# 예제: 벡터 x에서
# 1) 평균으로부터 +- 1 표준편차 안에 있는 관찰값
# 2) 평균으로부터 +- 1 표준편차와  2 표준편차 사이에 있는 관찰값
# 3) 평균으로부터 +- 2 표준편차를 벗어나는 관찰값

#1) 
x
sd(x)
x[x <= mean(x)+sd(x) & x>= mean(x) - sd(x)]
x[abs(z) <= 1]
#2)
x[x >= mean(x)+sd(x) & x <= mean(x) + 2*sd(x)
  | x<= mean(x) - sd(x) & x >= mean(x) -2*sd(x)] 
x[abs(z) > 1 & abs(z) < 2]
#--> 절대값을 쓰고 z 값을 쓰면 더 빠르게 가능
z <- (x-mean(x))/sd(x)
z
x[abs(z) > 2]

#factor

gender <- c("Male", "Female", "Female")
gender_f <- factor(gender)
gender
gender_f
#factor : 인용부호가 없음, Female이 첫번째, Male이 두번째, 알파벳 순으로 결정
# lecel : 요인 변수에 정의된 값들
as.numeric(gender )
as.numeric((gender_f))
as.numeric(gender_f) + 1
gender_f + 1

#알바펫 순서에 따라 정수 값으로 저장
# as.numeric --> 숫자화

x <- c(1,3,2,2,1,4)
factor(x) 
# [1] 1 3 2 2 1 4
# Levels: 1 2 3 4
factor(x , labels=c("A", "B", "C", "D"))
# [1] A C B B A D
# Levels: A B C D

# --> labels : level의 이름 변경, 데이터 값도 변경 --> level 따라간다

factor(x, labels=c("A","A", "B","B"))
# A --> A, B --> A, C --> B, D --> B

typeof(gender_f) #데이터 유형 표시
# [1] "integer"
class(gender_f) #class 속성표시
# [1] "factor"

summary(gender) #문자형 속성 분석
# Length     Class      Mode 
# 3 character character 
summary(gender_f) # 요인형 : 빈도분석
# Female   Male 
# 2      1

income <-c("Low", "Medium", "High", "Medium")
factor(income)
# High 1, Low 2, Medium 3 qowjd
as.numeric(factor(income))
factor(income, order=TRUE)

# [1] Low    Medium High   Medium
# Levels: High < Low < Medium

factor(income)                                                                        
factor(income, order=TRUE,level=c("Low","Medium" ,"High"))

as.numeric(factor(income, order=TRUE, level=c("Low", "Medium", 'High')))

x <- c(80,88,90,93,95,94,100,78,65)
cat.x <- cut(x, breaks = c(0,80,90,100), include.lowest=TRUE, right=FALSE, labels=c("C","B","A"))
cat.x

# breaks : 구간의 최소값, 최대값을 포함한 구간 설정 벡터
# right : TRUE - a < x <= b 
#         FALSE - a< x < b
# inclue.lowest : 구간의 최소값 또는 최대값을 포함시킬지
# - include.lowest=T min <= x <= b (right = TRUE)
# - include.lowest=T min <= x < b (right = FALSE)

#cut으로 순서형 요인 생성: ordered_result=TRUE

cut(x, breaks=c(0,80,90,100), include.lowest = TRUE,
    right=TRUE, labels=c("C","B",'A'), ordered_result = TRUE)

x <- as.Date(c("2017-01-01", "2018-01-01"))
x


s1 <- as.Date("2018-03-01")
e1 <- as.Date("2018-03-31")
seq(from=s1, to=e1, by=7)
seq(from=s1, by="week", length=5)
seq(from=s1, by="month", length=5)
seq(from=s1, by="year", length=5)

#matrix

(x <- matrix(1:12, nrow=3))
#열단위로 자료 입력
y<- matrix(1:12, nrow=3, byrow=TRUE)
#byrow를 통해 행단위로 입력
y
x1 <- 1:3
x2 <- 4:6
(A<- cbind(x1,x2))
(B <- rbind(x1,x2))

cbind(A, x3=7:9)
rbind(A, 7:8)
rbind(B, x3=7:9)

x1 <- 1:4
x2 <- 5:8
x3 <- 7

cbind(x1,x2,x3)
#결합 대상의 길이가 다를 때 순환법칙이 작용

x <- 1:12
dim(x) <- 3:4
x
rownames(x) <- c("one", "two", "three")
colnames(x) <- c("a","b","c","d")
x

length(x)
nrow(x); ncol(x)
dim(x)

xyz <- array(1:24, c(4,3,2))
xyz

dimnames(xyz) <- list(X=c("x1","x2","x3","x4"),
                      Y=c("y1","y2","y3"),
                      Z=c("z1","z2"))
xyz

x
x[2,3]
x[1,]
x[,2]
x[1:2,]

xyz <- array(1:24, c(4,3,2))
xyz
xyz[,1,1]
xyz[,,1]

A <- matrix(1:4, nrow=2, byrow=T)
A
B <- matrix(5:8, nrow=2, byrow=T)
B
A * B
A %*% B
t(A)
colMeans(A)
rowSums(A)
diag(A)
x <- c(10,20)
x
diag(x)
diag(2)
diag(3)
A
solve(A)
solve(A) %*% A
# solve 역행렬 A-1
b<- c(5,6)
solve(A,b)

df1 <- data.frame(x=c(2,4,6), y=c("a","b","c"))
df1

str(df1)

#data.frame : 입력되는 벡터의 길이가 같아야함 
#             길이가 1인 벡터 : 순환법칙 작용
data.frame(x=1, y=c("a","b","c")) #길이가 1인 벡터만 순환법칙 작용

# colnames()==names(), rownmaes(), length() : col 개수

df1
colnames(df1)
names(df1)
rownames(df1)
length(df1)

df1
typeof(df1)
df1[1] # 결과 형태 데이터프레임
df1[[1]] # 결과 형태 벡터
typeof(df1[1])
typeof(df1[[1]])

df1[["x"]]
df1$x

df1[c(1,2), 1]
df1
df1[c(1,2),]

# with 편하게 데이터 프레임에 접근하는 방법
# with(dataframe, 명령문)
airquality
z.Temp <- (Temp-mean(Temp))/sd(Temp)
#Error: object 'Temp' not found
z.Temp <- (airquality$Temp-mean(airquality$Temp))/sd(airquality$Temp)
z.Temp <- with(airquality, (Temp-mean(Temp))/sd(Temp))

library(tidyverse)
as_tibble(cars)
tibble(x=1:3, y=x+1, z=1)
#tibble() vs data.frame()
#tibble은 함께 입력된 변수를 이용하여 다른 변수를 만들 수 있음
#dataframe은 불가능

data.frame(x=1:3, y=x+1)
# Error in data.frame(x = 1:3, y = x + 1) : 
#   arguments imply differing number of rows: 3, 2

tribble(
  ~x, ~y,
  1, "a",
  2, "b",
  3, "c"
)
# 행단위로 입력하여 tibble 생성, 첫줄: 변수이름은 ~로 시작

data(Cars93, package="MASS")
Cars93
as_tibble(Cars93)
print(tbl, n=20, width=Inf)

head(mtcars)
mtcars_t <- as_tibble(mtcars)
print(mtcars_t, n=6)

mtcars_d <- rownames_to_column(mtcars, var="rowname")
View(mtcars)
View(mtcars_d)

df1 <- data.frame(xyz=1:3, abc=letters[1:3])
df1
df1$x # 부분 매칭을 허용한다. x로 xyz 열을 찾아서 반환
tb1 <- as_tibble(df1)
tb1$x #error
tb1
tb1$xyz

mtcars
typeof(mtcars)

mtcars[, 1:2]
mtcars[, 1]
mtcars_t[,1:2]
mtcars_t[,1]
mtcars_t[1,1]
#tibble형태는 인덱싱을해도 tiblle형태로 반환
View(mtcars_t)



# 리스트 : 가장 포괄적인 구조, 구성요소 : 벡터, 배열, 데이터프레임, 함수, 다른 리스트, 서로 다른 유형의 객체를 한데 묶은 또 다른 객체

x <- list(a=c("one","two","three"), b=1:3, c=list(-1,-5), d=data.frame(x1=c("s1","s2"), x2=1:2))
typeof(x)
typeof(x$d)
x
# list[a]: 결과는 리스트
# list[[a]] = list$a : 해당되는 구성요소의 객체 구조
x[1]
x[[1]]
str(x[1])
str(x[[1]])

x[[4]]
x$d
x[[4]][[2]]
x[[4]][2]

########
##예제##
########

###
#1#
###
x <- c(17,16,20,24,22,15,21,18)
length(x)
x[length(x)]
###
#2#
###
y <- c(10.4, 5.6, 3.1, 6.4, 9.6, 7.8, 12.1)
length(y)
y[length(y)-1]
###
#3#
###
grade <- c("1st","1st","2nd","3rd","2nd","3rd","1st")
grade <- as.factor(grade)
grade
help("factor")
factor(grade, ordered = TRUE, levels=c("3rd","2nd","1st"))
###
#4#
###
m1 <- matrix(c(12,17,19,21,22,25,32,34,35), nrow=3)
colnames(m1) <- paste0("var",seq(1:3))
m1
rownames(m1) <- paste0("Case #", seq(1:3))
m1
m1[,2]
###
#5#
###
m1 <- as.data.frame(m1)
rownames(m1) <- seq(1:3)
m1
m1[2]
###
#6#
###
iris
length(iris)
nrow(iris)
colnames(iris)
head(iris,3)
tail(iris,3)

###
#7#
###
df1 <- tibble(x=1, y=1:9,z=rep(c(1:3),each=3),w=sample(letters,9))
df1
df1[[2]]
df1$y
df1[["y"]]
df1[[2]][1:5]
df1 <- as.data.frame(df1)
df1
df1[[2]][1:5]
df


#####
#8-1#
#####
seq(from=-5.0, to=5.0, by=0.2)
#####
#8-2#
#####
c(seq(from=1,to=9,by=2),seq(from=2,to=10,by=2))
#####
#8-3#
#####
rep(1:4,1:4)
#####
#8-4#
#####
rep(seq(1:3),3)
#####
#8-5#
#####
rep(c("a","b"),c(2,3))
######
#8-6##
######
paste0("a",seq(1:5))

######
#8-7##
######

# ****************************************************#
# #8-7 중요!###########################################
#######################################################

paste0(seq(c("a","b","c")),seq(c("a","b","c")))
rep(c("a","b","c"),c("a","b","c"))
paste0(rep("a","b","c", each=c("a","b","c")))

paste0(rep(c("a","b","c"),times=3),rep(c("a","b","c"),each=3))

###
#9#
###
a1 <- paste0(letters, seq(1:26))
a1
a2 <- paste0(a1,collapse="-")
a2
a3 <- gsub("-","",a2)

####
#10#
####

x <- c(10.4,5.6,3.1,6.4,21.7)
x_mean <- sum(x)/length(x)
mean(x)
x_sd <- sqrt(sum((x -mean(x))^2/(length(x)-1)))
sd(x)
x_sd

x_diff <- x[2:length(x)] -x[1:length(x)-1]
x_diff
diff(x)

####
#11#
####

y <- c(17,16,20,24,22,15,21,18)
y[y==max(y)]
y[y==max(y)] <- 23

sum(y > 20)
mean(y < 18)  
####
#12#
####
score <- c(85,91,75,69,52,95,88,100)


grade <- cut(score,breaks=c(0,60,70,80,90,100),
                labels = c("F","D","C","B","A"),
             include.lowest = TRUE, right=FALSE)
grade
score
data.frame(score, grade)
####
#13#
####
X <- matrix(c(1,3,2,7,12,6,1,3,6,6,7), nrow=1)

Y <- matrix(c(6.1,9.7,10.3,18.8,28.3,16.1,5.7,12.6,16.1,15.8,18.8), nrow=1)

####
#14#
####

A <- list(mat=matrix(c(1.2,2.5,3.1,1.5,2.7,3.2,2.1,2.1,2.8),nrow=3), df=data.frame(x1=c("Park","Lee","Kim"), x2=c(14,16,21)))
A

rownames(A$mat) <- paste0("Sub",1:3)
colnames(A$mat) <- paste0("Trt", 1:3)
colnames(A$df) <- c("name","sales")
A

rowMeans(A$mat)
mean(A$df[2])
colMeans(A$df[2])
