# Assign a variable `p_green` as the probability of the ball landing in a green pocket
p_green <- 2 / 38

# Assign a variable `p_not_green` as the probability of the ball not landing in a green pocket
p_not_green <- 1-p_green

# Define the number of bets using the variable 'n'
n <- 100

# Calculate 'avg', the expected outcome of 100 spins if you win $17 when the ball lands on green and you lose $1 when the ball doesn't land on green
avg <- n * (17*p_green + -1*p_not_green)

# Compute 'se', the standard error of the sum of 100 outcomes
se <- sqrt(n) * (17 - -1)*sqrt(p_green*p_not_green)

# Using the expected value 'avg' and standard error 'se', compute the probability that you win money betting on green 100 times.
# To calculate probability of winning money, first use pnorm to calculate the probability of earning less than $0 given a certain expected value and standard error.
1- pnorm(0, avg, se)

# Create a Monte Carlo simulation that generates 10,000 outcomes of S, the sum of 100 bets.
# Compute the average and standard deviation of the resulting list and compare them to the expected value (-5.263158) and standard error (40.19344) for S that you calculated previously.

# The variable `B` specifies the number of times we want the simulation to run. Let's run the Monte Carlo simulation 10,000 times.
B <- 10000

# Use the `set.seed` function to make sure your answer matches the expected result after random sampling.
set.seed(1)

# Create an object called `S` that replicates the sample code for `B` iterations and sums the outcomes.

roulette_winnings <- function(n){
  X <- sample(c(17,-1), n, replace=TRUE, prob=c(p_green, p_not_green))
  sum(X)
}
S <- replicate(B, roulette_winnings(n))


# Compute the average value for 'S'
mean(S)

# Calculate the standard deviation of 'S
sd(S)
#  calculate the probability of winning money from the Monte Carlo simulation
# Calculate the proportion of outcomes in the vector `S` that exceed $0
mean(S>0)

# Run a single Monte Carlo simulation of 10,000 bets using the following steps. (You do not need to replicate the sample code.)
X = sample(c(17,-1), n, replace=TRUE, prob=(c(p_green,p_not_green)))

# Calculate the average result per bet placed using the mean function.
Y = mean(X)

# Exercise 7
# CLT
# Calculate the expected outcome of `Y`, the mean outcome per bet in 10,000 bets
avg = (17*p_green) + (-1)*p_not_green

# Compute the standard error of 'Y', the mean outcome per bet from 10,000 bets.
se = abs(17-(-1))* sqrt(p_green*p_not_green)/sqrt(n)


# Exercise 8 
# What is the probability that your winnings are positive after betting on green 10,000 times?
# Given this average and standard error, determine the probability of winning more than $0. Print the result to the console.
1-pnorm(0, avg, se)

# Exercise 9 Monte carlo
# Create a Monte Carlo simulation that generates 10,000 outcomes of S, the average outcome from 10,000 bets on green.
# Compute the average and standard deviation of the resulting list to confirm the results from previous exercises using the Central Limit Theorem.


# The variable `n` specifies the number of independent bets on green
n <- 10000

# The variable `B` specifies the number of times we want the simulation to run
B <- 10000

# Use the `set.seed` function to make sure your answer matches the expected result after random number generation
set.seed(1)

# Generate a vector `S` that contains the the average outcomes of 10,000 bets modeled 10,000 times

roulette_ = function(n){
  X = sample(c(17,-1), n, replace=TRUE, prob=c(p_green, p_not_green))
  mean(X)
}

S = replicate(B, roulette_(10000))

# Compute the average of `S`
mean(S)

# Compute the standard deviation of `S`
sd(S)

# Calculate the probability of winning more than $0 in the Monte Carlo simulation from the previous exercise using the mean function.
# Compute the proportion of outcomes in the vector 'S' where you won more than $0
mean(S>0)
