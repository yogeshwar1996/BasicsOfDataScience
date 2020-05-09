library(dplyr)
library(dslabs)
data(gapminder)

# Create a table showing the country and region for the African countries
# (use select) that in 2012 had fertility rates of 3 or less and life expectancies
# of at least 70.
# Assign your result to a data frame called df.
df = gapminder %>%  filter(continent=='Africa' & year==2012& fertility <= 3 & life_expectancy >= 70)%>% select(country, region)

# create a time series plot that covers the period from 1960 to 2010 of
# life expectancy for Vietnam and the United States, using color to 
# distinguish the two countries. In this start we start the analysis 
# by generating a table.
# Use filter to create a table with data for the years from 1960 to 2010 in Vietnam and the United States.
# Save the table in an object called tab.
tab = gapminder %>% filter(year>=1960 & year<=2010 & country %in% c("Vietnam", "United States") )

#Use geom_line to plot life expectancy vs year for Vietnam and the United States and save the plot as p. 
# The data table is stored in tab.
# Use color to distinguish the two countries.
# Print the object p.

p = tab %>% ggplot(aes(x=year, y=life_expectancy, color=country)) + geom_line()
p

# Use a single line of code to create a time series plot from 1960 to 2010 of life expectancy vs year for Cambodia.
p = gapminder %>% filter(country=='Cambodia' & year>=1960 & year <=2010) %>% ggplot(aes(x=year, y=life_expectancy)) + geom_line()
p

# calculate and plot dollars per day for African countries in 2010 using GDP data.
#Use mutate to create a dollars_per_day variable, which is defined as gdp/population/365.
# Create the dollars_per_day variable for African countries for the year 2010.
# Remove any NA values.
# Save the mutated dataset as daydollars.
daydollars <- gapminder %>% mutate(dollars_per_day=gdp/population/365) %>% filter(continent=="Africa" & year==2010 & !is.na(dollars_per_day))

# plot the smooth density plot using a log (base 2) x axis.
# Create a smooth density plot of dollars per day from daydollars.
# Use scale_x_continuous to change the x-axis to a log (base 2) scale.
daydollars %>% ggplot(aes(dollars_per_day)) + geom_density() + scale_x_continuous(trans="log2")

# Create the dollars_per_day variable as in Exercise 7, but for African countries in the years 1970 and 2010 this time.
# Make sure you remove any NA values.
# Create a smooth density plot of dollars per day for 1970 and 2010 using a log (base 2) scale for the x axis.
# Use facet_grid to show a different density plot for 1970 and 2010.

gapminder %>% mutate(dollars_per_day=gdp/population/365) %>% filter(continent=="Africa" & year %in% c(1970,2010) & !is.na(dollars_per_day))%>% ggplot(aes(dollars_per_day)) + geom_density() + scale_x_continuous(trans="log2") + facet_grid(.~year)
# show a stacked density plot of each region in Africa.
# Make sure the densities are smooth by using bw = 0.5.
# Use the fill and position arguments where appropriate to create the stacked density plot of each region
gapminder %>% mutate(dollars_per_day=gdp/population/365) %>% 
  filter(continent=="Africa" & year %in% c(1970,2010) & !is.na(dollars_per_day))%>%
  ggplot(aes(dollars_per_day, fill=region)) + 
  geom_density(bw=0.5,position="stack") +
  scale_x_continuous(trans="log2") + 
  facet_grid(year~.)

# Generate dollars_per_day using mutate and filter for the year 2010 for African countries.
# Remember to remove NA values.
# Store the mutated dataset in gapminder_Africa_2010.
# Make a scatter plot of infant_mortality versus dollars_per_day for countries in the African continent.
# Use color to denote the different regions of Africa.
# Transform the x axis to be in the log (base 2) scale.
# Add a geom_text layer to display country names in addition to of points.

gapminder_Africa_2010 <- gapminder %>% mutate(dollars_per_day=gdp/population/365)%>% filter(continent=="Africa" & year==2010 & !is.na(dollars_per_day)) # create the mutated dataset

# now make the scatter plot
gapminder_Africa_2010 %>% ggplot(aes(x= dollars_per_day, y=infant_mortality, color=region, label=country)) + geom_point() + scale_x_continuous(trans="log2")+
  geom_text() 

# Use facet_grid to show different plots for 1970 and 2010. Align the plots vertically.

gapminder %>% 
  mutate(dollars_per_day=gdp/population/365)%>% 
  filter(continent=="Africa" & year %in% c(1970,2010) & !is.na(dollars_per_day) & !is.na(infant_mortality)) %>%
  ggplot(aes(x= dollars_per_day, y=infant_mortality, color=region, label=country)) +
  geom_point() + 
  scale_x_continuous(trans="log2")+
  geom_text() +
  facet_grid(year~.)




















