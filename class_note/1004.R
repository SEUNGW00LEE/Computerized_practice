library(tidyverse)

#' tibble : 데이터 유형에서 데이터프레임에서 약간 좀더 개선된 형태의 데이터 유형이라고 볼 수 있음
#' tibble을 만들기위해서는 이미 tidyverse가 system안에 들어와있어야한다. ( <- library(tidyverse))

as_tibble(cars) # 기존의 데이터 프레임을 tibble로 전환
tibble(x=1:3, y=x+1, z=1)
# 길이가 1인 스칼라만 순환법칙 적용된다.
# 함께 입력되는 변수를 이용한 다른 변수의 생성이 가능하다. 

data.frame(x=1:3,y=x+1)
# -> Error in data.frame(x = 1:3, y = x + 1) : object 'x' not found

#' tibble: 함께 입력된 변수를 이용하여 다른 변수를 만드는 기능이 가능하지만
#' data.frame : data.frame은 가능하지않다.

# tribble() : 행 단위로 입력하여 tibble  생성
tribble(
  ~x, ~y, # 첫 줄 : 변수 이름은 '~'로 시작
   1, "a",
  2, "b",
  3, "c"
)

mtcars
mtcars_t <- as_tibble(mtcars)
mtcars_t

mtcars_d <- rownames_to_column(mtcars, var="rowname")
mtcars_d
mtcars_d_t <- as_tibble(mtcars_d)
mtcars_d_t

df1 <- data.frame(xyz=1:3, abc=letters[1:3])
df1
df1$x # 기호 '$'을 사용하는 경우 : 변수 이름의 부분 매칭 허용 허락
df1_t <- as_tibble(df1)
df1_t$x
#' -> Warning message:
#' Unknown or uninitialised column: `x`. 
#' tibble에서는 변수 full name을 입력해야한다.

mtcars
mtcars[, 1:2]
mtcars[, 1]

mtcars_t
mtcars_t[, 1:2]
mtcars_t[, 1]
mtcars_t[1,1]

# tibble은 인덱싱이 몇개가 되든(1개든, ~~) 항상 tibble 유지

#' list : 가장 포괄적인 구조
#' 구성요소 : 벡터, 배열, 데이터 프레임, 함수, 다른 리스트
#' 서로 다른 유형의 객체를 한데 묶은 또 다른 객체

x <- list(a=c("one", "two", "three"), b=1:3, c=list(-1,-5), d=data.frame(x1=c("s1","s2"), x2=1:2))
x
x[1] #[]결과는 list 형태로 배출
x[2]
x[3]
x[4]
x[[1]] #[[]]결과는 해당되는 구성요소의 객체 구조
str(x[1])
str(x[[1]])
x[[4]]
x$d
x[[4]][[2]]
x[[4]][2]

