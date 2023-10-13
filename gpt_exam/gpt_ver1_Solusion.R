# 정답 1: df1에서 'name' 열의 마지막 글자가 "e"인 사람들의 'age'의 평균을 계산하시오.
mean(df1$age[substr(df1$name, nchar(df1$name), nchar(df1$name)) == "e"])

# 정답 2: "2022-01-01"로부터 150일 후가 몇 월인지를 숫자로 출력하시오.
as.numeric(format(as.Date("2022-01-01") + 150, "%m"))

# 정답 3: v1의 값들 중 홀수번째 인덱스 값을 가진 원소의 평균을 계산하시오.
mean(v1[seq(1, length(v1), 2)])

# 정답 4: "apple", "banana", "cherry"를 갖는 fruit 열과 그 단어들의 길이를 갖는 len 열을 가진 데이터 프레임 df2을 생성하시오.
df2 <- data.frame(fruit = c("apple", "banana", "cherry"), len = nchar(c("apple", "banana", "cherry")))

# 정답 5: names에서 "n" 문자가 들어간 단어를 모두 대문자로 변환하시오.
sapply(names, function(x) ifelse(grepl("n", x), toupper(x), x))

# 정답 6: df3의 'item' 열을 정렬된 순서의 팩터로 변환하고, 그 팩터의 레벨을 출력하시오.
levels(factor(df3$item, levels = sort(unique(df3$item))))

# 정답 7: df4에서 score가 80 이상인 학생들의 score의 합을 계산하시오.
sum(df4$score[df4$score >= 80])

# 정답 8: df5의 'x'열의 각 원소에서 v2의 원소들을 뺀 후, 그 결과의 합을 계산하시오.
sum(sapply(df5$x, function(x) x - v2))

# 정답 9: df6의 열 이름 'A'를 'Z'로 변경하시오.
colnames(df6)[colnames(df6) == "A"] <- "Z"

# 정답 10: df7에서 'name' 열이 "Bob"인 행의 'age'를 35로 변경하시오.
df7$age[df7$name == "Bob"] <- 35
