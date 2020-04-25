#Exact Proportion/Probability vs Cumulative Distribution Function
library(dslabs)
data(heights)
my_data = heights$height
#No. of readings of height
length(my_data)
# computes prob. for a single value
exact_probablity_function <- function(x) {  
  print('Probability of occurence of height')
  print(x)
  print('in my_data is')
  print(sum(my_data==x)/length(my_data))
  #No. of people with height x divided by total no. of people 
  #sum(my_data==x)/length(my_data)
  mean(my_data==x)
}
#instead of calling in for loop and assigning the result back into the vector that will store the results
#we use sapply to apply a function over a list/vector
exact_probablity_values <- sapply(my_data, exact_probablity_function)
#By deafult plot shows points
plot(my_data, exact_probablity_values)
# To see various options regarding plot: search 'plot' in help
# but to show line
plot(my_data, exact_probablity_values, type = 'l')
#Note the line plot is not comprehensive because data points are not orderd
#To get it neat and tidy, plot graph with heights in sorted order, along with their resp probabilities 
plot(sort(my_data), exact_probablity_values[order(my_data)], type = 'l')

#Histogram
data(heights)
my_data = heights$height
hist(my_data)

#############
#Cumulative Distribution Function
data(heights)
my_data = heights$height
length(my_data)
# define range of values that will serve as our x axis
#Note it will create 50 values min to max where each consective value is equal distance apart
a <- seq(min(my_data), max(my_data), length = 50)   

# computes prob. for a single value
cdf_function <- function(x) {  
  print('Mean of values in my_Data where value less than equal')
  print(x)
  print('is')
  print(mean(my_data <= x))
  mean(my_data<=x)
}
#instead of calling in for loop and assigning the result back into the vector that will store the results
#we use sapply to apply a function over a list/vector
cdf_values <- sapply(a, cdf_function)
#By deafult plot shows points
plot(a, cdf_values)
# Trying various options on plot 
# to show line
plot(a, cdf_values, type = 'l')
# to show points as well as line
plot(a, cdf_values, type = 'o')


