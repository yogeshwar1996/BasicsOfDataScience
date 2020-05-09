library(dslabs)
library(tidyverse)
library(dplyr)
data(gapminder)

# add dollars per day variable and define past year
gapminder <- gapminder %>%
  mutate(dollars_per_day = gdp/population/365)
past_year <- 1970

# define Western countries
west <- c("Western Europe", "Northern Europe", "Southern Europe", "Northern America", "Australia and New Zealand")

# facet by West vs devloping
gapminder %>%
  filter(year == past_year & !is.na(gdp)) %>%
  mutate(economy_group = ifelse(region %in% west, "West", "Developing")) %>%
  ggplot(aes(dollars_per_day)) + #choose the variable whose values will be used in the plot
  geom_histogram(binwidth = 1, color = "black") + # create a histogram
  scale_x_continuous(trans = "log2") + #scale x axis using log2 transformation
  facet_grid(. ~ economy_group) # create multiple plots in grid with economic groups in columns

# facet by West/developing and year
present_year <- 2010
gapminder %>%
  filter(year %in% c(past_year, present_year) & !is.na(gdp)) %>%
  mutate(economy_group = ifelse(region %in% west, "West", "Developing")) %>%
  ggplot(aes(dollars_per_day)) +
  geom_histogram(binwidth = 1, color = "black") +
  scale_x_continuous(trans = "log2") +
  facet_grid(year ~ economy_group) # create multiple plots in grid with year in the rows and economic groups in columns

# define countries that have data available in both years
country_list_1 <- gapminder %>%
  filter(year == past_year & !is.na(dollars_per_day)) %>% .$country #countries in past year
country_list_2 <- gapminder %>%
  filter(year == present_year & !is.na(dollars_per_day)) %>% .$country # countries in present year
country_list <- intersect(country_list_1, country_list_2) #countries in past as well as present year

# make histogram including only countries with data available in both years
gapminder %>%
  filter(year %in% c(past_year, present_year) & country %in% country_list & !is.na(gdp)) %>%    # keep only selected countries
  mutate(economy_group = ifelse(region %in% west, "West", "Developing")) %>%
  ggplot(aes(dollars_per_day)) +
  geom_histogram(binwidth = 1, color = "black") +
  scale_x_continuous(trans = "log2") +
  facet_grid(year ~ economy_group)


p <- gapminder %>%
  filter(year %in% c(past_year, present_year) & country %in% country_list  & !is.na(gdp)) %>%
  mutate(region = reorder(region, dollars_per_day, FUN = median)) %>%
  mutate(economy_group = ifelse(region %in% west, "West", "Developing")) %>%
  ggplot() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  xlab("") + scale_y_continuous(trans = "log2")

p + geom_boxplot(aes(economy_group, dollars_per_day, fill = factor(year))) +
  facet_grid(year ~ .)# year in the row of grid

# Boxplots of income  1970 and 2010 ecomomy group wise
# arrange matching boxplots next to each other, colored by year
p + geom_boxplot(aes(economy_group, dollars_per_day, fill = factor(year)))# cast year in int to factor to be used as fill property in boxplot aesthetics
