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

# add text layer to scatterplot, this will add labels to each point
# labels can be shifted along x and y axis using nudge_x and nudge_y
# size of points can also be changed
p + geom_point(aes(population/10^6, total), size=0.5) +
  geom_text(aes(population/10^6, total, label = abb), nudge_x = 1.5)

p + geom_hex(aes(population/10^6, total)) +
  geom_text(aes(population/10^6, total, label = abb), nudge_x = 1.5)
