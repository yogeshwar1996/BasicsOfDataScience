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
  




















