# 201912644 이승우

#1 기존방법과 새 방법의 평균, 분산, 최고치를 구하시오
origin <- c(78.5, 60.3, 81.7, 69.0, 64.0, 62.6, 86.7)
new <- c(82.0, 74.9, 88.1, 62.1, 78.5, 79.9, 94.4)

#기존방법의 평균 
mean(origin)
#기존방법의 분산 
var(origin)
#기존방법의 최고치 
max(origin)
#새방법의 평균 
mean(new)
#새방법의 분산 
var(new)
#새방법의 최고치 
max(new)

#2 기존방법의 5% 절사평균을 구하시오

mean(origin, trim=0.05)

#3 x축: 기존방법 y축: 새방법 산점도를 그리시오

plot(origin, new)

#4 함수 xyplot을 이용하여 산점도를 그리시오.

install.packages("lattice")
library(lattice)
xyplot(new~origin)
