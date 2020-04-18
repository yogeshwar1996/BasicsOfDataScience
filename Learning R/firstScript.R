library("tidyverse")
library("dslabs")

data(murders)

murders %>%
  ggplot(aes(population, total, label = abb, color = ra = egion)) +
  geom_label()

