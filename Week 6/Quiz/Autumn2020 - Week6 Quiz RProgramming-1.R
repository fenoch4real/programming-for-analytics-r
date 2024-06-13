##############################################
# R Programming Quiz 
##############################################

# From Week 1
# 1. Please write down your R code to display the data structure, statistical summary, 
# the first 6 observations, and last 6 observations of built-in data set mtcars

# to display the data structure
str(mtcars)
structure(mtcars)

# to display the statistical summary of the data set

summary(mtcars)

# to display the first and last 6 observations

head(mtcars,6)

# displays data structure of iris data set

class(iris)  


# 2. How to know the current working directory?

getwd()

# How to change the working directory? 

setwd("/Users/oluwafemifabiyi/Downloads/")

# 3.  What function will give a list of the datasets of all loaded packages

data()

# 4. Assign a, b, c, d, e for each of the 5 data types: Numeric, Integer, Complex, 
# Logical, Character

a <- 10
b <- as.integer(9)
c <-9i
d <-FALSE
e <- "a"


# How to check the data types of the 5 variables?

# How to convert a in above into character values? 
# Hint: use as.character or toString() function

typeof(a)
typeof(b)
typeof(c)
typeof(d)
typeof(e)


# From Week 2

# 5. Create 2 vectors A and B, where A is (1,2,3,4) and B is (5,6,7,8). You'll need to 
# choose the cbind() or rbind() function correctly to create a 2 by 4 matrix from 
# the vectors. 
A <- c(1,2,3,4)
B <- c(5,6,7,8)
cbind(A,B)



# 6. Create a 4 by 4 matrix consisting of the numbers 1-16. Create this matrix using 
# 1:16 in the matrix() function call. Assign this matrix to the variable Mat
myMatrix <- matrix(1:16,nrow = 4)
myMatrix


# Use a function to check if Mat is a matrix
is.matrix(myMatrix)

# When the top row should be the numbers 1-4

# When the top row should be the numbers 1-4
myMatrix <- matrix(1:16,byrow=TRUE,nrow = 4)
myMatrix

# Using indexing notation, grab a sub-section of Mat from the previous exercise that looks 
# like this:

# [11,12]
# [15,16]
myMatrix[3:4,3:4]

# What is the sum of all the elements in Mat?
sum(myMatrix)


# 7. Use quarters <- c("spring", "summer", "autumn","winter")      
quarters <- c("spring", "summer", "autumn","winter")  
# 1)	What is the number of strings of quarters?
length(quarters)
# 2)	What is the number of characters in each quarters?
nchar(quarters)
# 3)	What are the characters 2-4 of each quarters?
substr(quarters,2,4)
# 4)	How to print the first three characters of quarters?
substr(quarters,1,3)
# 5)	How to print quarters in all upper case?
toupper(quarters)

# 8.1) Use the factor() function and degrees to create ordinal categorical variables.
degrees <- c('cold','med','cold','med','hot','hot','cold')

# 2) Summarize the numbers by different degrees
summary(fact.temp)

# From Week 3:
# 9. Merge two datasets by an ID variable, where ID is not the same for both datasets
data1 <- data.frame(ID= letters[1:5], x=1:5)
data2 <- data.frame(ID= letters[6:10], y=4:8)
# 1) Keep all the ID from either data1 or data2
merge(data1, data2, all=TRUE)
# 2) Keep the ID which are in both datasets
merge(data1, data2, all=FALSE)
# 3) Only keep the rows from the 1st argument data1
merge(data1,data2, all.x=TRUE)
# 4) Only keep the rows from the 2nd argument data2
merge(data1,data2, all.y=TRUE)

# 5) Merge two datasets to add columns, where the ID variable has a different name
data1 <- data.frame(ID1=1:5, x=letters[1:5]);data1
data2 <- data.frame(ID2=1:5, x=letters[6:10]); data2

merge(data1,data2, by.x="ID2", by.y="ID1")

# 6) Merge two datasets to add rows, where the ID variable has a different name
data1 <- data.frame(ID1=1:5, x=letters[1:5]);data1
data2 <- data.frame(ID2=1:5, x=letters[6:10]);data2
# Hint: you can rename one of the ID variable so that both ID variables have a same name

names(data2)[1] <- "ID1"
merge(data1,data2, all=TRUE)

# From Week 4

# 10. Subsetting Data Frames by Using subset() Function and built-data painters
getwd()
setwd("C:/Users/chris/OneDrive/Desktop/TeachingUChicago/Autumn2020/Data")
#install.packages("readr")
#install.packages("dplyr")
library(readr)
library(dplyr)
library(MASS)
head(painters)

# 1)	To select the observations of painters with Drawing greater than or equals 16
subset(painters, Drawing>=16)

# 2)	To select those observations of School is A and C

painters %>% filter(School=="A" | School=="C")


# 3)	To select those observations with the Composition (the first column) and 
#     School variables (the fourth column)
conflicts(detail=TRUE) 
subset(painters, select=c('Composition','School'))
dplyr::select(painters,Composition,School)
head(painters)
sessionInfo()
version

# 4)  To create a data set that contains those observations of School is A and C
# with the Composition (the first column) and School variables (the fourth column)
subset(painters, School%in%c('A','C'),select=c('Composition','School'))



# 11. Create multiple performance condition statements for agents
# Outstanding High Performer = 90%-100% 
# High Performer = 80%-89%
# Average Performer = 70%-79% 
# Coaching Needed = 0%-69% 


fg <-93

if (fg >= 90) {
  print('Outstanding')
} else if (fg >= 80 & fg < 90){
  print('High')
} else if (fg >= 70 & fg < 80){
  print('Average')
} else {
  print('Coaching Needed')
}


# 12. Use a for loop to count the number of odd numbers in a vector.

x <- c(20,27,33,18,9,9,5)
i <- 0
for (val in 1:lenght(x)) {
  if(x[val] %% 2 != 0)  {
    i = i+1
    }
}
i
# 13. Create a function to return the log of a value.

calcLog <- function(a){
  return (log(a))
}

