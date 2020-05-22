# Two teams, say the Cavs and the Warriors, are playing a seven game championship series. The first to win four games wins the series. The teams are equally good, so they each have a 50-50 chance of winning each game.
# If the Cavs lose the first game, what is the probability that they win the series?
# Assign a variable 'n' as the number of remaining games.
n = 6

# Assign a variable `outcomes` as a vector of possible game outcomes, where 0 indicates a loss and 1 indicates a win for the Cavs.
outcomes = c(loss=0, win=1)

# Assign a variable `l` to a list of all possible outcomes in all remaining games. Use the `rep` function on `list(outcomes)` to create list of length `n`.
l = rep(list(outcomes), n)


# Create a data frame named 'possibilities' that contains all combinations of possible outcomes for the remaining games.
possibilities = expand.grid(l)

# Create a vector named 'results' that indicates whether each row in the data frame 'possibilities' contains enough wins for the Cavs to win the series.
results = rowSums(possibilities)>=4
# Calculate the proportion of 'results' in which the Cavs win the series. Print the outcome to the console.

mean(results)

# Monte Carlo Simulation
# The variable `B` specifies the number of times we want the simulation to run. Let's run the Monte Carlo simulation 10,000 times.
B <- 10000

# Use the `set.seed` function to make sure your answer matches the expected result after random sampling.
set.seed(1)

# Create an object called `results` that replicates for `B` iterations a simulated series and determines whether that series contains at least four wins for the Cavs.
results = replicate(B, {
  # select one out of 0,1 with replacement bcz each event is independendt
  results_of_6_games = replicate(6,sample(c(0,1), size=1,replace=TRUE))
  sum(results_of_6_games) >= 4
})

# Calculate the frequency out of `B` iterations that the Cavs won at least four games in the remainder of the series. Print your answer to the console.
mean(results)

# Two teams, A and B, are playing a seven series game series. Team A is better than team B and has a p>0.5 chance of winning each game.
# Show how the prob of B wining varies as prob of A winning keeps increasing from 0.5 to 0.95

# Let's assign the variable 'p' as the vector of probabilities that team A will win.
# starting from - 0.5 increase by 0.025 till 0.95 is reached
p <- seq(0.5, 0.95, 0.025)
# Calculate no. of items in sequence
length(seq(0.5, 0.95, 0.025))
# Given a value 'p', the probability of winning the series for the underdog team B can be computed with the following function based on a Monte Carlo simulation:
prob_win <- function(p){
  B <- 10000
  result <- replicate(B, {
    b_win <- sample(c(1,0), 7, replace = TRUE, prob = c(1-p, p))
    sum(b_win)>=4
  })
  mean(result)
}

# Apply the 'prob_win' function across the vector of probabilities that team A will win to determine the probability that team B will win. Call this object 'Pr'.

Pr = sapply(p, prob_win)

# Plot the probability 'p' on the x-axis and 'Pr' on the y-axis.
# This show how prob of B winning changes as prob of a winning goes on increasing
plot(p, Pr, xlab='Prob. A Win', ylab='Prob. B Wins')
