# For the three year period 2016-2018, ACT standardized test scores were 
# approximately normally distributed with a mean of 20.9 and standard deviation of 5.7 
# (Real ACT scores are integers between 1 and 36, but we will ignore this detail and use continuous values instead.)
# Set the seed to 16, then use rnorm() to generate a normal distribution of 10000 tests 
set.seed(16)
act_scores = rnorm(10000, 20.9,5.7)
# What is the mean of act_scores?
avg_act_scores = mean(act_scores)
# What is the standard deviation of act_scores?
sd_act_scores = sd(act_scores)
# A perfect score is 36 or greater (the maximum reported score is 36).
# In act_scores, how many perfect scores are there out of 10,000 simulated tests?
sum(act_scores>=36)
# In act_scores, what is the probability of an ACT score greater than 30?
1-pnorm(30,avg_act_scores, sd_act_scores )
# In act_scores, what is the probability of an ACT score less than or equal to 10?
pnorm(10,avg_act_scores, sd_act_scores )


# Set x equal to the sequence of integers 1 to 36.
# Use dnorm to determine the value of the probability density function over x 
# given a mean of 20.9 and standard deviation of 5.7
# save the result as f_x. 
# Plot x against f_x.
x = seq(1,36)
f_x = dnorm(x, 20.9, 5.7)
plot(x,f_x, type='l')


# Convert act_scores to Z-scores
Zscores  = (act_scores - avg_act_scores)/sd_act_scores
# Zscores == scale(act_scores)
hist(Zscores)

# What is the probability of a Z-score greater than 2 (2 standard deviations above the mean)?
1-pnorm(2)

# What ACT score value corresponds to 2 standard deviations above the mean (Z = 2)?
act_scores_at_Z_equals_2 = 2 * sd_act_scores + avg_act_scores

# A Z-score of 2 corresponds roughly to the 97.5th percentile.
# Use qnorm() to determine the 97.5th percentile of normally distributed data with 
# the mean and standard deviation observed in act_scores.
# What is the 97.5th percentile of act_scores?
qnorm(0.975, avg_act_scores, sd_act_scores)

# Write a function that takes a value and produces the probability of an ACT score less than or equal to 
# that value (the CDF). Apply this function to the range 1 to 36.

sequence_= seq(1,36)
cdf = function(x){
  mean(act_scores<=x)
  }
prb = sapply(sequence_, cdf)

# What is the minimum integer score (1 to 36) such that the probability of that score or lower is at least .95?
sequence_[prb>=0.95]

# Use qnorm() to determine the expected 95th percentile, 
# the value for which the probability of receiving that score or lower is 0.95, 
# given a mean score of 20.9 and standard deviation of 5.7.

qnorm(0.95, 20.9,5.7)
# Make a vector containing the quantiles for p <- seq(0.01, 0.99, 0.01), the 1st through 99th percentiles of the act_scores data. Save these as sample_quantiles.
p <- seq(0.01, 0.99, 0.01)
sample_quantiles = quantile(act_scores,p)

# Make a corresponding set of theoretical quantiles using qnorm() 
# over the interval p <- seq(0.01, 0.99, 0.01) with mean 20.9 and 
# standard deviation 5.7. Save these as theoretical_quantiles
theoretical_quantiles = qnorm(p, 20.9,5.7)

qqplot(theoretical_quantiles, sample_quantiles)
