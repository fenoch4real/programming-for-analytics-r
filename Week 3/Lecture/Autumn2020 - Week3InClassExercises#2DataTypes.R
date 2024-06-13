##################################################################################################
# Data Types:Numeric, Logical, Character, Factor, Dates, Missing Data
#######################################################################################?##########

##################################################################################################
# Numeric: R Technically, numeric data in R can be either double or integer, but in practice 
# numeric data is almost always double (type double?refers to real numbers). 
# See ?integer and ?double
# .Machine outputs numeric characteristics of the machine running R, such as the largest integer 
# or the machine's precision format() formats an object for pretty printing. format() is a generic
# func?ion that is used with other types of objects. See ?format() for additional arguments.
########################################################################?#########################

# trim - If FALSE right justified with common width
format(c(1,10,100,1000), trim = FALSE)
format(c(1,10,100,1000), trim = TRUE)

# nsmall - Minimum number of digits to the right of the decimal point
format(13.7, nsmall = 1)

# scientific - Use scientific notation
format(2^16, scientific = TRUE)

#############################?####################################################################
# Logical
#################################################################################?################

x <- 1:10;x

(x%%2==0) | (x > 5) # What elements of x are even or greater tha? 5?

x[(x%%2==0) | (x > 5)]

y <- 5:15; y

# What elements of x are in y?
x %in% y

x[x%in% y]

# Are any elements of x greater than 5?
any(x>5) 

# Are all the e?ements of x greater than 5?
all(x>5) 

# Isn't that equal?
name <- "Nick"
if(name=="Nick") TRUE else FALSE

# But what if name is never set to "Nick"?
name <- NA

if(name=="Nick") TRUE else FALSE

if(identical(name, "Nick")) TRUE else FALSE

(x <- sqrt(2))

x^2==2

y <- x^2; y


all.equal(x^2, 2)

all.equal(x^2, 1)

isTRUE(all.equal(x^2, 1))


##################################################################################################
# Example Charactor Functions
##############################?###################################################################
animals <- c("bird", "horse", "fish"); animals
home <- c("tree", "barn", "lake"); home

# Number of strings
length(animals)

# Number of characters in each string
nchar(animals) 

cat("Animals:", animals)
?cat
# Need \n to move cursor to a newline
cat("Animals:", "\n", animals)

cat(animals, home) # Joins one vector after the other

cat(animals,"\n", home) # Joins one vector after the other

paste(animals, collapse=" ") # Create one long string of animals

substr(animals, 2, 4) # Get characters 2-4 of each animal

strtrim(animals, 3) # Print the ?irst?three characters

toupper(animals) # Print animals in all upper case

tolower(animals)

##################################################################################################
# Factors
######################################################?###########################################
factor(rep(1:2, 2), labels=c("trt.1", "trt.2"))

factor(rep(1:3, 2), labels=c("low", "med", "high"), ordered=TRUE)

f <- gl(3, 2, labels=paste("trt",1:3, sep=".")); f
?gl

levels(f)
nlevels(f)
relevel(f, "trt.2")
x <- runif(10); x

cut(x, 3)                           # Cut x into three intervals
cut(x, c(0,.25,.5,.75,1))           # Cut x at the given cut points


###################################################################################################
# Convert Strings to Date Objects:
# 
# - %a Abbreviated weekday name                                  - %A Full weekday name
# - %d Day of the month                                          - %B Full month name
# - %b Abbreviated month name                                    - %m Numeric month?(01-12)
# - %y Year without century (be very careful)                    - %Y Year with century           
#
###################################################################################################

Sys.Date()

# Set as a variable
today <- Sys.Date(); today

####################################################
# Code	Values
# %d	Day of the month (decimal number)
# %m	Month (decimal number)
# %b	Month (abbreviated)
# %B	Month (full name)
# %y	Year (2 digit)
# %Y	Year (4 digit)
####################################################
  
# YYYY-MM-DD
as.Date('2020-03-03')

# Using Format
as.Date("Mar-03-20",format="%b-%d-%y")

# Using Format
as.Date("March-03-2020",format="%B-%d-%Y")

dates.1 <- c("5jan2008", "19aug2008", "2feb2009", "29sep2009"); dates.1

as.Date(dates.1, format="%d%b%Y")

dates.2 <- c("5-1-2008", "19-8-2008", "2-2-2009", "29-9-2009"); dates.2

as.Date(dates.2, format="%d-%m-%Y")

###########################################################################?#######################
# To create a sequence of dates, seq.Date(from, to, by, length.out = NULL) 
# from, to   Start and ending date objects 
# by         A character string, containing one of "day", "week", "month" or "year". Can optionally
#           ?be preceded by a (positive or ?egative) integer and a space, or followed by a "s". 
# length.out Integer, desired length of the sequence
###################################################################################################

seq.Date(as.Date("2011/1/1"), as.Date("2011/1/31"), by="week")

seq.Date(as.Date("2011/1/1"), as.Date("2011/1/31"), by="3 days")

seq.Date(as.Date("2011/1/1"), by="week", length.out=10)

########################################################################################?##########
# To divide a sequence of dates into levels, cut.Date(x, breaks, start.on.monday = TRUE)
###################################################################################################
?as.Date

jan <- seq.Date(as.Date("2011/1/1"), as.Date("2011/1/31"), by="days")

cut(jan, breaks="weeks")

?cut

###################################################################################################
# Operations with dates,
# - Days can be added or subtracted to a date
# - Dates can be subtracted
# - Dates can be compared using logical operators
###################################################################################################

jan1 <- as.Date("2011/1/1")
(jan8 <- jan1 + 14) # Add 14 days to 2011/1/1
jan1 - 7 # Subtract 1 week from 2011/1/8
jan8 - jan1 # Number of days between 2011/?/1 and 2011/1/8 Time difference of 7 days
jan8 > jan1 # Compare dates
# Use format to extract parts of a date object or change the appearance
format.Date(jan8, "%Y")
format.Date(jan8, "%b-%d")

x <- matrix(1:6, ncol=2, dimnames=list(NULL,c("c.1", "c.2")));

help(strptime)

## read in date/time info in format 'm/d/y h:m:s'
dates <- c("02/27/92", "02/27/92", "01/14/92", "02/28/92", "02/01/92")
times <- c("23:03:20", "22:29:56", "01:03:30", "18:21:03", "16:56:26")
x <- paste(dat?s, times)
strptime(x, "%m/%d/%y %H:%M:%S")

