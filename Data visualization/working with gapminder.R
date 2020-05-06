
# load and inspect gapminder data
library(dslabs)
library(tidyverse)
library(dplyr)
data(gapminder)
head(gapminder)

# compare infant mortality in Sri Lanka and Turkey
gapminder %>%
  filter(year == 2015 & country %in% c("Sri Lanka", "Turkey")) %>%
  select(country, infant_mortality)

# basic scatterplot of life expectancy versus fertility
# ds_theme_set()    # set plot theme
gapminder %>% filter(year == 1962) %>%
  ggplot(aes(fertility, life_expectancy, color=continent)) +
  geom_point()

