library(dplyr)
x <- c("New York, NY", "Ann Arbor, MI", "Chicago, IL")

#strsplit

(y <- strsplit(x, split=",")) # >(지정문) : 지정문 결과 인쇄
y

#unlist

unlist(y)

# . 을 기준으로 문자열 분리

x <- "A.B.C.D"
y <- strsplit(x, split=".")
y # 분리되지않는다, .을 기준으로 분리할때는 \\.또는 [.]를 통해 분리하여야한다
(z<- strsplit(x, split="\\."))

#toupper(), tolower() : 대소문자 수정

x <- c("park", "lee", "kwon")
(y <- toupper(x))
(y <- tolower(x))

substr(x,1,1) <- toupper(substr(x,1,1)) #벡터 x의 첫글자만 대문자로 변환
x

#' sub(), gsub() : 문자열의 치환
#' sub : 문자열의 첫번째 old만 new로 치환
#' gusb : 문자열의 모든 old가 new로 치환
#' 
x <- "Park hates stats. He hates math, too."
sub("hat", "lov", x)
gsub("hat", "lov", x)

#벡터의 연산 : 벡터와 벡터의 연산은 대응되는 각 구성요소끼리의 연산으로 이루어짐

x <- c(7,8,9,10)
y <- c(1,2,3,4)

x+y;x-y;x*y;x^y

#벡터와 스칼라의 연산도 동일한 개념으로 실행됨
x
x + 3
x /4
2^x

#벡터의 연산에서 나올 수 있는 특수문자 : Inf, -Inf = 양의 무한, 음의 무한 NaN : 계산 불능(Not a Number), NA : 결측치(Not Available), NULL : 값이 비어있는 상태, 데이터의 유형도 없고 길이도 없다.

c(-1, 0 ,1)/0
sqrt(-1)
Inf-Inf

#' 벡터 연산의 순환법칙
#' 벡터와 벡터의 연산은 대응되는 요소끼리의 연산
#' 만일 두 벡터의 길이가 달라 일대일 대응이 되지 않는다면 길이가 짧은 벡터를 순환 반복시켜 길이를 같게 만든 후 연산을 수행

c(1,2,3,4,5,6) + c(1,2,3)

# 긴 벡터의 길이가 짧은 벡터의 길이의 배수가 되지 않는 경우: 반복으로 두 벡터의 길이를 동일하게 만들 수 없다.

1:4 + 1:3

#' 수학 계산 관련 함수
#' abs : 절대값
#' sqrt : 제곱근
#' celling(3.475) : 3.475보다 크거나 같은 가장 작은 정수
#' floor(3.475) : 3.475보다 작거나 같은 가장 큰 정수
#' trunc : 소수점 이하 버림
#' round(x, z) : 소수 z자리로 반올림
#' signif(x, z) : 유효수 2자리로 반올림
#' sin : 삼각함수
#' asin : 역삼각함수
#' log(x, a) : 밑이 a인 로그
#' log(x) : 자연로그
#' log10(x) : 상용로그
#' exp(log()) : 지수함수, 자연로그의 역함수

#' 기초 통계함수
#' mean
#' median
#' range
#' IQR
#' sd
#' var
#' sum
#' min
#' max
#' diff

#' 결측값
#' 결측값 기호 : NA
#' 데이터에 결측값 포함 여부 확인 함수 : is.na
