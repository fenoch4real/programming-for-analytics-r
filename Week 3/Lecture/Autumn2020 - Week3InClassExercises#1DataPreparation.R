#############################################################
################## Data Preparation #########################
# 1. Subsetting
# 2. Merging      
# 3. Review Data Types (see Data Types.R)
# 4. Sorting (see Sort_Order_RankFunction.R)
# 5. Duplicates
# 6. Missing values
# 7. Dplyr library (see Dplyr Library (Data Manipulation).R)
#############################################################

### 1. Subsetting ###
# Subsetting vectors, matrices, arrays, or data frame can also be referred to as indexing
# - 1) Subsetting Vectors
# - 2) Subsetting Data Frames
# - 3) Subsetting Operators in R

# 1) Subsetting Vectors can be achieved by inserting an index vector in square brackets to the name of the vector 
# A logical vector:
# - The index vector should be the same length as the vector from which the elements are to be selected
# - Values corresponding to TRUE in index vector are being selected / to FALSE are being excluded
# - Values corresponding to NA returns NA

a <- c(1, 3, 5, NA, 7); a 
is.na(a)      
!is.na(a)    
a[!is.na(a)]   
a > 3          
a [a > 3]      

# 2) Subsetting Data Frames: 

d <- data.frame(L = c("A","B","C"), M = 1:3, N = c(T, F, NA)); d
?data.frame
# Second and third rows
d[c(2,3),]

# First and third columns
d[,c(1,3)]

# Row when L = A
d[d$L == "A",]

# Column M and N
d[,c("M","N")]

# Row when L = A & Column M and N
d[d$L == "A",c("M","N")]

# Exercise:

e <- data.frame(L = c("A","B","C", "D"), M = 1:4, N = c(T, F, NA, NA)); e

# Pull the first two rows
e[1:2, ]
e[c(1:2), ]
# Pull the M and N columns
e[, 2:3]
e[, c(2:3)]
# Pull the first two rows with only M and N columns
e[1:2, 2:3]

# 3) Subsetting Operators: Three operators, [ ], [[ ]], and $, can be used to subset objects.  
# Deciding which operator to use depends upon the object type. 
# The main behavior difference across these three objects are: 
# - The type of object returned by using the "[" operator is the same  data type as the object "[" applies to 
                                                                                             
# Example: using "[" to subset a list returns a list
# - Use "[" to extract any numbers of elements of an object, while you can only use "[[" and "$" to extract one element
# - "$" does not evaluate its argument, while "[[" and "[" do. Thus, you can include an expression inside "[[" or "["
# - "$" uses partial matching to extract elements, while "[[" and "[" do not
                                                              
# Examples
alist <- list(name1 = c("john", "ken"), station2 = "AM640", time3 = "M-F: 3:00pm");alist 
alist[c(1,2)] 

# Note: The code above extracts the first two elements from alist. The resulting object is also a list. 
# You can not write alist[[c(1,2)]] since you can only extract one element by using the [[ operator
alist["name1"]      
alist[["name1"]]    
alist$name1           
 
# More Subsetting Data Frames:
# Simplifying : using the index vector with “[“ operator at the second index position or 
# using the “[[“ operator when selecting a column
# Preserving : using the index vector the “[“ operator at the second index position and setting the drop 
# option to FALSE or using the “[“ operator when selecting a column
dat <- data.frame(V1=1:3, V2=c("a","b","c"), V3=c(T,T,F)); dat                                                                                                                                       
dat[,2]
dat[[2]]
dat[c(2,3)]
dat$V2

# Subsetting Data Frames by Using Index Vectors
# Example: use the data set, painters, from the MASS library to illustrate some examples
library(MASS) 
head(painters,3) 

# Selecting the observations from a data frame is similar to selecting rows from a matrix by placing an index 
# vector on the left side of the comma (,) inside the []
# Example: To select the observations of painters with Colour greater than or equals 17: 
painters[painters$Colour>=17, ] 

# Example: To select those from school A and D, you may want to use School == c('A', 'D’). This tests the 
# first element against A, the second against D, the third against A, and the fourth against D, and so on
painters[painters$School %in% c('A', 'D'), ] 

# Selecting variables from a data frame is also similar to selecting columns from a matrix by placing an  
# index vector on the right side of the comma (,) inside the []

# Example: To create a data set that contain the Colour (the third column) and School variables (the fifth column) 

d1 <- painters[ , c("School","Colour")]; head(d1)

d2 <- painters[, c(3,5)]; head(d2)


# You can also select observations and variables at the same time by including two index vectors inside
d5<-painters[painters$School == 'A', c('School','Colour')]; head(d5)
                   
# Subsetting Data Frames by Using subset() function
# Examples: Use AutoCollision data 
getwd()
install.packages("readr")
library(readr)
setwd("C:/Users/chris/OneDrive/Desktop/TeachingUChicago/Autumn2020/Data")
AutoColl <-read.csv("AutoCollision.csv")
head(AutoColl)

# - Subsetting ClaimServerity>=300 and ClaimCount>=10
head(subset(AutoColl,ClaimSeverity >=200 & ClaimCount>=10))
     
# - Subsetting ClaimServerity>=300 or ClaimCount>=10
head(subset(AutoColl,ClaimSeverity >=200 | ClaimCount>=10))
     
# - Subsetting ClaimSeverity >=300 without AgeGroup column  
head(AutoColl,AutoColl$ClaimSeverity>=300,select=-AgeGroup)
#head(AutoColl[AutoColl$ClaimSeverity>=300,c("ClaimSeverity","VehicleUse")])

subset(AutoColl,ClaimSeverity >=300,select=-AgeGroup) 
?subset
subset.data.frame(AutoColl, ClaimSeverity >=300,select=-c(ClaimCount,AgeGroup))

### 2. Merging ###
# Merge two datasets by an ID variable, where ID is the same for both datasets

data1 <- data.frame(ID=1:5, x=letters[1:5]); data1

data2 <- data.frame(ID=1:5, y=letters[6:10]); data2

data3 <- merge(data1, data2); data3

# Merge two datasets by an ID variable, where ID is not the same for both datasets

data4 <- data.frame(ID=1:5, x=letters[1:5]); data4

data5 <- data.frame(ID=4:8, y=letters[6:10]); data5

merge(data4, data5)

merge(data4, data5, all=T)

# Only keep the rows from the fist argument data4
merge(data4, data5, all.x=T)

# Only keep the rows from the second argument data5
merge(data4, data5, all.y=T)

# Merge two datasets by an ID variable, where both dataset have the same column names

data1 <- data.frame(ID=1:5, x=letters[1:5]); data1

data6 <- data.frame(ID=1:5, x=letters[6:10]); data6

# Add Rows
merge(data1, data6, all=T)

# Add columns
merge(data1, data6, by = "ID")

?merge

merge(data1, data6, by = "ID", suffixes=c(1,2))

# Merge two datasets by an ID variable, where the ID variable has a different name
data7 <- data.frame(ID1=1:5, x=letters[1:5]); data7

data8 <- data.frame(ID2=1:5, x=letters[6:10]); data8

merge(data7, data8, by.x = "ID1", by.y = "ID2")

### 5. Duplicates
# The function unique() will return a dataframe with the duplicate rows or columns removed. 
# NOTE: unique() only work for imported dataframes and doesn’t work for dataframes created during an R session
# Example:

getwd()
library(readr)
Dupdata <-read.csv("C:\\Users\\chris\\OneDrive\\Desktop\\TeachingUChicago\\Autumn2020\\Data\\DupedAutoColl.csv")
head(Dupdata)

str(Dupdata)        # Gives the structure of data
summary(Dupdata)
View(Dupdata)       # View imported data

NoDupdata<-unique(Dupdata)
NoDupdata    # Dataset with 3 duplicated rows removed: 32obs. of 4 variables

### Missing values

# R denotes data that is not available by NA. 
# Quantities that are not a number, such as 0/0, are denoted by NaN. 
# In R NaN implies NA (NaN refers to unavailable numeric data and NA refers to any type of unavailable data)

# How a function handles missing data depends on the function.
# Example:  mean() only ignores NAs if the argument na.rm=TRUE, whereas which() always ignores missing data.
x <- c(4, 7, 2, 0, 1, NA); mean(x)            
mean(x, na.rm=TRUE)                              
which(x>4)  

# Undefined or null objects are denoted in R by NULL. This is useful when we do not want to add row labels to a matrix. 
# Example:  
x <- matrix(1:6, ncol=2, dimnames=list(NULL, c("c.1", "c.2"))); x 


# Detecting Missing Data
# To test for missing data avoid using identical() and never use ==.; 
# Using identical() relies on unreliable internal computations and “==“ will always evaluate to NA or NaN.
# Functions used for detecting missing data:
# - is.na(x)      Tests for NA or NaN data in x
# - is.nan(x)     Tests for NaN data in x
# - is.null(x)    Tests if x is NULL 

# Example: 
x <- c(4, 7, 2, 0, 1, NA)
x==NA   
is.na(x)  

any(is.na(x)) 

(y <- x/0) 

is.nan(y)                                          

# Use na.omit() to remove missing data from a dataset 
# Use na.fail() to signal an error if a dataset contains NA
# Use complete.cases() returns a logical vector indicating which rows have no missing data

# Example:   
data <- data.frame(x=c(1,2,3), y=c(5, NA, 8));data
na.omit(data) # Remove all rows with missing data

# Use na.fail to test if a dataset is complete
na.fail(data)                 # Return an error message if missing data
sum(complete.cases(data))     # Get the number of complete cases
sum(!complete.cases(data))    # Get the number of incomplete cases


# Example

x <- 1:4
x>3
sum(x>3)      # Automatic conversion to numeric?vector; note TRUE = 1, FALSE = 0
is.vector(x)
is.numeric(x)
as.list(x)
as.numeric("123")

library(readr)
df <- read.csv('C:\\Users\\chris\\OneDrive\\Desktop\\TeachingUChicago\\Autumn2020\\Data\\AutoClaims.csv'); head(df)

# write.csv(df, file='ACSOut.csv')

df <- data.frame(df)
any(is.na(df)) # detect anywhere in df

any(is.na(df$AGE)) # anywhere in col

# delete selected missing data rows
df <- df[!is.na(df$Age), ]; df

# replace NAs with something else
df$col[is.na(df$col)] <- 999; df   # For a selected column
