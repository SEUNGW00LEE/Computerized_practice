19-1

f1=function(x,y){
  #명령문을 입력하시오:앞[1]/뒤[마지막1] 앞[2] / 뒤마지막[2]
  k = length(x)
  res = vector("double",k)
  for (i in 1:k){
    res[i] = x[i] / y[k-i+1]
  }
  sum(res)
}
x=c(2,5,7,1,6,3); y=c(3,1,5,6,6,2)
f1(x,y)

19-2
#rhc = hwy/cty rtc평균구하기
mpg %>% 
  filter(drv %in% c('4','f')) %>% 
  mutate(rhc=hwy/cty) %>%
  group_by(drv) %>% 
  summarise(drvmean = mean(rhc))
  
#   drv drvmean
# 1 4.    1.34
# 2 f     1.42
  
19-3
x=seq(0.5,1, 0.01)
y=(100*(x-0.6)*(x-0.7)*(x-0.9))/((x-0.1)*(exp(x)+sqrt(x)))
ggplot(size=10)+
  geom_point(mapping=aes(x=x,y=y), shape=1,size=3) +
  geom_point(mapping=aes(x=x,y=-y),size=3)

  # 명령문

19-4
(1)
f2=function(x,y){
  #명령문 : y가 0이면 x/1, y가 0이 아니면 x/y
  k = length(x)
  res = vector("double",k)
  for(i in (1:k)){
    res[i]=ifelse(y[i] != 0,x[i]/y[i],x[i]/1)}
  return(sum(res))
}

(2) 이렇게풀어야겠다

f2=function(x,y){
  #명령문 : y가 0이면 x/1, y가 0이 아니면 x/y
  r=ifelse(y!=0, x/y, x/1)
  return(sum(r))
}

x=c(1,2,3);y=c(3,2,1);z=c(2,0,1);
f2(x,y);f2(x,z);
# [1]4.33333
# [2]5.5

19-5
f3 = function(x,k){
  hap=0;i=1
  while(hap < k){
    hap = hap + x[i]
    i = i + 1
  }
  #명령문 : k가 되기전까지 x를 더하고, k를 넘는 값이 몇인지(hap), k를 넘지않는 i(minr)를 while을 통해 구해라
  return(list(hap=hap,minr=i-1))
}

x=c(2,5,3,7,4,2,1)
f3(x,11)
f3(x,8)
f3(x,7)
# $hap
# [1] 17
# $minr
# [1] 4
# 
# f3(x,8)
# $hap
# [1] 10
# $minr
# [1] 3

18-3
# airquality의 월별 온도 range를 구해라 (명령문 한줄)
airquality %>% View()
with(airquality, tapply(Temp, Month, function(x) max(x) - min(x)))

# 5 6 7  8 9
# 25 28 19 25 30

17-1
f1<-function(x,y){
  #명령문 : x가 y보다 크면 Win, x=y면 Draw, x<y : Lose 출력
  th="Draw"
  if (x>y){
    th = "Win"
  } else if (x<y){th ="Lose"} 
   return(th)
} 

2017-1
f1 <- function(x,y){
  if(x>y){
    return("Win")
  } else if (x<y){
    return("Lose")
  }
  else{
    return("Draw")
  }
}



x=3;y=2;w=2;
f1(x,y);f1(y,x);f1(y,w)
# [1] "Win"
# [1] "Lose"
# [1] "Draw"

17-3

fsp=function(x){
  #명령문 : 인접한 두 성분의 곱을 모두 더한 합을 구하는 함수 작성
  sum.x = 0
  for (i in 1:(length(x)-1)){
    sum.x = sum.x + x[i]*x[i+1]
  }
  return(sum.x)
}

x=c(5,3,1,3,7,5);fsp(x)
# [1]77

17-5

#CO2의 전체 평균과 Type별 평균의 차이를 출력

# Quebec Mississippi
# -6.329762 6.329762

with(CO2, tapply(uptake,Type,function(x) mean(CO2$uptake) - mean(x)))

14-1
f1 = function(x,y){
  k= ifelse(x>y,x,y)
  sum(k)
}

x=c(2,5,7,1,6,3); y=c(3,1,5,6,6,2)
f1(x,y)
30

14-4

library(MASS)
Cars93 %>% group_by(Type) %>% summarise(count = n()) %>% summarise(mean = mean(count))
Cars93$Type %>% group_by(Type) %>% summarise(n=n())
Cars93$Type %>% as.numeric() %>% summarise(count=n())
meanfq=function(x){
  #명령문한줄 : 행의 개수 평균 (ex: Compact:16 Large8 --> 12) 출력
  mean(as.numeric(x))
}
meanfq(Cars93$Type)
# [1] 15.5
