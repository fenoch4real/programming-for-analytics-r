######################################################################
# Getting Help with R                                                #
######################################################################

# Google search or visiting StackOverflow

# Some built-in ways to get help with R, Most R functions have online documentation.
install.packages("gplots")
help(package="gplots")
library(gplots)

install.packages("reader")
help(package="readr")
library(readr)

# help(package=“gplots”) from Week 1 Lecture Notes Page #33
# this didn't work in class because I typed the quotation mark in the 
# ppt slides which is slightly different from the ones in RStudio. 

# General help:
help.start() 

# To look for a specific function from a loaded package:?function name or help(function name)

help(package="gplots")

# To look for a symbol put quotations around the symbol, i.e. 
?"numeric"
help("var")
help("+")

# To search all installed packages for key words,>?"key words" or >help.search("key words")
?"mean"

# help.search: https://www.rdocumentation.org/packages/utils/versions/3.6.2/topics/help.search

# To run the example included with the documentation, >example(function name)
example(mean)

# There are also demos included with the base system and some packages. 
# To see a complete list of demos in the base system, >demo() To run a particular demo, demo("topic")

# Know the name of the linear regression function, lm, but have a question about the syntax,  
?lm

# On the other hand if we don't know what function to use,  
help.search("regression")

# To find out the arguments of a function, use the args() function: 
args(var)

# Search a function that only know part of the function name: 
apropos("len")
apropos("sor")

# Need help with vectors, try help()
help(vector)

# str(a) display the internal structure of an R object
str(mtcars)

summary(mtcars) # gives a “summary” of a, usually a statistical summary 

ls()  # show objects in the search path; specify pat="pat" to search on a pattern
ls.str() 

dir() # show files in the current directory

###############################
###### Arithmetic with R ######
###############################

# Addition
1+2

# Subtration
13-1

# Division 
7/14
 
# Exponents 
4^3

# %% indicates x mod y (“x modulo y”) and %/% indicates integer division. It is guaranteed that:
x == (x %% y) + y * (x %/% y)  # (up to rounding error)

# Modular 
9 %% 2

# Integer Division
9 %/% 2

# EXercise: 

10%%3
10%/%3


log(5) + exp(1)

##### Order of Operations
(1000 / 200 ) * (10 * 2) + (50 / 2)

##### Comparison Operators
# In R we can use comparison operators to compare variables and return logical values 
# Examples: Greater Than

10 > 6; 9 > 10

# Element by element comparisons for two vectors:

v1 <- c(1,2,3); v2 <- c(0.5,20,30); v1 < v2

# Greater Than or Equal to:
6 >= 7; 6 >= 5; 6 >= 6

# Less Than and Less than or Equal To:

3 < 2; 2 <= 2; 2<=1 

# Be very careful with comparison operators and negative numbers
# Use spacing to keep things clear:
var <- 1;

# Comparing var less than negative 2
var2<- -2;
var; var2

# Not Equal 
2 != 2; 3!=2

# Equal 
5 == 5; 2 == 3

# and &
(2!= 2) & (3!=2)

# Test if x is TRUE
isTRUE(3>5); isTRUE(3<5)

# Vector Comparisons
# A comparison of a single number to an entire vector:
v <- c(1,2,3,4,5);
v < 2;
v == 3


##### Print Formatting
# print() function - print out variables or strings:
print("hello")

x <- 10
print(x)

x <- mtcars
print(mtcars)
head(mtcars,10)
tail(mtcars,5)

#### Formatting
# format strings and variables together for printing in a few different ways:
# paste() function looks like this:   paste (..., sep = " ")
# - sep is the separator you want between the pasted items, by default it is a space.
print(paste('hello','world'))
print(paste('hello','world',sep='-|-'))

defaults <- options()      # Save all default options
/options
getOption("digits")        # [1] 7
pi                         # [1] 3.141593
options(digits=15)         # Change to 15 digits
pi                         # [1] 3.14159265358979
options(defaults)          # Restore all default options
pi

#### Variables - how to assign variables in R.
# use the <- character to assign a variable

# Use hashtags for comments
variable.name <- 10; variable.name
Will.account <- 10
deposit <- 10
Will.account <- Will.account + deposit; Will.account
Mei.account <- 100
Tot.account <- Will.account + Mei.account; Tot.account

#### Some basic data types in R
# Numerics - Decimal (floating point values) are part of the numeric class in R
m <- 3.3
n <- pi; n

# Integers - Natural (whole) numbers are known as integers and are also part of the numeric class

i <- 3;i

# Logical - Boolean values (True and False) are part of the logical class. In R these are written in All Caps.
s <- FALSE; s
t <- TRUE; t

# Characters - Text/string values are known as characters in R. 
# Use quotation marks to create a text character string:

char <- "Hello World!"; char

# Also single quotes work
c <- 'Single Quote Char'; c
c2 <- "Single Quote Char"; c2

# Checking Data Type Classes - use the class() function to check the data type of a variable:

class(t)
class(s)
class(char)
class(c)
class(n)
class(i)

getwd()

