library(NHANES)
data(NHANES)

# The NHANES data has many missing values. 
# Remember that the main summarization function in R will return NA 
# if any of the entries of the input vector is an NA. Here is an example:
mean(na_example)
sd(na_example)
# To ignore the NAs, we can use the na.rm argument:
mean(na_example, na.rm = TRUE)
sd(na_example, na.rm = TRUE)

# Let's explore the NHANES data. We will be exploring blood pressure in this dataset.
# First let's select a group to set the standard. We will use 20-29 year old females.
# Note that the category is coded with 20-29, with a space in front of the 20! The AgeDecade is a categorical variable with these ages.
# To know if someone is female, you can look at the Gender variable.

NHANES %>% filter(AgeDecade == " 20-29" & Gender=="female") %>% head()
tab = NHANES %>% filter(AgeDecade == " 20-29" & Gender=="female")

# we will compute the average and standard deviation for the subgroup we defined
# You will determine the average and standard deviation of systolic blood pressure, which are stored in the BPSysAve variable in the NHANES dataset.
ref <- NHANES %>% filter(AgeDecade == " 20-29" & Gender == "female") %>% summarize(average=mean(BPSysAve, na.rm=TRUE), standard_deviation = sd(BPSysAve, na.rm = TRUE))

#  generate only the average blood pressure for 20-29 year old females
#  code to assign the average to a numeric variable called ref_avg using the . or pull.
ref_avg <- NHANES %>%
  filter(AgeDecade == " 20-29" & Gender == "female") %>%
  summarize(average = mean(BPSysAve, na.rm = TRUE), 
            standard_deviation = sd(BPSysAve, na.rm=TRUE)) %>% .$average

# calculate two other data summaries: the minimum and the maximum  for the BPSysAve variable and the group of 20-29 year old females.
# save the min and max of systolic blood pressure as minbp and maxbp
NHANES %>%
  filter(AgeDecade == " 20-29"  & Gender == "female") %>% summarize(minbp=min(BPSysAve, na.rm=TRUE), maxbp=max(BPSysAve, na.rm=TRUE))

# compute the average and standard deviation of systolic blood pressure for females for each age group separately. Remember that the age groups are contained in AgeDecade.
NHANES %>%
  filter(Gender == "female") %>% group_by(AgeDecade) %>% summarize(average=mean(BPSysAve, na.rm=TRUE), standard_deviation = sd(BPSysAve, na.rm=TRUE))
#Compute the average and standard deviation for each value of Race1 for males in the age decade 40-49. 
# Order the resulting table from lowest to highest average systolic blood pressure.
NHANES %>%   filter(AgeDecade==" 40-49" & Gender == "male") %>% group_by(Race1)  %>% summarize(average=mean(BPSysAve, na.rm=TRUE), standard_deviation=sd(BPSysAve, na.rm=TRUE))%>% arrange(average)