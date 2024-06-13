######################################################################
# MSCA 37010 Programming for Analytics                               #
# Week 4 Assignment Solutions                                        #
# Due by October 30 at 11:59pm (CST) | 100 points + 20 bonus points  #
######################################################################

##########################
# Deplyr Library/Package #
##########################

# 1) Subsetting Data Frames by Using subset() Function and built-data painters (15 points)
getwd()
setwd("C:/Users/chris/OneDrive/Desktop/TeachingUChicago/Autumn2020/Data")
#install.packages("readr")
#install.packages("dplyr")
library(readr)
library(dplyr)
library(MASS)
head(painters)

# 1.1)	To select the observations of painters with Drawing greater than or equals 18



# 1.2)	To select those observations of School is B and D




# 1.3)	To select those observations with the Composition (the first column) and 
#     Expression variables (the fifth column)



# 1.4)  To create a data set that contains those observations of School is B and D
#     with the Composition (the first column) and Expression variables (the fifth column)




# 2) Use CommercialProperty(2).csv to do the following: (20 points)

CP<-read.csv("C:/Users/chris/OneDrive/Desktop/TeachingUChicago/Autumn2020/Data/CommercialProperty(2).csv")
head(CP)

# 2.1) Subset/Create a EffectiveYear variable based on the EffectiveDate column


# 2.2) Subset/Create a EffectiveMonth variable based on the EffectiveDate column


# 2.3) Subset/Create a dataset with EarnedPremium>=3000 and EffectiveYear>=17


# 2.4) Subset/Create a dataset with IncurredLoss>100 


# 2.5) Subset/Create a sub dataset with State is CA and Segment is habitational



# 2.6) Subset/Create a dataset when IncurredLoss>100 and State is CA and Segment is Habitational


# 2.7) Calculate average earned premium:




# 2.8) Create a variable named as "LargePremium_Indicator" when the EarnedPremium 
# is greater than average EarnedPremium from the above




# 2.9) Use for loop to create an indicator (aka: binary variable/new column) for each of 
# CA, IL, FL, NY based on the State column # (10 Bonus Points)








#####################
# if else Statement #
#####################

# 3) Based on our syllabus, please create multiple condition statements for student grades: (10 points)
# A = 93%–100% 
# A- = 90%–92%
# B+ = 87%–89% 
# B = 83%–86% 
# B- = 80%–82%
# C+ = 77%–79% 
# C = 73%–76% 
# C- = 70%–72%
# D = 60%–69%
# F = 0% - 59%
        













# 4) Import the CommercialProperty dataset and Attach the CommercialProperty dataset (35 points)
# 4.1) Use a function to signal an error if the CommercialProperty dataset contains NA
# 4.2) Use a function to remove missing data from the CommercialProperty dataset 
# 4.3) Use a function to return a logical vector indicating which rows have no missing data
# 4.4) Sort the columns by PolicyNumber and EarnedPremium in ascending order
# 4.5) Use a ifelse() function to create an indicator for each of CA, IL, FL, NY
# 4.6) Create a variable LossRatio (= IncurredLoss/EarnedPremium) 
# 4.7) Create an indicator (= 1 if Loss Ratio >=60% & IncurredLoss >=25,000, else 0)

getwd() 
CP<-read.csv("C:/Users/chris/OneDrive/Desktop/TeachingUChicago/Autumn2020/Data/CommercialProperty.csv")

# Or,
CP<-read_csv("CommercialProperty.csv")

names(CP)

# 4.1)




# 4.2) 


# 4.3)


# 4.4) 



# 4.5)



# 4.6) Create a variable LossRatio (= IncurredLoss/EarnedPremium) 



# 4.7)	Create an indicator (= 1 if Loss Ratio >=60% & IncurredLoss >=25,000, else 0)




#############
# For loops #
#############


# 5) Use For Loop to calculate squared values for 1 to 25.(5 points)



# 6) Use the Workouts vector to create a for loop to list all the weekdays (5 points)
Workouts <- c("Biking","Hiking","Yoga","Walking","Jogging")

# Hint: Some possible output looking like below:

# [1] "Biking"  "on"  "Monday"
# [1] "Hiking"  "on"  "Tuesday"
# [1] "Yoga"    "on"  "Wednesday"
# [1] "Walking" "on"  "Thursday"
# [1] "Jogging" "on"  "Friday"


# 7) Subset/Create a for loop to convert fahrenheit to Celeius in the vector: (5 point)
fahrenheit <- c(60, 65, 70, 75, 80, 85, 90, 95, 100) 
# Hint: use length() function to count the temperature position in fahrenheit vector


# 8) Use a for loop to count the number of even numbers in a vector. (5 points)
x <- c(2,5,3,9,8,11,6)




# 9) Please create a for loop to merge the 5 Dataframes (add columns): (10 bonus points)
Data1<-data.frame("State"=c("CA","NY","IL"),"Value1"=c(900,1000,1200))
Data2<-data.frame("State"=c("CA","NY","IL"),"Value2"=c(300,800,700)) 
Data3<-data.frame("State"=c("CA","NY","IL"),"Value3"=c(200,500,1300))
Data4<-data.frame("State"=c("CA","NY","IL"),"Value4"=c(400,1100,600))
Data5<-data.frame("State"=c("CA","NY","IL"),"Value5"=c(100,1600,300)) 





