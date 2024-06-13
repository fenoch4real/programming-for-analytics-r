#############################################################################
# Data Structures                                                           #
# 1. Vectors: A vector is an ordered collection of objects of the same type #
# 2. Matrices:        ?                                                     # 
# 3. Arrays: a multi-dimensional generalization of a vector                 #
# 4. Lists                                                                  # 
# 5. Dataframes                                                             #
#############################################################################

######################################################
# Data Frame Basics:                                 #
# 1. Some R built in Data Frames                     #
# 2. Importing and Exporting Data                    #
# 3. Creating Data Frames                            # 
# 4. Referencing Cells, Rows, and Columns            # 
#    Adding Rows and Columns, Setting Column Names   #
#    Selecting Multiple Rows and Columns             #
#    Selecting Multiple Columns                      #
######################################################

# Dataframes is one of the main tools for data analysis with R. Matrix inputs were limited 
# because all the data inside of the matrix had to be of the same data type (numerics, logicals, etc). 
# Dataframes can help to organize and mix data types to create a very powerful data structure.

# 1. Some R built in Data Frames:

# Dataframe about states
head(state.x77,10)

data <- data.frame(state.x77)          # Convert to a dataframe                      
head(data)
tail(data)                             # Print the first / last few rows of a dataset/matrix
names(data)
colnames(data)                         # Column names
rownames(data)                         # Row names
dim(data)                              # Dimension of the dataframe
str(data)
summary(data)
data[,c("Population", "Income")]       # "Population" and "Income" columns
data$Area                              # Get the column "Area"
data[1:5,]                             # Get the first five rows

# US personal expense
USPersonalExpenditure

# Women 
women

# To get a list of all available built-in dataframes: Data sets in package ‘datasets’
data()

# Working with Data Frames

# Use variable assignment to save typing

st <- state.x77

head(st,5)
tail(st)

# Data Frame - Overview of information

# Use the str() to get the structure of a dataframe of variable names and data types:

str(st)
str(women)

# Use summary() to get a quick statistical summary of all the columns of a DataFrame: 

summary(st)

# 2.Importing and Exporting Data  

getwd()
setwd("C:\\Users\\chris\\OneDrive\\Desktop\\TeachingUChicago\\Autumn2020\\Data")

### CSV Input and Output ###

# CSV stands for Comma Separated Variable. 
# The basic format of a csv file is the first line indicating the column names 
# and the rest of the rows/lines being data points separated by commas.
# One of the most basic ways to read in csv files in R is to use read.csv() which is built-in to R. 

# When using read.csv() you'll need to either pass in the entire path of the file 
# or have the file be in the same directory as your R script. 
# Make sure to account for possible spaces in the file path name, you may need to use backslashes to account for this. 

# Pass in the entire file path if not in same directory
ex <- read.csv('example.csv'); ex

# Check structure
str(ex)

# Check column names
colnames(ex)

df <- data.frame(ex); df
head(df)

help(read.csv)

# read.table: the read.table() function is the general form of read.csv, in fact read.csv is actually 
# just a thin wrapper around read.table which just makes it easier to use sometimes. 

# Example:
  
read.table('example.csv')

read.table(file = 'example.csv', sep = ',')

write.csv(df, file = "foo.csv")

install.packages("tidyverse")
library(tidyverse)
library(readr)
khc<- read.csv("KaggleHealthcareNoshows.csv")
str(khc)      # Gives the structure of data
View(khc)

## or without row names
### Alternatively
write.csv(df, file = "foo2.csv",row.names = FALSE)
read.csv('foo2.csv', row.names=1)

# Output to csv
write.csv(df, 'ACOut.csv')

# For csv file, install readr package:
# install.packages("readr")
# library(readr)
df3 <- read_csv('AutoCollSubset.csv'); df3
View(df3)
write_csv(df3, 'ACSOut.csv')

??readr

# Row and columns counts
nrow(df)
ncol(df)

# Column Names
colnames(df)

# Row names (may just return index)
rownames(df)


### Excel Files with R ###
# R has the ability to read and write to excel
# Note: The excel file used for the notes has a lot of NA values

install.packages('readxl')

# In case you don't have readxl (you may not need to specify repos)
#install.packages('readxl',repos="http://cran.rstudio.com/")
# Load the readxl package
search()
library(readxl)

Testxlsx <- read_xlsx("C:/Users/chris/OneDrive/Desktop/TeachingUChicago/Autumn2020/Data/AutoCollision.xlsx",sheet=1)
View(Testxlsx)

Testxls <- read_xls("C:/Users/chris/OneDrive/Desktop/TeachingUChicago/Autumn2020/Data/AutoCollision.xls")
View(Testxls)

# list the sheets of the excel file
excel_sheets('Sample-Sales-Data.xlsx')

# Call info from the sheets using read_excel
df <- read_excel('Sample-Sales-Data.xlsx',sheet='Sheet1'); df
View(df)
head(df)
sum(df['Value'])
str(df)
summary(df)

df <- read_excel('AutoCollision.xlsx',sheet='AutoCollision') 
View(df)


# If having multiple sheets to import into a list, you could do this with lapply():
  
entire_workbook <- lapply(excel_sheets("Sample-Sales-Data.xlsx"), 
                          read_excel, 
                          path = "Sample-Sales-Data.xlsx")
# Show entire list:
entire_workbook

# Writing to excel requires the xlsx package:
  
install.packages('xlsx',repos="http://cran.rstudio.com/")
library(xlsx)

install.packages("openxlsx")
library(openxlsx)
df <- data.frame(matrix(1:10));df
write.xlsx(df, "output.xlsx")
check <- read_excel('output.xlsx')
View(check)


## SQL with R:
# connecting R to a SQL database is completely dependent on the specific type of database: MYSQL, Oracle, etc...
# So we will point you in the right direction for various database types, once you've downloaded the correct library, 
# actually connecting is usually quite simple, then its just a matter of passing in SQL queries through R.

# RODBC - General Use
# The RODBC library is one way of connecting to databases. Regardless of what you decide to use, 

# An example use of RODBC

install.packages("RODBC") 
# RODBC Example of syntax
library(RODBC)

myconn <-odbcConnect("Database_Name", uid="User_ID", pwd="password")
dat <- sqlFetch(myconn, "Table_Name")
querydat <- sqlQuery(myconn, "SELECT * FROM table")
close(myconn)


# 3. Create data frames 
# Create data frames using the data.frame() function and pass vectors as arguments,
# which will then convert the vectors into columns of the data frame. 

# A simple Example:

empty <- data.frame()                               # empty data frame
c1 <- 1:10                                          # vector of integers
c2 <- letters[1:10]                                 # vector of strings
df <- data.frame(col.name.1=c1,col.name.2=c2)
df

# Example: weather data
weekdays <- c('mon','tue','wed','thu','fri'); weekdays
temp <- c(11,12,20,21,15); temp
wind <- c(TRUE, TRUE, FALSE, FALSE, TRUE); wind

# Pass in the vectors
df <- data.frame(weekdays,temp,wind)
df


# 4.Referencing Cells, Rows, and Columns ###
# Use the same bracket notation as matrices
# Use two sets of brackets for a single cell and a single set of brackets for multiple cells.


##  df[rows,columns]

# Everything from first row
df[1,]

# Everything from first column
df[,1]

# Grab Friday data
df[5,]

# Select by using column names instead of having to remember numbers
# Example:

# All rain values
df[,'rain']

# First 5 rows for days and temps
df[1:5,c('days','temp')]

# Select a particular column by using the dollar sign directly after the dataframe as follows:

# df.name$column.name

df$rain

df$days

# 2) Use bracket notation to return a data frame format of the same information:

df['rain']

df['days']

# Filter with a subset condition: Use the subset() function to grab a subset of values 

# Example: Pull the days where it rained (rain=True):

subset(df,subset=rain==TRUE)

# Pull days where the temperature was greater than 23:

subset(df,subset= temp>23)

# Odering a Data Frame: Sort the order of our data frame by using the order() function. 

# Example: Sort by the temperature:
sorted.temp <- order(df['temp'])
df[sorted.temp,]

# Those index elements were ordered (by default ascending, sue a negative sign to do descending order):

desc.temp <- order(-df['temp'])
df[desc.temp,]

# OR, used the other column selection methods:

sort.temp <- order(df$temp)
df[sort.temp,]


# Example:
  
vec <- df[[5, 2]];     vec     # get a cell by [[row,col]] num
newdf <- df[1:5, 1:2]; newdf   # get multiplt cells in new df



# df[[2, 'AgeGroup']] <- 99999  # reassign a single cell
df[[2, 'AgeGroup']]

# Referencing Rows: [row,]

# returns a data frame (and not a vector!)
rowdf <- df[1, ]; rowdf

# to get a row as a vector, use following
vrow <- as.numeric(as.vector(df[1,]))
vrow


# Referencing Columns 

cars <- mtcars
head(cars)

colv1 <- cars$mpg      # returns a vector
colv1

colv2 <- cars[, 'mpg'] # returns vector
colv2

colv3<- cars[, 1] # a is int or string
colv3

colv4 <- cars[['mpg']] # returns a vector
colv4

# Ways of Returning Data Frames
mpgdf <- cars['mpg'] # returns 1 col df
head(mpgdf)

mpgdf2 <- cars[1] # returns 1 col df
head(mpgdf2)

# Adding Rows
# Both arguments are DFs
df2 <- data.frame(col.name.1=2000,col.name.2='new' )
df2

# Setting Column Names
# Rename second column
colnames(df2)[2] <- 'SECOND COLUMN NEW NAME'
df2

# Rename all at once with a vector
colnames(df) <- c('col.name.1', 'col.name.2', 'newcol', 'copy.of.col2' ,'col1.times.2')
df

# Selecting Multiple Rows
first.ten.rows <- df[1:10, ] # Same as head(df, 10)
first.ten.rows

everything.but.row.two <- df[-2, ]
everything.but.row.two

# Conditional Selection
sub1 <- df[ (df$col.name.1 > 8 & df$col1.times.2 > 10), ]
sub1

sub2 <- subset(df, "col.name.1" > 8 & "col1.times.2" > 10)
sub2

# Selecting Multiple Columns
df[, c(1, 2, 3)] # Grab cols 1 2 3

df[, c('col.name.1', 'col1.times.2')] # by name

df[, -1] # keep all but first column

df[, -c(1, 3)] # drop cols 1 and 3

# Attaching a File Using attach()
ds <- read_csv ("KaggleHealthcarenoshowstest.csv",skip=0)
View(ds)

head(ds)
mean(ds$Age)         # Average Age
search()             # Search path

attach(ds)          # Attach dataset
search()            # If R can find ds in the global environment

mean(Age)           # Average Age
detach(ds)          # Detach dataset
search()            # Check if ds is not in the global environment

