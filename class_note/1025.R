library(tidyverse)
mtcars_t <- as_tibble(mtcars) #mtcars:32대 차량, 11개 변수 
mtcars_t %>% filter(mpg >= 30)

mtcars_t %>% filter(mpg <= 30, cyl %in% c(6,8), am == 1)

airquality
