# MEAN
beads <- rep(c("red", "blue"), times = c(2,3))
beads

# To find the probability of drawing a blue bead at random, you can use mean():
# note: In R, applying the mean() function to a logical vector returns the proportion of elements that are TRUE. 
mean(beads == "blue")

# DISCRETE PROBABILITIES
# subset of probability that apply to categorical data is called discrete probability

# One ball will be drawn at random from a box containing: 3 cyan balls, 5 magenta balls, and 7 yellow balls.
# What is the probability that the ball will be cyan?

cyan <- 3
magenta <- 5
yellow <- 7

# Assign a variable `p` as the probability of choosing a cyan ball from the box
p = 3/15

# What is the probability that the ball you draw from the box will NOT be cyan?
1-p

# Instead of taking just one draw, consider taking two draws.
# You take the second draw without returning the first draw to the box. 
# We call this sampling without replacement.
# What is the probability that the first draw is cyan and that the second draw is not cyan?


# The variable `p_1` is the probability of choosing a cyan ball from the box on the first draw.
p_1 <- cyan / (cyan + magenta + yellow)

# Assign a variable `p_2` as the probability of not choosing a cyan ball on the second draw without replacement.
p_2 = (magenta + yellow)/ (cyan-1 +magenta+yellow)

p_1* p_2

# Now repeat the experiment, but this time, after taking the first draw 
# and recording the color, return it back to the box and shake the box. 
# We call this sampling with replacement.

# What is the probability that the first draw is cyan and that the second draw is not cyan?

# The variable 'p_1' is the probability of choosing a cyan ball from the box on the first draw.
p_1 <- cyan / (cyan + magenta + yellow)

# Assign a variable 'p_2' as the probability of not choosing a cyan ball on the second draw with replacement.
p_2 = (magenta + yellow)/ (cyan + magenta + yellow)

p_1 * p_2


# Conditional probabilities compute the probability that an event occurs given information about dependent events. 
# For example, the probability of drawing a second king given that the first draw is a king is:

# Pr(Card 2 is a king∣Card 1 is a king)=3/51

# If two events A and B are independent, Pr(A∣B)=Pr(A).
# To determine the probability of multiple events occurring, we use the multiplication rule

# The multiplication rule for independent events is:
  
  # Pr(A and B and C)=Pr(A)×Pr(B)×Pr(C)



# The multiplication rule for dependent events considers the conditional probability of both events occurring:
  
  # Pr(A and B)=Pr(A)×Pr(B∣A)

# We can expand the multiplication rule for dependent events to more than 2 events:
  
# Pr(A and B and C)=Pr(A)×Pr(B∣A)×Pr(C∣A and B)

  
  