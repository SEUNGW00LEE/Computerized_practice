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


