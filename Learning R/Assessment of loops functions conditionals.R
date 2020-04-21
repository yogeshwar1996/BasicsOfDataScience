#Use the ifelse function to write one line of code that assigns to the object new_names 
#the state abbreviation when the state name is longer than 8 characters and assigns
#the state name when the name is not longer than 8 characters.
new_names = ifelse(nchar(murders$state)>8, murders$abb, murders$state)


#Create a function sum_n that for any given value, say n, creates the vector 1:n, and then computes the sum of the integers from 1 to n.
# Use the function you just defined to determine the sum of integers from 1 to 5,000.
# Create function called `sum_n`
sum_n = function(n){
  v = 1:n
  sum(v)
}
# Use the function to determine the sum of integers from 1 to 5000
sum_n(5000)

#Write a function compute_s_n that for any given n computes the sum Sn=1^2+2^2+3^2+⋯+n^2.
#Report the value of the sum when n=10.
compute_s_n = function(n){
  x = 1:n
  sum(x^2)
}
# Report the value of the sum when n=10
compute_s_n(10)

#Compute the the sum when n is equal to each integer from 1 to 25 using the function we defined in the previous exercise: compute_s_n
# Create a vector for storing results
s_n <- vector("numeric", 25)
# write a for-loop to store the results in s_n
for(i in 1:25){
  s_n[i] = compute_s_n(i)
}