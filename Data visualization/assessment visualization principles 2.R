# tile plot to show the rate of smallpox

library(dplyr)
library(ggplot2)
library(RColorBrewer)
library(dslabs)
data(us_contagious_diseases)
# Exclude years in which cases were reported in fewer than 10 weeks from the plot
the_disease = "Smallpox"
dat <- us_contagious_diseases %>% 
  filter(!state%in%c("Hawaii","Alaska") & disease == the_disease & !weeks_reporting < 10) %>% 
  mutate(rate = count / population * 10000) %>% 
  mutate(state = reorder(state, rate))

dat %>% ggplot(aes(year, state, fill = rate)) + 
  geom_tile(color = "grey50") + 
  scale_fill_gradientn(colors = brewer.pal(9, "Reds"), trans = "sqrt") + 
  ggtitle(the_disease)

# creare time series plot for california to see rates of all diseases, include years where  10 or more weeks reporting has been done
us_contagious_diseases %>% filter(state=="California"& weeks_reporting>=10) %>% 
  group_by(year, disease) %>%
  summarize(rate = sum(count)/sum(population)*10000) %>%
  ggplot(aes(year, rate, color=disease)) + 
  geom_line()
#make a time series plot for the rates of all diseases in the United States
# You will need to filter for !is.na(population) to get all the data.
us_contagious_diseases %>% filter(!is.na(population)) %>% 
  group_by(year, disease) %>%
  summarize(rate = sum(count, na.rm=TRUE)/sum(population, na.rm=TRUE)*10000) %>%
  ggplot(aes(year, rate, color=disease)) + 
  geom_line()