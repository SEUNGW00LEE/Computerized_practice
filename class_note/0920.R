gender <- c("Male", "Female", "Female")
gender_f <- factor(gender)
gender
gender_f

as.numeric(gender)
as.numeric(gender_f)
as.numeric(gender_f) + 1

typeof(gender_f) #factor는 보이기엔, female male로 보이지만 female=1, male=0으로 할당되어있다.
                 # (따라서 as.numeric을 통해 숫자화가 가능하다)
class(gender_f)
gender_f

summary(gender)

income <- c("Low", "Medium", "High", "Medium")
factor(income)


x <- c(88,80,90,93,95,94,100,78,65)
cat.x <- cut(x, breaks = c(0,80,90,100), include.lowest=TRUE,
             right=FALSE, labels = c("C","B","A"))
cat.x

x <- as.Date(c("2017-01-01", "2018-01-01"))
x
typeof(x)
str(x)
x[2] - x[1]

s1 <- as.Date("2018-03-01") #꼭 as.Date를 통해 data 형태를 바꿔줘야함
e1 <- as.Date("2018-03-31")

seq(from=s1, to=e1, by=7)
seq(from=s1, to=e1, by="week")
seq(from=s1, to=e1, by="month")

seq(from=s1, by="month", length=5)
seq(from=s1, by="week", length=5)
seq(from=s1, by=5, length=5)

#2-3 다음의 문자형 데이터를 벡터 grade에 입력하라

grade <- c("1st", "1st", "2nd", "3rd", "2nd", "3rd", "1st")
#1
factor(grade)
#2
factor(grade, order=TRUE, levels = c("3rd", "2nd", "1st"))

#2-12 다음의 데이터를 벡터 score에 할당하라
score <- c(85, 91, 75, 69, 52, 95, 88, 100)
cat.score <- cut(score, breaks=c(0,60,70,80,90,100), include.lowest = TRUE,
                 right=FALSE, labels = c("F", "D", "C", "B", "A"))
