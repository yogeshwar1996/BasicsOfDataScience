# Random variables are numeric outcomes resulting from random processes.

# An urn with 2 red beads and 3 blue beads
beads <- rep(c("red", "blue"), times = c(2, 3))
# define random variable x to be 1 if blue, 0 otherwise
x <- ifelse(sample(beads, 1) == "blue", 1, 0)

# demonstrate that the random variable is different every time
ifelse(sample(beads, 1) == "blue", 1, 0)
ifelse(sample(beads, 1) == "blue", 1, 0)
ifelse(sample(beads, 1) == "blue", 1, o)

# A sampling model models the random behavior of a process as the sampling of draws from an urn.

# The probability distribution of a random variable is the probability of the observed value falling in any given interval.
# a CDF: F(a)= Pr(S<=a) to answer questions related to the probability of S being in any interval

# The average of many draws of a random variable is called its expected value.
# The standard deviation of many draws of a random variable is called its standard error.
# Monte Carlo simulation: Chance of casino losing money on roulette
# We build a sampling model for the random variable S
# that represents the casino's total winnings. 

# sampling model 1: define urn, then sample
# 18 black, 18 Red and 2 green
color <- rep(c("Black", "Red", "Green"), c(18, 18, 2)) 
# No of iterations
n <- 1000
# 1 means win, -1 means loss
X <- sample(ifelse(color == "Red", -1, 1), n, replace = TRUE)
# First ten results
X[1:10]

# sampling model 2: define urn inside sample function by noting probabilities
x <- sample(c(-1, 1), n, replace = TRUE, prob = c(18/38, 20/38))    # 1000 independent draws
S <- sum(x)    # total winnings = sum of draws
S

# run a Monte Carlo simulation and use the results to estimate the probability of the casino losing money.

n <- 1000    # number of roulette players
B <- 10000    # number of Monte Carlo experiments
S <- replicate(B, {
  X <- sample(c(-1,1), n, replace = TRUE, prob = c(9/19, 10/19))    # simulate 1000 spins
  sum(X)    # determine total profit
})

mean(S < 0)    # probability of the casino losing money

# We can plot a histogram of the observed values of S as well as the normal density curve based on the mean and standard deviation of S.
library(dplyr)
library(ggplot2)
s <- seq(min(S), max(S), length = 100)    # sequence of 100 values across range of S
normal_density <- data.frame(s = s, f = dnorm(s, mean(S), sd(S))) # generate normal density for S
data.frame (S = S) %>%    # make data frame of S for histogram
  ggplot(aes(S, ..density..)) + # ..desnity.. is computed variable
  geom_histogram(color = "black", binwidth = 10) +
  ylab("Probability") +
  geom_line(data = normal_density, mapping = aes(s, f), color = "blue")













