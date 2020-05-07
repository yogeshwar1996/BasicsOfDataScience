library(dslabs)
library(tidyverse)
library(dplyr)
data(gapminder)
# add dollars per day variable
gapminder <- gapminder %>%
  mutate(dollars_per_day = gdp/population/365)

# histogram of dollars per day
past_year <- 1970
gapminder %>%
  filter(year == past_year & !is.na(gdp)) %>%
  ggplot(aes(dollars_per_day)) +
  geom_histogram(binwidth = 1, color = "black")
# Note in the plot generated above the counts are absolute
# i.e for 32 on x axis y axis value gives count of people earning $32 per day

# repeat histogram with log2 scaled data
gapminder %>%
  filter(year == past_year & !is.na(gdp)) %>%
  ggplot(aes(log2(dollars_per_day))) +
  geom_histogram(binwidth = 1, color = "black")
# Note in histogram with data scaled with log base 2 and bin width of 1
# Each bin represents range of values x to 2x 
# So on x axis where it says 5 corsponding y value is around 17
# this does not mean that 17 people earn $32 a day
# but this means no. of people earning b/w 16 to 32 dolar is 17 


# repeat histogram with log2 scaled x-axis
# note the values on x axis points are absolute values instead in log base2
gapminder %>%
  filter(year == past_year & !is.na(gdp)) %>%
  ggplot(aes(dollars_per_day)) +
  geom_histogram(binwidth = 1, color = "black") +
  scale_x_continuous(trans = "log2")
