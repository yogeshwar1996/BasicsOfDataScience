library(tidyverse)
library(dslabs)
library(dplyr)
# The cumulative distribution function (CDF) is a distribution function for continuous data x
# that reports the proportion of the data below a for all values of a:
# F(a)=Pr(x≤a)
# The CDF is the probability distribution function for continuous variables. 
# For example, to determine the probability that a male student is taller than 70.5 inches 
# given a vector of male heights x, we can use the CDF:
# Pr(x>70.5)=1−Pr(x≤70.5)=1−F(70.5)
# The probability that an observation is in between two values a,b is F(b)−F(a).

data(heights)
View(heights)
x <- heights %>% filter(sex=="Male") %>% pull(height)

# Given a vector x, we can define a function for computing the CDF of x using:
F <- function(a) {
  mean(x <= a)
  }
1 - F(70)    # probability of male taller than 70 inches

# pnorm(a, avg, s) gives the value of the cumulative distribution function
# F(a) for the normal distribution defined by average avg and standard deviation s.
# We say that a random quantity is normally distributed with average avg and standard deviation s
# if the approximation pnorm(a, avg, s) holds for all values of a.
# We can estimate the probability that a male is taller than 70.5 inches using:
1 - pnorm(70.5, mean(x), sd(x))


# Discretization and the normal approximation
table(x) #create a table with values in x as columns and frequency of x as the value
prop.table(table(x)) #create a table with values in x as columns and proportion of x(i.e freq/total values) as the value
# plot distribution of exact heights in data
plot(prop.table(table(x)), xlab = "a = Height in inches", ylab = "Pr(x = a)")

# probabilities in actual data over length 1, with range containing an integer
mean(x <= 68.5) - mean(x <= 67.5)
mean(x <= 69.5) - mean(x <= 68.5)
mean(x <= 70.5) - mean(x <= 69.5)

# probabilities in normal approximation match well
pnorm(68.5, mean(x), sd(x)) - pnorm(67.5, mean(x), sd(x))
pnorm(69.5, mean(x), sd(x)) - pnorm(68.5, mean(x), sd(x))
pnorm(70.5, mean(x), sd(x)) - pnorm(69.5, mean(x), sd(x))

# probabilities in actual data over range without an integer in b/w
# does not match normal distributionheights %>% filter(sex=="Male") %>% sum(height)

mean(x <= 70.9) - mean(x <= 70.1)
pnorm(70.9, mean(x), sd(x)) - pnorm(70.1, mean(x), sd(x))