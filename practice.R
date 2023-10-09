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

x <- c(TRUE,FALSE,TRUE)
y1 <- c(1L, 2L, 3L)
y2 <- c(1.1, 3.5, 10.4)
z <- c("one", "two", "three")

typeof(x)
typeof(y1)
typeof(y2)
typeof(z)

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
#'New York'
y
#[1] "Seoul"    "suwon"    "New York"

x <- c(11,12,13,14)
c(x,15) #벡터에 데이터 추가
y <- c(16,17,18)
c(x,y)

append(x,15)
x
