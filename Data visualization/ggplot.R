library(tidyverse)
library(ggplot2)
library(dslabs)
data(murders)
# intitialize the data component
# Method1 
ggplot(data=murders)
# Method 2
murders %>% ggplot()
# assing plot object to a variable
p = ggplot(data=murders, aes(x=murders$region)) +
    geom_bar()
# Simply printing the variable will render the plot
p
