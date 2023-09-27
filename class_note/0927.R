A <- matrix(1:4, nrow=2, byrow = T)
B <- matrix(5:8, nrow=2, byrow = T)

A
B
A %*% B
diag(A)
diag(B)
eigen(A)

solve(A,c(5,6))
A;B;
A+B

A %*% B

colMeans(A)
colSums(A)
rowMeans(A);rowSums(A)

diag(10)
solve(A)
solve(A) %*% A

df1 <- data.frame(x=c(2,4,6), y = c("a","b","c"))
df1
str(df1)

data.frame(x=c(2,4), y=c("a","b","c")). #데이터프레임에서는 순환법칙이 적용되지않는다.
#Error in data.frame(x = c(2, 4), y = c("a", "b", "c")) : 
#  arguments imply differing number of rows: 2, 3
data.frame(x=1, y=c("a","b","c")) #길이가 1인 벡터는 순환법칙이 적용된다.

#' dataframe : colnames(), names()
#' rownames()
#' length()
colnames(df1)
names(df1)
rownames(df1)
length(df1)

#' 중요 : 데이터프레임의 인덱싱
df1
typeof(df1)
df1[1]
df1[[1]]
df1["x"]
df1[["x"]]
df1$x
df1[c(1,2),1]
df1[c(1.2,3),]
df1[1,2]
library(dplyr)
airquality %>% 
  View()

str(airquality)
z.Temp <- (airquality$Temp - mean(airquality$Temp)) / sd(airquality$Temp)
z.Temp2 <- with(airquality, (Temp - mean(Temp))/sd(Temp))
z.Temp2 %>% 
  View()
