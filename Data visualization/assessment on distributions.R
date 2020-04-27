#What proportion of the data is between 69 and 72 inches (taller than 69 but shorter or equal to 72)? A proportion is between 0 and 1.
#Use the mean function in your code. Remember that you can use mean to compute the proportion of entries of a logical vector that are TRUE.
library(dslabs)
data(heights)
x <- heights$height[heights$sex == "Male"]
mean(x <= 72) - mean(x <=69)

#Use the normal approximation to estimate the proportion the proportion of the data that is between 69 and 72 inches.
pnorm(72, avg, stdev) - pnorm(69, avg, stdev)

#Use normal approximation to estimate the proportion of heights between 79 and 81 inches and save it in an object called approx.
#Report how many times bigger the actual proportion is compared to the approximation.
exact <- mean(x > 79 & x <= 81)
approx = pnorm(81,mean(x), sd(x)) - pnorm(79,mean(x), sd(x))
exact/approx

#Assume that the distribution of adult men in the world as normally distributed with an average of 69 inches and a standard deviation of 3 inches.
#Using the normal approximation, estimate the proportion of adult men that are taller than 7 feet, referred to as seven footers. Remember that 1 foot equals 12 inches.
#We know that there are about 1 billion men between the ages of 18 and 40 in the world, the age range for the NBA.
#use the normal distribution to estimate how many of these 1 billion men are at least seven feet tall?
p = 1 - pnorm(7*12, 69, 3)
N = round(p*(10^9))
#There are about 10 National Basketball Association (NBA) players that are 7 feet tall or higher.
10/N