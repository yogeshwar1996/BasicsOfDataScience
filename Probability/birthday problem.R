# Key points
# duplicated() takes a vector and returns a vector of the same length
# with TRUE for any elements that have appeared previously in that vector.
# In a group of 50 people whats the probability that at least 2 have same birthday


n <- 50
bdays <- sample(1:365, n, replace = TRUE)    # generate n random birthdays
any(duplicated(bdays))    # check if any birthdays are duplicated

# Monte Carlo simulation with B=10000 replicates
B <- 10000
results <- replicate(B, {    # returns vector of B logical values
  bdays <- sample(1:365, n, replace = TRUE)
  any(duplicated(bdays))
})
mean(results)    # calculates proportion of groups with duplicated bdays