# Using ggplot and the points layer, create a scatter plot of life expectancy versus fertility for the African continent in 2012
library(dplyr)
library(ggplot2)
library(dslabs)
data(gapminder)
## fill out the missing parts in filter and aes
gapminder %>% filter(continent == 'Africa' & year == 2012 ) %>%
  ggplot(aes(x=fertility,y=life_expectancy )) +
  geom_point()

# Remake the plot from the previous exercises but this time use color to distinguish the different regions of Africa to see if this explains the clusters.
gapminder %>% filter(continent == 'Africa' & year == 2012 ) %>%
  ggplot(aes(x=fertility,y=life_expectancy, color=region )) +
  geom_point()

