# In the 200m dash finals in the Olympics, 8 runners compete for 3 medals (order matters).
# In the 2012 Olympics, 3 of the 8 runners were from Jamaica and 
# the other 5 were from different countries. 
# The three medals were all won by Jamaica (Usain Bolt, Yohan Blake, and Warren Weir).

# Use the information above to help you answer the following four questions.

# How many different ways can the 3 medals be distributed across 8 runners?
# Since order is important
library(gtools)
# Out of 8 select 3 and repeats not allowed and order matters
ways = permutations(8,3) 
num_of_ways_3_medals_cab_be_given_to_8 = nrow(ways)

# How many different ways can the three medals be distributed among the 3 runners from Jamaica?
ways = permutations(3,3) 
num_of_ways_jamaicans_can_distribute_medals_amongst_themselves = nrow(ways)

# What is the probability that all 3 medals are won by Jamaica?
prob_all_3_won_by_jamaican = num_of_ways_jamaicans_can_distribute_medals_amongst_themselves/num_of_ways_3_medals_cab_be_given_to_8

# Run a Monte Carlo simulation on this vector representing the countries of the 8 runners in this race:
set.seed(1)
runners <- c("Jamaica", "Jamaica", "Jamaica", "USA", "Ecuador", "Netherlands", "France", "South Africa")
B=10000
results = replicate(B, {
  winners = sample(runners,3)
  # All three winners are Jamaicans
  sum(winners ==  c("Jamaica", "Jamaica","Jamaica")) == 3
})
mean(results)
