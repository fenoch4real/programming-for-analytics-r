####################################################################
############ Introduction to dplyr (data manipulation) #############
# For analytics, the following functions are useful for analytics
# 1. filter() (and slice())
# 2. arrange()
# 3. select() (and rename())
# 4. distinct()
# 5. mutate() (and transmute())
# 6. summarise()
# 7. sample_n() and sample_frac()
####################################################################


### Installing ###

install.packages('dplyr')
library(dplyr)

# Example: use some flight data
# We'll download the nycflights13 data package:

install.packages('nycflights13',repos = 'http://cran.us.r-project.org')
library(nycflights13)
data()
data(flights)
summary(flights)
                                      
# Notice how large the data frame is:
dim(flights)

# 1. filter() allows you to select a subset of rows in a data frame. 
# The first argument is the data frame name, second and subsequent arguments are the expressions that filter the data frame:
  
# Example: select all flights on November 3rd that were from American Airlines (AA) with:
  
head(filter(flights,month==11,day==3,carrier=='AA'),3)

# Comparing with the normal way to do this with a dataframe:
  
head(flights[flights$month == 11 & flights$day == 3 & flights$carrier == 'AA', ],3)

# slice() can select rows by position using slice()

slice(flights, 3:10)

# 2. arrange() works similarly to filter() except that instead of filtering or selecting rows, it reorders them. 
# It takes a data frame, and a set of column names (or more complicated expressions) to order by. 
# If you provide more than one column name, each additional column will be used to break ties in the values of 
# preceding columns:
  
head(arrange(flights,year,month,day,air_time),5)

# add desc() to arrange in descending order:
  
head(arrange(flights,desc(dep_delay)))

# 3. select(): work with large datasets with many columns but only a few are actually of interest to you. 
# select() allows you to rapidly zoom in on a useful subset using operations that usually only work on 
# numeric variable positions:
  
head(select(flights,carrier))

# rename() renames columns, note this is not "in-place" you'll need to reassign the renamed data structures.

head(rename(flights,airline_car = carrier))
?rename

# 4. distinct(): A common use of select() is to find the values of a set of variables. This is particularly 
# useful in conjunction with the distinct() verb which only returns the unique values in a table.

distinct(select(flights,carrier))

# 5. mutate(): Besides selecting sets of existing columns, it’s often useful to add new columns that are 
# functions of existing columns. This is the job of mutate():

flights2<-mutate(flights, new_col = arr_delay-dep_delay); 
flights2[,c('arr_delay','dep_delay', 'new_col')]
flights2$new_col

# transmute(): Use transmute if you only want the new columns:

head(transmute(flights, new_col = arr_delay-dep_delay))

# 6. summarise(): use summarise() to quickly collapse data frames into single rows using functions that 
# aggregate results. Remember to use na.rm=TRUE to remove NA values.

summarise(flights,avg_air_time=mean(air_time,na.rm=TRUE))

# 7. sample_n() and sample_frac() to take a random sample of rows: use sample_n() for a fixed number 
# and sample_frac() for a fixed fraction.

sample_n(flights,10)

# .5% of the data
sample_frac(flights,0.005) # USE replace=TRUE for bootstrap sampling
