library(dslabs)
data(heights)
options(digits = 3) 
#First, determine the average height in this dataset. 
#Then create a logical vector ind with the indices for those individuals who are above average height.
#How many individuals in the dataset are above average height?
ind = heights$height > mean(heights$height) & heights$sex == "Female"
sum(ind)
#How many individuals in the dataset are above average height and are female?
ind = heights$height > mean(heights$height) & heights$sex == "Female"
sum(ind)
#If you use mean() on a logical (TRUE/FALSE) vector, it returns the proportion of observations that are TRUE.
#What proportion of individuals in the dataset are female?
ind = heights$sex == "Female"
mean(ind)

#Determine the minimum height in the heights dataset.
min(heights$height)

#Use the match() function to determine the index of the first individual with the minimum height.
match(min(heights$height), heights$height)
#Use the match() function to determine the index of the all individuals with the minimum height.
which( heights$height == min(heights$height))

#Subset the sex column of the dataset by the index calculated to determine the individual’s sex.
heights$sex[match(min(heights$height), heights$height)]

#Following question takes you through three steps to determine how many of the integer height values between the minimum and maximum heights are not actual heights of individuals in the heights dataset.
max(heights$height)

#Which integer values are between the maximum and minimum heights?
#For example, if the minimum height is 10.2 and the maximum height is 20.8,
#your answer should be x <- 11:20 to capture the integers in between those values.
#(If either the maximum or minimum height are integers, include those values too.)
#Write code to create a vector x that includes the integers between the minimum and maximum heights.
min(heights$height)
max(heights$height)
x <- 50:82 
#How many of the integers in x are NOT heights in the dataset?
#Use the sum() and %in% functions in addition to the ! operator.

sum(!(x%in%heights$height))
    
#Using the heights dataset, create a new column of heights in centimeters named ht_cm.
#Recall that 1 inch = 2.54 centimeters. Save the resulting dataset as heights2.
heights_2 = heights %>% mutate(ht_cm=height*2.54)
#What is the height in centimeters of the 18th individual (index 18)?
heights_2$ht_cm[18]
#What is the mean height in centimeters?
mean(heights_2$ht_cm)
#How many females are in the heights2 dataset?
sum(heights_2$sex=="Female")
#What is the mean height of the females in centimeters?
mean(heights_2$ht_cm[heights_2$sex=="Female"])

#The olive dataset in dslabs contains composition in percentage of eight fatty acids
#found in the lipid fraction of 572 Italian olive oils:
library(dslabs)
library(dplyr)
data(olive)
head(olive)
nrow(olive)
#Plot the percent palmitic acid versus palmitoleic acid in a scatterplot. What relationship do you see?
plot(olive$palmitic, olive$palmitoleic)
#inference - There is a positive linear relationship between palmitic and palmitoleic.

#Create a histogram of the percentage of eicosenoic acid in olive.
hist(olive$eicosenoic)
#inference - The most common value of eicosenoic acid is below 0.05%.

#Make a boxplot of palmitic acid percentage in olive with separate distributions for each region
boxplot(olive$palmitic~olive$region)
boxplot(palmitic~region, data=olive)
#Region is maximum median and max variation
#Inference Southern Italy
