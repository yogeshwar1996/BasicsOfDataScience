# The probability of a single value is not defined for a continuous distribution.
# The quantity with the most similar interpretation to the probability of a single value is the probability density function f(x)
# The probability density f(x) is defined such that the integral of f(x) over a range gives the CDF of that range.
# F(a)=Pr(X≤a)=∫f(x)dx where x varies -inf to a
# In R, the probability density function for the normal distribution is given by dnorm()

x <- seq(-4, 4, length = 100) # creates seq -4 upto 4 so that 100 no. are genrated with common diff (to - from)/(length - 1)
library(dplyr)
library(ggplot2)
library(tidyverse)
library(dslabs)
library(dplyr)
data.frame(x, f = dnorm(x)) %>%
  ggplot(aes(x, f)) +
  geom_line()

# Note that dnorm() gives densities for the standard normal distribution by default.
# Probabilities for alternative normal distributions
# with mean mu and standard deviation sigma can be evaluated with:
# dnorm(z, mu, sigma)


# rnorm(n, avg, s) generates n random numbers from the normal distribution
# with average avg and standard deviation s.
# By generating random numbers from the normal distribution,
# we can simulate height data with similar properties to our dataset. Here we generate simulated height data using the normal distribution.
data(heights)
x <- heights %>% filter(sex=="Male") %>% pull(height)
n <- length(x)
avg <- mean(x)
s <- sd(x)
simulated_heights <- rnorm(n, avg, s)
# plot distribution of simulated_heights
data.frame(simulated_heights = simulated_heights) %>%
  ggplot(aes(simulated_heights)) +
  geom_histogram(color="black", binwidth = 2)

# Monte Carlo simulation of tallest person over 7 feet
B <- 10000
tallest <- replicate(B, {
  simulated_data <- rnorm(800, avg, s)    # generate 800 normally distributed random heights
  max(simulated_data)    # determine the tallest height
})
mean(tallest >= 7*12)    # proportion of times that tallest person exceeded 7 feet (84 inches)
