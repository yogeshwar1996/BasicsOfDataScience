# Key points Quantile-quantile plots, or QQ-plots, are used to check whether
# distributions are well-approximated by a normal distribution. Given a
# proportion p, the quantile q is the value such that the proportion of values
# in the data below q is p. In a QQ-plot, the sample quantiles in the observed
# data are compared to the theoretical quantiles expected from the normal
# distribution. If the data are well-approximated by the normal distribution,
# then the points on the QQ-plot will fall near the identity line (sample =
# theoretical). Calculate sample quantiles (observed quantiles) using the
# quantile() function. Calculate theoretical quantiles with the qnorm()
# function. qnorm() will calculate quantiles for the standard normal
# distribution (μ=0,σ=1) by default, but it can calculate quantiles for any
# normal distribution given mean() and sd() arguments. We will learn more about
# qnorm() in the probability course. Note that we will learn alternate ways to
# make QQ-plots with less code later in the series.

library(tidyverse)
library(dslabs)
data(heights)

p = seq(0.01,0.99,0.01)
#quantiles on actual values 
observed_quantiles = quantile(heights$height, p)
#quantiles on values in standard units
observed_standard_quantiles = quantile(scale(heights$height), p)

theoretical_quantiles_normal_distribution = qnorm(p, mean(heights$height), sd(heights$height))
theoretical_quantiles_standard_normal_distribution = qnorm(p, mean = 0, sd=1)


plot(observed_quantiles, theoretical_quantiles_normal_distribution)
plot(observed_standard_quantiles, theoretical_quantiles_standard_normal_distribution)


#Another code
# define x and z
library(tidyverse)
library(dslabs)
data(heights)
index <- heights$sex=="Male"
x <- heights$height[index]
z <- scale(x)

# proportion of data below 69.5
mean(x <= 69.5)

# calculate observed and theoretical quantiles
p <- seq(0.05, 0.95, 0.05)
observed_quantiles <- quantile(x, p)
theoretical_quantiles <- qnorm(p, mean = mean(x), sd = sd(x))

# make QQ-plot
plot(theoretical_quantiles, observed_quantiles)
abline(0,1)

# make QQ-plot with scaled values
observed_quantiles <- quantile(z, p)
theoretical_quantiles <- qnorm(p)
plot(theoretical_quantiles, observed_quantiles)
abline(0,1)