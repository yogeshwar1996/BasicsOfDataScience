# Arithmetic operations like + - / * can be performed element wise on vectors of same length
p = c(1,2,3,4,5)
q = c(1,2,3,4,5)
sum = p + q
# but following will give error since vectors not of same length
sum = p + c(1,2,3)
# but uf you want to calculate sum do it as follow
sum = p[1:3] + c(1,2,3)

library(dslabs)
# The name of the state with the maximum population is found by doing the following
murders$state[which.max(murders$population)]

# how to obtain the murder rate
murder_rate <- murders$total / murders$population * 100000

# ordering the states by murder rate, in decreasing order
murders$state[order(murder_rate, decreasing=TRUE)]


