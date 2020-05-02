library(tidyverse)
# intitialize the data component
# Method1 
ggplot(data=murders)
# Method 2
murders %>% ggplot()
# assing plot object to a variable
p = ggplot(data=murders)
# Simply printing the variable will render the plot