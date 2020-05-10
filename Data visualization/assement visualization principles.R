library(dplyr)
library(ggplot2)
library(dslabs)
dat <- us_contagious_diseases %>%
  filter(year == 1967 & disease=="Measles" & !is.na(population)) %>% mutate(rate = count / population * 10000 * 52 / weeks_reporting)
state <- dat$state 
rate <- dat$count/(dat$population/10000)*(52/dat$weeks_reporting)
# Redefine the state object so that the levels are re-ordered by rate.
# Print the new object state and its levels (using levels) so you can see that the vector is now re-ordered by the levels.
state <- reorder(state, rate)
levels(state)

# create plot where states are ordered by rate
data(us_contagious_diseases)
dat <- us_contagious_diseases %>%
  filter(year == 1967 & disease=="Measles" & count>0 & !is.na(population)) %>%
  mutate(rate = count / population * 10000 * 52 / weeks_reporting)%>% 
  mutate(state=reorder(state,rate))#order state by rate

dat %>% ggplot(aes(state, rate)) +
  geom_bar(stat="identity") +
  coord_flip()# will move flip x and y axes

# create a bar plot to compare gun homicide rates across regions of the US. 
data("murders")
murders %>% mutate(rate = total/population*100000) %>%
  group_by(region) %>%
  summarize(avg = mean(rate)) %>%
  mutate(region = factor(region)) %>%
  ggplot(aes(region, avg)) +
  geom_bar(stat="identity") +
  ylab("Murder Rate Average")

# But this visualization has following limitation 
# It does not show all the data. We do not see the variability within a region and it's possible that the safest states are not in the West.
# Order the regions by their median murder rate by using mutate and reorder.
# Make a box plot of the murder rates by region.
# Show all of the points on the box plot.

murders %>% 
  mutate(rate = total/population*100000) %>% 
  mutate(region=reorder(region, rate, FUN="median")) %>%
  ggplot(aes(region, rate)) +
  geom_point()+
  geom_boxplot()