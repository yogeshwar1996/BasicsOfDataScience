# any list of numbers, let's call it x1 through xn, has a distribution.
# Here define F(a) as a function that answers the question, what proportion of the list is less than or equal to a. 
# When distribution is approximately normal, we summarise using average and standard deviation

# For a randome variable X, we have distribution function, to define this we do not need a list of numbers
# In this case, to define the distribution,we define capital F of a as a function that answers the question,
# what is the probability that x is less than or equal to a.

# However, if x is defined by drawing from an urn with numbers in it,
# then there is a list, the list of numbers inside the urn.
# In this case, the distribution of that list
# is the probability distribution of x and the average and standard deviation
# of that list are the expected value and standard errors of the random variable.

# Another way to think about it that does not involve an urn
# is to run a Monte Carlo simulation and generate
# a very large list of outcomes of x.
# These outcomes are a list of numbers.
# The distribution of this list will be a very good approximation
# of the probability distribution of x.
# The longer the list, the better the approximation.
# The average and standard deviation of this list
# will approximate the expected value and standard error of the random variable.



#   A random variable X has a probability distribution function F(a) that defines Pr(X≤a) over all values of a.
# Any list of numbers has a distribution. The probability distribution function of a random variable is defined mathematically and does not depend on a list of numbers.
# The results of a Monte Carlo simulation with a large enough number of observations will approximate the probability distribution of X.
# If a random variable is defined as draws from an urn:
#   The probability distribution function of the random variable is defined as the distribution of the list of values in the urn.
# The expected value of the random variable is the average of values in the urn.
# The standard error of one draw of the random variable is the standard deviation of the values of the urn.
