#Assignment - Use filter to show the top 5 states with the highest murder rates. After we add murder rate and rank, do not change the murders dataset, just show the result. Note that you can filter based on the rank column.
# Add the necessary columns
library(dslabs)
data("murders")
library(dplyr)
murders <- mutate(murders, rate = total/population * 100000, rank = rank(-rate))

# Filter to show the top 5 states with the highest murder rates
filter(murders, rank<=5)

#Assignment - Create a new data frame called no_south that removes states from the South region.
no_south <- filter(murders, region != "South")
#How many states are in this category? You can use the function nrow for this.
nrow(no_south)

#We can also use the %in% to filter with dplyr. For example you can see the data from New York and Texas like this:
filter(murders, state %in% c("New York", "Texas"))

# Create a new data frame called murders_nw with only the states from the northeast and the west
murders_nw = filter(murders, region %in% c("Northeast", "West"))
data.frame(murders_nw)
# Number of states (rows) in this category 
nrow(murders_nw)

#filtering by two conditions - Suppose you want to live in the Northeast or West and want the murder rate to be less than 1.
#We want to see the data for the states satisfying these options. Note that you can use logical operators with filter:
# add the rate column
murders <- mutate(murders, rate =  total / population * 100000, rank = rank(-rate))

# Create a table, call it my_states, that satisfies both the conditions 
my_states = filter(murders, region %in% c("Northeast", "West") & rate < 1)
# Use select to show only the state name, the murder rate and the rank
select(my_states, state, rate, rank)

#another way of doing this using pipe operator %>%
## Define the rate column
murders <- mutate(murders, rate =  total / population * 100000, rank = rank(-rate))

# show the result and only include the state, rate, and rank columns, all in one line
murders %>% filter(region %in% c("Northeast", "West") & rate < 1) %>% select(state,rate,rank)

#Load the murders data frame again
data(murders)
# Create new data frame called my_states using pipe operators and conditions as above
my_states <- murders %>% mutate(rate=(total/population)* (10^5), rank=rank(-rate)) %>% filter(region %in% c("Northeast","West") & rate < 1) %>% select(state, rate, rank)














