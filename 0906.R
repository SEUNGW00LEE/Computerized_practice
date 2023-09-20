#' 2장 : 
#' 통계분석을 한다는 것은 데이터가 구축된 상태에서 작업을 시도할 수 있는데, 어떻게 데이터를 구축하냐의 내용
#' 
#' 데이터의 유형 중요, 순서형 데이터는 숫자의 의미를 가지고 있지 않음
#' 
#' R 데이터 유형 : 숫자형, 문자형, 논리형
#' 변환의 우선순위 : 문자형 > 숫자형 (실수형 > 정수형) > 논리형
#' 
#' 벡터 안의 유형이 혼재되있으면 우선순위가 높은 것으로 통일이 된다.
#' (ex) 문자형, 숫자형의 혼재 -> 모두 문자형으로


x <- c(TRUE, FALSE, TRUE)
y1 <- c(1L, 3L, 5L) #L : 숫자를 정수로 지정, 없으면 실수로 지정
y2 <- c(1.1, 3.5, 10.4)
z <- c("one", "two", "three")

typeof(x)
typeof(y1)
typeof(y2)
typeof(z)

y1
length(y1)
a <- 1; #세미클론(;) 은 "명령문이 끝났다"를 의미, 한 줄에 여러 명령어를 작성 가능

#' 다른 유형의 데이터가 뒤섞여 입력된 경우

c(1, "1", TRUE) # [1] "1"    "1"    "TRUE" 모두 문자형으로 통일이 됨
c(3, TRUE, FALSE) # [1] 3 1 0 모두 숫자형으로 통일이 됨

c(Seoul=9930, Busan=3497, Inchon=2944, Suwon=1194)
pop <- c(9930, 3497, 2944, 1194)
names(pop) <- c("Seoul", "Busan", "Inchon", "Suwon")
View(pop)


x <- scan() #consol 창에서 데이터 입력 함수
y <- scan(what="character")

#' 벡터의 수정(추가, 삭제 등)
 
#' c , append

#c
x <- c(11,12,13,14)
c(x, 15)
y <- c(16,17,18)
c(x, y)

#append
append(x, 15)
append(x, 15, after=2)
append(x, y)
append(x, y, after=3)
