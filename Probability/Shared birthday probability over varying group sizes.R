# The function sapply(x, f) allows any other function f
# to be applied element-wise to the vector x.
# The probability of an event happening is 1 minus the probability of that event not happening:
# Pr(event)=1−Pr(no event)

# We can compute the probability of shared birthdays mathematically:
  # Pr(shared birthdays) = 1−Pr(no shared birthdays) = 1−(1×(364/365)×(363/365)×...×(365−n+1/365))

# Code: Function for birthday problem Monte Carlo simulations
compute_prob <- function(n, B = 10000) {
  same_day <- replicate(B, {
    bdays <- sample(1:365, n, replace = TRUE)
    any(duplicated(bdays))
  })
  mean(same_day)
}

n <- seq(1, 60)
sapply(n, compute_prob)

# function for computing exact probability of shared birthdays for any n
exact_prob <- function(n){
  prob_unique <- seq(365, 365-n+1)/365   # vector of fractions for mult. rule
  1 - prod(prob_unique)    # calculate prob of no shared birthdays and subtract from 1
}
