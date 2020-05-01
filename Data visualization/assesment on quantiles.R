# Create two five row vectors showing the 10th, 30th, 50th, 70th, and 90th percentiles for the heights of each sex called these vectors female_percentiles and male_percentiles.
# Then create a data frame called df with these two vectors as columns. The column names should be female and male and should appear in that order.
library(dslabs)
data(heights)
male <- heights$height[heights$sex=="Male"]
female <- heights$height[heights$sex=="Female"]
male_percentiles = quantile(male, c(0.1,0.3,0.5,0.7,0.9))
female_percentiles = quantile(female, c(0.1,0.3,0.5,0.7,0.9))
df = data.frame(female=female_percentiles, male=male_percentiles)