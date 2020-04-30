#Definition of qnorm
#The qnorm() function gives the theoretical value of a quantile
#with probability p of observing
#a value equal to or less than that quantile value 
#given a normal distribution with mean mu and standard deviation sigma:
# qnorm(p,mu,sigma)
#By default, mu=0 and sigma=1. 
#Therefore, calling qnorm() with no arguments gives quantiles for the standard normal distribution.
# Note standard normal distribution is a normal distribution with   mean=0 i.e as many positive values as negative values
#Relation to pnorm
#The pnorm() function gives the probability that a value from a standard normal distribution will be less than or equal to a z-score value z. Consider:
#  pnorm(-1.96) ≈ 0.025 
#The result of pnorm() is the quantile. Note that:
#qnorm(0.025)  ≈−1.96 
#qnorm() and pnorm() are inverse functions:
#pnorm(qnorm(0.025))  =0.025
theoretical_quantiles <- qnorm(p, 69, 3)
which(theoretical_quantiles==69)
