options(digits = 3)    # report 3 significant digits
library(tidyverse)
library(titanic)

titanic <- titanic_train %>%
  select(Survived, Pclass, Sex, Age, SibSp, Parch, Fare) %>%
  mutate(Survived = factor(Survived), Pclass = factor(Pclass), Sex = factor(Sex))

# Make density plots of age grouped by sex
titanic %>%
  filter(!is.na(Age)) %>% 
  ggplot(aes(Age, color=Sex)) +
  geom_density() 
  
# Make faceted density plot
titanic %>%
  filter(!is.na(Age)) %>% 
  ggplot(aes(Age, color=Sex)) +
  geom_density() + 
  facet_grid(.~Sex)

# Histogram showing age distribution for males and females  
titanic %>%
  filter(!is.na(Age)) %>% 
  ggplot(aes(Age)) + geom_histogram() + facet_grid(.~Sex)

# No. of Males and No. of Females
no_of_males = sum(titanic$Sex=="male")
no_of_females = sum(titanic$Sex=="female")

# Gender with max Age
titanic$Sex[max(titanic$Age, na.rm = TRUE)]

# QQ-plot of Age Distribution
params <- titanic %>%
  filter(!is.na(Age)) %>%
  summarize(mean = mean(Age), sd = sd(Age))

# QQ plot to verfiy distribution approximates to normal distribution or not
# set sample in ggplot aesthetics with variable for which distribution is to be verified
# then in geom_qq pass mean and standard deviation to dparams as summary

titanic %>% ggplot(aes(sample = Age)) +
  geom_qq(dparams = params) +
  geom_abline()# This will add an identity line

# bar plot of Survived filled with gender info
titanic%>% ggplot(aes(Survived, fill=Sex)) + geom_bar()
# bar plot of Gender filled with survival info
titanic%>% ggplot(aes(Sex, fill=Survived)) + geom_bar()

# Make density plot of Age filled by survival status
titanic %>%
  filter(!is.na(Age)) %>% 
  ggplot(aes(Age, fill=Survived)) +
  geom_density(alpha=0.2)

# Make density plot of Age with count on y axis filled by survival status and do suitable alpha blending
titanic %>%
  filter(!is.na(Age)) %>% 
  ggplot(aes(Age, y = ..count.., fill=Survived)) +
  geom_density(alpha=0.2)

# Filter the data to remove individuals who paid a fare of 0
# Make a boxplot of fare grouped by survival status
titanic %>%
  filter(Fare>0) %>% 
  ggplot(aes(Survived, Fare)) + #plot on fares group by survival status
  geom_boxplot() +
  # geom_point()+ # add data points
  geom_jitter(width=0.1, alpha = 0.2)+ #adding jitter of width 0.1 so that points can scatter in x axis for same y value
  scale_y_continuous(trans = "log2") #scaling axis with Fare with log2 transformation

# make a basic barplot of passenger class filled by survival
p1 = titanic %>%
  ggplot(aes(Pclass, fill=Survived)) +
  geom_bar()

p2 = titanic %>%
  ggplot(aes(Pclass, fill=Survived)) +
    geom_bar(position = position_fill())#position_filled helps see relative proprtion in each group
    

p3 = titanic %>%
  ggplot(aes(Survived, fill=Pclass)) +
  geom_bar(position = position_fill())#position_filled helps see relative proprtion in each group

# Create a grid of density plots for age, 
# filled by survival status,
# with count on the y-axis, 
# faceted by sex and passenger class.
titanic %>%
  ggplot(aes(Age, y= ..count.., fill=Survived))+
  geom_density(alpha=0.2)+
  facet_grid(Sex~Pclass)
titanic %>%
  ggplot(aes(Age, y= ..count.., fill=Survived))+
  geom_density(alpha=0.2)+
  facet_grid(Pclass~Sex)

