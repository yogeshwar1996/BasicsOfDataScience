library(dslabs)
library(tidyverse)
library(dplyr)
library(knitr)
data(gapminder)

# add dollars per day variable and define past year
gapminder <- gapminder %>%
  mutate(dollars_per_day = gdp/population/365)

past_year <- 1970
present_year <- 2010
# define countries that have data available in both years
country_list_1 <- gapminder %>%
  filter(year == past_year & !is.na(dollars_per_day)) %>% .$country #countries in past year
country_list_2 <- gapminder %>%
  filter(year == present_year & !is.na(dollars_per_day)) %>% .$country # countries in present year
country_list <- intersect(country_list_1, country_list_2) #countries in past as well as present year

# define Western countries
west <- c("Western Europe", "Northern Europe", "Southern Europe", "Northern America", "Australia and New Zealand")

# smooth density plots - area under each curve adds to 1
gapminder %>%
  filter(year == past_year & country %in% country_list) %>%
  mutate(economy_group = ifelse(region %in% west, "West", "Developing")) %>%
  group_by(economy_group) %>%
  summarize(no_of_countries=n()) %>% # n() gives number of observations in a group
  kable()# kable generates

# smooth density plots - accessing computed variable count on y-axis by surrounding it with ..
p <- gapminder %>%
  filter(year == past_year & country %in% country_list) %>%
  mutate(economy_group = ifelse(region %in% west, "West", "Developing")) %>%
  ggplot(aes(dollars_per_day, y = ..count.., fill = economy_group)) + # set plot orientation to y and use computed variable count
  scale_x_continuous(trans = "log2")

# #without smoothing
p + geom_density(alpha = 0.2) + #alpha determines opaqueness
  facet_grid(year ~ .)

#without smoothing
p + geom_density(alpha = 0.2, bw = 0.75) + 
  facet_grid(year ~ .)
  #bw determines smoothness - Note smoothing is done to the extendend that data is representative of actual distribution
  
# Add new region groups with case_when
# add group as a factor, grouping regions
gapminder <- gapminder %>%
  mutate(region_group = case_when(
    .$region %in% west ~ "West",
    .$region %in% c("Eastern Asia", "South-Eastern Asia") ~ "East Asia",
    .$region %in% c("Caribbean", "Central America", "South America") ~ "Latin America",
    .$continent == "Africa" & .$region != "Northern Africa" ~ "Sub-Saharan Africa",
    TRUE ~ "Others"))

# reorder factor levels
gapminder <- gapminder %>%
  mutate(group = factor(region_group, levels = c("Others", "Latin America", "East Asia", "Sub-Saharan Africa", "West")))
# note you must redefine p with the new gapminder object 
p <- gapminder %>%
  filter(year %in% c(past_year, present_year) & country %in% country_list) %>%
  ggplot(aes(dollars_per_day, fill = region_group)) +
  scale_x_continuous(trans = "log2")

# stacked density plot
p + geom_density(alpha = 0.2, bw = 0.75, position = "stack") +
  facet_grid(year ~ .)

# weighted stacked density plot
gapminder %>%
  filter(year %in% c(past_year, present_year) & country %in% country_list) %>%
  mutate(weight = population/sum(population*2)) %>%
  ggplot(aes(dollars_per_day, fill = region_group, weight = weight)) +
  scale_x_continuous(trans = "log2") +
  geom_density(alpha = 0.2, bw = 0.75, position = "stack") + 
  facet_grid(year ~ .)
