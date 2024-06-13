######################################################################
# PFA Week 1 Assignment Solutions                                    #
# Due by Friday, October 9 at 11:59pm | 100 points + 5 bonus points  #
######################################################################

# 1). Which help function I can use to help to find the built-in documentation for the package "ggplot2"? (5 points)

help(package="ggplot2")


# 2). Please write down your R code to display the data structure, statistical summary, 
#     the first 6 observations, and last 6 observations of built-in data set iris. (10 points)
# to display the data structure
str(iris)

# to display the statistical summary of the data set
summary(iris)

# to display the first and last 6 observations
head(iris)
tail(iris)

# displays data structure of iris data set
class(iris)  

# 3). Please write a R function when we only know part of the function name; 
#     Use it to search all the funaction names which include "app". (5 points)

apropos("app")

# 4). How to know the current working directory? (5 points)

getwd()

# 5). How to change the working directory? (5 points)

setwd("C:/Users/chris/OneDrive/Desktop/TeachingUChicago/Autumn2020/Week1")
# Or,

setwd("C:\\Users\\chris\\OneDrive\\Desktop\\TeachingUChicago\\Autumn2020\\Week1")

# 6). What function will give a list of the datasets of all loaded packages (5 points)
data()
library(help='datasets')

# 7). Write R code that will give you the datsets of the package of "dplyr" (5 points)
data(package="dplyr")

# 8). Write down R code that will give you a list of all datasets in the available packages
#    on your comer (also the not-loaded ones) (Bonus 5 points))
data(package = .packages(all.available = TRUE))


# 9). Assign a, b, c, d, e for each of the 5 data types: Numeric, Integer, Complex, Logical, Character. (10 points)

a <- 34.5
b <- as.integer(29); b; is.integer(b)
c <-1+2i
d <-TRUE
e <- "Hello"

# 10). How to check the data types of the 5 variables? (7.5 points)

class(a)
class(b)
class(c)
class(d)
class(e)

# 11). How to convert a in above into character values? (2.5 points)
# Hint: use as.character or toString() function

as.character(a)
# Or,
a <- toString(a)

# 12). Use c() to write your R code to create a vector of 5 numeric elements (2.5 points)

v1 <- c(2.5, 4, 7.3, 0.1, 0.6); v1; class(v1)

# 13). Use c() to write your R code to create a vector of 5 character elements (2.5 points)
v2 <- c("A", "B", "C", "D", "E"); v2; class(v2)

# 14). Write a sequence of integers starting from 0, increased by 5, until 100 (5 points)
seq(0, 100, by=5)

# 15). Create a numeric vector with 5 element and repeat the 5 elements together for 5 times (5 points)
v4 <- c(3,4,5,6,7)
rep(v4,times=5)

# 16). Create a vector with the classes you will take from Monday through Friday. (5 points)
RegisterredClass <- c("English", "Python Programming","R Programming", "Machine Learning", "Leadership" );RegisterredClass
Weekdays <- c("Monday", "Tuesday", "Wednesday","Thursday","Friday"); Weekdays
names(RegisterredClass) <-Weekdays
RegisterredClass

names(RegisterredClass) <-c("Mon", "Tues", "Wed","Thurs","Fri")
RegisterredClass

# 17). Use a built-in function to find the day the class is English # use 16) (5 points)

RegisterredClass[RegisterredClass=="English"]

# 18). Use the following two vectors: (5 points)
v1 <- c(31,32,33)
v2 <- c(62,66,67)

# 18.1) Multiplying two vectors
v1*v2

# 18.2) Dividing Vector 1 by vector 2
v1/v2

# 18.3) Grab the third element from v1 and v2 to create a new vector v3 with 2 elements
v1[3]
v2[3]
v3 <- c(v1[3],v2[3]); v3

# 19). Use seq to create a sequence from 1 to 100 (5 points)
seq1 <- seq(1,100)

# 19.1) Grab the position from 78 to 81
seq1[78:81]

# From student:
match(78:81, seq1)
which( seq1 %in% c(78:81))

# 19.2) Grab elements greater than 95
seq1>95
seq1[seq1>95]

# 20). USe which.max() to find the max value of the following vector (5 points)
v5 <- rep(1:10,times=10:1); v5
which.max(v5)
v5[which.max(v5)]
