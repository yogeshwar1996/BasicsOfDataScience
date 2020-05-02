# load libraries
library(tidyverse)
library(ggrepel)
library(ggthemes)
library(dslabs)
data(murders)

# define the intercept
r <- murders %>%
  summarize(rate = sum(total) / sum(population) * 10^6) %>%
  .$rate

# make the plot, combining all elements
murders %>%
  # Add global asthetics
  ggplot(aes(population/10^6, total, label = abb)) +
  # add dashed average murder rate line
  geom_abline(intercept = log10(r), lty = 2, color = "darkgrey") +
  # Add scatter plot with point size 3 and points colored by region
  geom_point(aes(col = region), size = 3) +
  # Add space between the labels
  geom_text_repel() +
  # Make s and y axis of the scale log10
  scale_x_log10() +
  scale_y_log10() +
  # Add labels to the axes
  xlab("Population in millions (log scale)") +
  ylab("Total number of murders (log scale)") +
  # add title to the chart
  ggtitle("US Gun Murders in 2010") +
  # Customize legend name
  scale_color_discrete(name = "Region") +
  # apply custom theme
  theme_economist()
