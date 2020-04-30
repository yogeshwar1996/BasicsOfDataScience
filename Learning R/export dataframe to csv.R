# import the libraries
library(tidyverse)
library(dslabs)
#load the data
data(heights)
#get to know the structure of data 
str(heights)
# get the names of fields in the data
names(heights)
write.csv(heights,"heights.csv", row.names = FALSE)
