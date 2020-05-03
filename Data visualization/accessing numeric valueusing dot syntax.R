library(tidyverse)
library(dslabs)
data(murders)

# murder rate per hundered thousand population
murders <- murders %>% mutate(murder_rate = total/population*100000)
summarize(murders, mean(murder_rate))

# calculate US murder rate, generating a data frame
us_murder_rate <- murders %>%
  summarize(rate = sum(total) / sum(population) * 100000)

# extract the numeric US murder rate with the dot operator
us_murder_rate %>% .$rate
