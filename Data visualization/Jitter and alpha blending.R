library(dslabs)
library(ggplot2)
library(dplyr)
data(heights)
# dot plot showing the data
heights %>% ggplot(aes(sex, height)) + geom_point()
# Note there are lot of point that overlap and viewer cannnot see that there more than 200 pts for female and more than 
# 700 pts for males
# To improve this we add jitter in so that points get horizontalluy spaced which will help know how much similar values exists
# And adding alpha blending will show points as transparent and dark based on how crowded they are
# jittered, alpha blended point plot
heights %>% ggplot(aes(sex, height)) + geom_jitter(width = 0.1, alpha = 0.2)
