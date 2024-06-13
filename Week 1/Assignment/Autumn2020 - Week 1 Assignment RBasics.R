######################################################################
# PFA Week 1 Assignment                                              #
# Due by March 10 at 11:59pm | 100 points + 5 bonus points           #
######################################################################

# 1). Which help function I can use to help to find the built-in documentation for the package "ggplot2"? (5 points)
??ggplot2


# 2). Please write down your R code to display the data structure, statistical summary, 
#     the first 6 observations, and last 6 observations of built-in data set iris. (10 points)
str(iris)
summary(iris)
head(iris)
tail(iris)


# 3). Please write a R function when we only know part of the function name; 
#     Use it to search all the funaction names which include "app". (5 points)
apropos("app")


# 4). How to know the current working directory? (5 points)
getwd()


# 5). How to change the working directory? (5 points)
setwd("~/Desktop/MSc Analytics/Autumn 2020/")


# 6). What function will give a list of the datasets of all loaded packages (5 points)
data()


# 7). Write R code that will give you the datsets of the package of "dplyr" (5 points)
data(package = "dplyr")


# 8). Write down R code that will give you a list of all datasets in the available packages 
#     on your comer (also the not-loaded ones) (Bonus 5 points))
data(package = .packages(all.available = TRUE))


# 9). Assign a, b, c, d, e for each of the 5 data types: Numeric, Integer, Complex, Logical, Character. (10 points)
a <- 2
b <- -1:1
c <- as.complex(5)
d <- TRUE
e <- 'a'


# 10). How to check the data types of the 5 variables? (7.5 points)
class(a)
class(b)
class(c)
class(d)
class(e)


# 11). How to convert a in above into character values? (2.5 points)
# Hint: use as.character or toString() function
as.character(a)


# 12). Use c() to write your R code to create a vector of 5 numeric elements (2.5 points)
v1 = c(9,4,2,7,8)


# 13). Use c() to write your R code to create a vector of 5 character elements (2.5 points)
v2 = c('l','o','n','d','k')


# 14). Write a sequence of integers starting from 0, increased by 5, until 100 (5 points)
seq(0, 100, by=5);


# 15). Create a numeric vector with 5 element and repeat the 5 elements together for 5 times (5 points)
rep(c(6,8,4,9,2), times=5)


# 16). Create a vector with the classes you will take from Monday through Friday. (5 points)
days <- c('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday')
lectures <- c('Statistical Analysis','Leadership skills', 'Data Engineering', 'Programing for Analytics', 'English')
names(days) <- lectures


# 17). Use a built-in function to find the day the class is English (5 points)
days['English']


# 18). Use the foolowing two vectors: (5 points)
v1 <- c(31,32,33)
v2 <- c(62,66,67)


# 18.1) Multiplying two vectors

v1 * v2


# 18.2) Dividing Vector 1 by vector 2

v1 / v2


# 18.3) Grab the third element from v1 and v2 to create a new vector v3 with 2 elements

 v3 <- paste0(v1[3],v2[3])

 
# 19). Use seq to create a sequence from 1 to 100; (5 points)
my.seq <- seq(1:100)


# 19.1) Grab the position from 78 to 81
my.seq[78:81]


# 19.2) Grab elements greater than 95
my.seq[95 : length(my.seq)]


# 20). USe which.max() to find the max value of the following vector: 
#      v5 <- rep(1:10,times=10:1); v5  (5 points)
v5 <- rep(1:10,times=10:1); v5
which.max(v5)

