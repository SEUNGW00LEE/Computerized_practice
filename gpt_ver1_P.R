rm(list=ls())

# 문제 1: 데이터 프레임과 조건부 추출
df1 <- data.frame(name = c("Alice", "Bob", "Charlie", "Diana", "Eve"), age = c(23, 34, 45, 36, 50))
# 명령문 한줄: df1에서 'name' 열의 마지막 글자가 "e"인 사람들의 'age'의 평균을 계산하시오.

mean(df1$age[substr(df1$name,nchar(df1$name),nchar(df1$name)) == "e"])

# 문제 2: 날짜 데이터 연산
# 명령문 한줄: "2022-01-01"로부터 150일 후가 몇 월인지를 숫자로 출력하시오.

as.numeric(strsplit(as.character(as.Date("2022-01-01") + 150), "-")[[1]][2])

# 문제 3: 기초 통계
v1 <- c(5, 10, 15, 20, 25)
# 명령문 한줄: v1의 값들 중 홀수번째 인덱스 값을 가진 원소의 평균을 계산하시오.

mean(v1[seq(1,length(v1),2)])

# 문제 4: 데이터 프레임 생성과 접근
# 명령문 한줄: "apple", "banana", "cherry"를 갖는 fruit 열과 그 단어들의 길이를 갖는 len 열을 가진 데이터 프레임 df2을 생성하시오.

df2 <- as.data.frame(tibble(fruits = c("apple","banana","cherry"), len=nchar(fruits)))

# 문제 7: 데이터 프레임 조건부 추출과 연산
df4 <- data.frame(name = c("Alice", "Bob", "Charlie", "Diana", "Eve"), score = c(85, 90, 78, 92, 66))

# 명령문 한줄: df4에서 score가 80 이상인 학생들의 score의 합을 계산하시오.
sum(df4$score[df4$score>=80])

# 문제 9: 데이터 프레임의 열 이름 변경
df6 <- data.frame(A = 1:3, B = 4:6)
# 명령문 한줄: df6의 열 이름 'A'를 'Z'로 변경하시오.

colnames(df6)[colnames(df6)=="A"] <- "Z"

# 문제 10: 데이터 프레임의 특정 열의 값 변경
df7 <- data.frame(name = c("Alice", "Bob", "Charlie"), age = c(23, 34, 45))
# 명령문 한줄: df7에서 'name' 열이 "Bob"인 행의 'age'를 35로 변경하시오.
df7$age[df7$name=="Bob"]=35

