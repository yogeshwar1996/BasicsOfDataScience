#normal distribution and z score
# define x as vector of male heights
library(tidyverse)
library(dslabs)
data(heights)
index <- heights$sex=="Male"
x <- heights$height[index]

# calculate the mean and standard deviation manually
average <- sum(x)/length(x)
SD <- sqrt(sum((x - average)^2)/length(x))

# built-in mean and sd functions - note that the audio and printed values disagree
average <- mean(x)
SD <- sd(x)
c(average = average, SD = SD)

# calculate standard units
#Standard units describe how many standard deviations a value is away from the mean
z = (x - mean(x))/sd(x)
z <- scale(x)


# calculate proportion of values within 2 SD of mean
mean(abs(z) < 2)