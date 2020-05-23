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
data_of_the_grp = esoph %>% filter(alcgp=='120+') 
sum(data_of_the_grp$ncases)/(sum(data_of_the_grp$ncases)+sum(data_of_the_grp$ncontrols))

# Way2
# Follwoing gives all the rows and columns where alcgp is 120+
esoph[(esoph$alcgp=='120+'),]
# To get values for ncases column
esoph[(esoph$alcgp=='120+'),]$ncases #select all and then chose ncases
# or
esoph[(esoph$alcgp=='120+'),4] #select column ncases only, but here you need to give column index

sum(esoph[(esoph$alcgp=='120+'),]$ncases)/(sum(esoph[(esoph$alcgp=='120+'),]$ncases)+sum(esoph[(esoph$alcgp=='120+'),]$ncontrols))

# What is the probability that
# a subject in the lowest alcohol consumption group is a cancer case?
# Pr(cancerInGroup0-39alcgp) = (Sum_of_ncases_in_0-39alcgp) / (Total_ncases_in0-39alcgp)
sum(esoph[(esoph$alcgp=='0-39g/day'),]$ncases)/(sum(esoph[(esoph$alcgp=='0-39g/day'),]$ncases)+sum(esoph[(esoph$alcgp=='0-39g/day'),]$ncontrols))                                           

# Given that a person is a case, what is the probability that they smoke 10g or more a day?
# Pr = Sum of cases that some at least 10 g) / all_cases
sum(esoph[(esoph$tobgp!='0-9g/day'),]$ncases)/all_cases


# Given that a person is a control, 
# what is the probability that they smoke 10g or more a day?
sum(esoph[(esoph$tobgp!='0-9g/day'),]$ncontrols)/all_controls

# For cases, what is the probability of being in the highest alcohol group?
sum(esoph[(esoph$alcgp=='120+'),]$ncases)/all_cases
# Verify from summary of cases alcohol group wise
esoph %>% group_by(alcgp) %>% summarise(sum(ncases))

# For cases, what is the probability of being in the highest tobacco group?
sum(esoph[(esoph$tobgp=='30+'),]$ncases)/all_cases
# Verify from summary of cases tobacco group wise
esoph %>% group_by(tobgp) %>% summarise(sum(ncases))

# For cases, what is the probability of
# being in the highest alcohol group and the highest tobacco group?
# Way1
data_of_both_grp = esoph %>% filter(alcgp=='120+' & tobgp=='30+') 
sum(data_of_both_grp$ncases)/all_cases
# Way2
sum(esoph[(esoph$alcgp=='120+'& esoph$tobgp=='30+'),]$ncases)/all_cases

# For cases, what is the probability of being
# in the highest alcohol group or the highest tobacco group?
# Way1
data_of_both_grp = esoph %>% filter(alcgp=='120+' | tobgp=='30+')
sum(data_of_both_grp$ncases)/all_cases
# Way2
sum(esoph[(esoph$alcgp=='120+'| esoph$tobgp=='30+'),]$ncases)/all_cases

# For controls, what is the probability of being in the highest alcohol group?
sum(esoph[(esoph$alcgp=='120+'),]$ncontrols)/all_controls

# How many times more likely are cases than controls to be in the highest alcohol group?

# total_cases_in120+alcgp /total_controls_in120+alcgp
# sum(esoph[(esoph$alcgp=='120+'),]$ncases) / sum(esoph[(esoph$alcgp=='120+'),]$ncontrols)

# The above will give wrong answer bcz that gives ration of cases to controls
# whereas we are asked the ratios of the likelyness of beloging to a alcgp
# We need to calculate the rations of prob of cases and controls for the group
Prob_cases_in_highetst_alcgp = sum(esoph[(esoph$alcgp=='120+'),]$ncases)/all_cases
Prob_controls_in_highetst_alcgp = sum(esoph[(esoph$alcgp=='120+'),]$ncontrols)/all_controls
Ratio=Prob_cases_in_highetst_alcgp/Prob_controls_in_highetst_alcgp

# To verify
esoph %>% 
  group_by(alcgp) %>%
  summarise(sum(ncases), sum(ncontrols))

# For controls, what is the probability of being in the highest tobacco group?
# total_controls_in_highest_tobgp/total_controls
sum(esoph[(esoph$tobgp=='30+'),]$ncontrols)/all_controls


# For controls, what is the probability of being
# in the highest alcohol group and the highest tobacco group?
data_of_both_grp = esoph %>% filter(alcgp=='120+' & tobgp=='30+')
sum(data_of_both_grp$ncontrols)/all_controls

# For controls, what is the probability of being 
# in the highest alcohol group or the highest tobacco group?
data_of_both_grp = esoph %>% filter(alcgp=='120+' | tobgp=='30+')
sum(data_of_both_grp$ncontrols)/all_controls

# How many times more likely are cases than controls
# to be in the highest alcohol group or the highest tobacco group?

# Pr(cases in highest alc or tob grp)/Pr(controls in highest alc or tob group)
Prob_cases = sum(esoph[(esoph$alcgp=='120+' | esoph$tobgp=='30+'),]$ncases)/all_cases
Prob_controls = sum(esoph[(esoph$alcgp=='120+'| esoph$tobgp=='30+'),]$ncontrols)/all_controls
Ratio=Prob_cases/Prob_controls
