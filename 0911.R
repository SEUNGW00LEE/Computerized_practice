
seq(from=0, to=5)
seq(from=0, to=5, by=2)
seq(from=0, to=5, length=3)

rep(1:3, times=c(2,2,2))

paste("stat", 1:3)
paste("stat", 1:3, sep="") 
paste0("stat", 1:3)

letters
LETTERS

#' substr : substr(x, start, stop); 주어진 문자열의 일부분을 선택하는 함수


substr("Statistics", 1, 4)

x <- c("응용통계학과", "정보통계학과", "학생회장")
substr(x, 3, 6)
substr(x, c(1,3), c(2,6)) # 주의! 실수 많이 나옴! 

x <- c("New York, NY", "Ann Arbor, MI", "Chicago, IL")
substr(x, nchar(x)-1, nchar(x)) #뒤에 두글자 추출

# 연습문제

# 2 - 8, 2 - 9

seq(from=-5.0, to=5.0, by=0.2)
seq(from=1, to=9, by=2);seq(from=2, to=10, by=2)
rep(1:4, times= c(1,2,3,4))
rep(c("a","b"), times=c(2,3))
paste0("a", 1:5)
paste0(c("a","b","c"), c("a","b","c"))
