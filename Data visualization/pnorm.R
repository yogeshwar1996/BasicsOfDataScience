library(tidyverse)
library(dslabs)
data(heights)
#Get male heights
x <- heights %>% filter(sex=="Male") %>% pull(height)
#We can estimate the probability that a male is taller than 70.5 inches with:
prob_height_less_than_70.5 = 1 - pnorm(70.5, mean(x), sd(x))
