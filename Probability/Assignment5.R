# Esophageal cancer and alcohol/tobacco use,
# Show structure of dataset
str(esoph)
# Show it as a table
View(esoph)
# Show last 6 rows
tail(esoph)
# Show top 6 rows
head(esoph)
# No of rows
nrow(esoph)
# No of columns
ncol(esoph)

library(tidyverse)
# How many cases are there?
all_cases = sum(esoph$ncases)
# How many controls are there?
all_controls = sum(esoph$ncontrols)


# What is the probability that
# a subject in the highest alcohol consumption group is a cancer case?
# Pr(cancerInGroup120+alcgp) = (Sum_of_ncases_in_120+alcgp) / (Total_ncases_in120_alcgp)
# Way1
library(dplyr)
data_of_the_grp= esoph %>% filter(alcgp=='120+') 
sum(data_of_the_grp$ncases)/(sum(data_of_the_grp$ncases)+sum(data_of_the_grp$ncontrols))

# Way2
# Follwoing gives all the rows and columns where alcgp is 120+
esoph[(esoph$alcgp=='120+'),]
# To get values for ncases column
esoph[(esoph$alcgp=='120+'),]$ncases #select all and then chose ncases
# or
esoph[(esoph$alcgp=='120+'),4] #select column ncases only, but here you need to give column index

sum(esoph[(esoph$alcgp=='120+'),]$ncases)/(sum(esoph[(esoph$alcgp=='120+'),]$ncases)+sum(esoph[(esoph$alcgp=='120+'),]$ncontrols))

                                           