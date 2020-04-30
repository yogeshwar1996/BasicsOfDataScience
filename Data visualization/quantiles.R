library(dslabs)
data(heights)

#Quartiles divide a dataset into 4 parts each with 25% probability.
#They are equal to the 25th, 50th and 75th percentiles.
#The 25th percentile is also known as the 1st quartile, 
#the 50th percentile is also known as the median, and 
#the 75th percentile is also known as the 3rd quartile.
#The summary() function returns the minimum, quartiles and maximum of a vector.
summary(heights$height)

#Percentiles are the quantiles that divide a dataset into 100 intervals each with 1% probability. You can determine all percentiles of a dataset data like this:
#percentiles of height
p <- seq(0.01, 0.99, 0.01)
percentiles <- quantile(heights$height, p)
# Note that quantile() returns a named vector. You can access the 25th and 75th percentiles
percentiles[names(percentiles) == "25%"]
percentiles[names(percentiles) == "75%"]

