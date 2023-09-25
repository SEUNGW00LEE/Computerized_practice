x <- matrix(1:12, nrow=3)
x


A <- matrix(1:9, nrow=3)

rownames(A) <- c("Case #1", "Case #2", "Case #3")
colnames(A) <- c("var1", "var2", "var3")
A
var1 = c(12,17,19)
var2 = c(21,22,25)
var3 = c(32,34,35)

B <- cbind(var1,var2,var3)
rownames(B) <- c("Case #1", "Case #2", "Case #3")
B
B[,2]
