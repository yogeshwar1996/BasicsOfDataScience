library(dslabs)
library(tidyverse)
library(dplyr)
data(gapminder)

# add dollars per day variable
gapminder <- gapminder %>% mutate(dollars_per_day = gdp/population/365)



# number of regions
length(levels(gapminder$region))

# boxplot of GDP by region in 1970
past_year <- 1970
p <- gapminder %>%
  filter(year == past_year & !is.na(gdp)) %>%
  ggplot(aes(region, dollars_per_day, fill=continent))
p + geom_boxplot()

# rotate names on x-axis
p + geom_boxplot() +
  theme(axis.text.x = element_text(angle=45, hjust = 1, size=12))

# by default, factor order is alphabetical
fac <- factor(c("Asia", "Asia", "West", "West", "West"))
levels(fac)

# reorder factor by the category means
value <- c(10, 11, 12, 6, 4)
fac <- reorder(fac, value, FUN = mean)
levels(fac)
# since mean of values coresp to west is less it comes first
# mean(c(12,6,4))<mean(c(10,11))

# reorder by median income and color by continent
p <- gapminder %>%
  filter(year == past_year & !is.na(gdp)) %>%
  mutate(region = reorder(region, dollars_per_day, FUN = median)) %>%    # reorder
  ggplot(aes(region, dollars_per_day, fill = continent)) +    # color by continent
  geom_boxplot() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  xlab("")
p

# log2 scale y-axis
p + scale_y_continuous(trans = "log2")
# add data points
p + scale_y_continuous(trans = "log2") + geom_point(show.legend = FALSE) 
p + scale_y_continuous(trans = "log2") + geom_point(show.legend = FALSE)  + geom_text(aes(label = country), size=4, nudge_x = 0.25, nudge_y = 0.25)







