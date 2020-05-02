library(tidyverse)
library(dslabs)
data(murders)
# geom_point will give scatter plot
# aes for asthetics mapping
# plot murder totals vs population in millions
murders %>% ggplot() +  geom_point(aes(x = population/10^6, y = total))

# add points layer to predefined ggplot object
p <- ggplot(data = murders)
p + geom_point(aes(population/10^6, total))

# add text layer to scatterplot
# in the following aes accesses population, total, abb from the data ggplot has been initiated with
p + geom_point(aes(population/10^6, total)) +
  geom_text(aes(population/10^6, total, label = abb))

p + geom_hex(aes(population/10^6, total)) +
  geom_text(aes(population/10^6, total, label = abb))
