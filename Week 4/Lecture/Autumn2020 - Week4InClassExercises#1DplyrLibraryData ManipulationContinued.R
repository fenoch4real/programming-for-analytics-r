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
# 8. Pipe Operator
####################################################################


### Installing ###

install.packages('dplyr')
library(dplyr)

install.packages('magrittr')
library(magrittr)

# Example: use some flight data
# We'll download the nycflights13 data package:

install.packages('nycflights13',repos = 'http://cran.us.r-project.org')
library(nycflights13)
summary(flights)
View(flights)
                                      
# Notice how large the data frame is:
dim(flights)

# 1. filter() allows you to select a subset of rows in a data frame. 
# The first argument is the data frame name, second and subsequent arguments are 
# the expressions that filter the data frame:
  
# Example: select all flights on November 3rd that were from American Airlines (AA) with:
head(flights)

head(filter(flights,month==11,day==3,carrier=='AA'))

# Comparing with the normal way to do this with a dataframe:
  
head(flights[flights$month == 11 & flights$day == 3 & flights$carrier == 'AA', ])

# Exercise: pull the column year =2013  month==10
head(filter(flights,year==2013 & month==10))

# slice() can select rows by position using slice()

slice(flights, 100:120)

# 2. arrange() works similarly to filter() except that instead of filtering or selecting rows, it reorders them. 
# It takes a data frame, and a set of column names (or more complicated expressions) to order by. 
# If you provide more than one column name, each additional column will be used to break ties in the values of 
# preceding columns:
  
head(arrange(flights,year,month,day,arr_time))

# add desc() to arrange in descending order:
  
head(arrange(flights,desc(dep_delay)))

# Exercise: dep_time, arr_time, then flight at a descedning order
head(arrange(flights, desc(flight)),9)


# 3. select(): work with large datasets with many columns but only a few are actually of interest to you. 
# select() allows you to rapidly zoom in on a useful subset using operations that usually only work on 
# numeric variable positions:
  
head(select(flights,carrier, dest))

# rename() renames columns, note this is not "in-place" you'll need to reassign the renamed data structures.

head(rename(flights,airline_car = carrier))
?rename

# 4. distinct(): A common use of select() is to find the values of a set of variables. This is particularly 
# useful in conjunction with the distinct() verb which only returns the unique values in a table.

distinct(select(flights,year,carrier, dest))

# 5. mutate(): Besides selecting sets of existing columns, it’s often useful to add new columns that are 
# functions of existing columns. This is the job of mutate():

head(mutate(flights, new_col = arr_delay-dep_delay))


# transmute(): Use transmute if you only want the new columns:

head(transmute(flights, new_col = arr_delay-dep_delay))

# 6. summarise(): use summarise() to quickly collapse data frames into single rows using functions that 
# aggregate results. Remember to use na.rm=TRUE to remove NA values.

summarise(flights,avg_air_time=mean(air_time,na.rm=TRUE))

summarise(flights,avg_air_time=mean(air_time,na.rm=TRUE), avg_sched_arr_time=mean(sched_arr_time,na.rm=TRUE))


# 7. sample_n() and sample_frac() to take a random sample of rows: use sample_n() for a fixed number 
# and sample_frac() for a fixed fraction.

sample_n(flights,3)

# 20% of the data
sample_frac(flights,0.2) # USE replace=TRUE for bootstrap sampling


# 8. Pipe Operator

library(magrittr) # need to run every time you start R and want to use %>%
library(dplyr)    # alternative, this also loads %>%

df <- mtcars

# Nested
df<-mtcars
sample_n(filter(df,mpg>20), size=5)
result <- arrange(sample_n(filter(df,mpg>20), size=5),desc(mpg))
print(result)

# Multiple Assignments
a <- filter(df,mpg>20)
b <- sample_n(a,size=5)
result <- arrange(b,desc(mpg)); print(result)


# Use Pipe Operator
# DataName %>% operator1 %>% operator2 %>% operator3
result <- df %>% 
  filter(mpg>20) %>% 
  sample_n(size=5) %>% 
  arrange(desc(mpg))
print(result)


## magrittr

# Option 1 - Nested Option
arrange(
  summarize(
    group_by(
      filter(mtcars, carb > 1),
      cyl
    ),
    Avg_mpg = mean(mpg)
  ),
  desc(Avg_mpg)
)

# Option 2 - Multiple Object Option:
data(mtcars)
attach(mtcars)
a <- filter(mtcars, carb > 1); a
b <- group_by(a, cyl); b
c <- summarise(b, Avg_mpg = mean(mpg)); c
d <- arrange(c, desc(Avg_mpg))
print(d)

# Option 3 - %>% Option:

mtcars %>%
  filter(carb > 1, mpg>20) %>%
  group_by(cyl) %>%
  summarise(Avg_mpg = mean(mpg)) %>%
  arrange(desc(Avg_mpg)) 

# Example, we can pipe into a linear regression function and then get the summary of 
# the regression parameters. Note in this case insert “data = .” into the lm() function. 
# When using the %>% operator the default is the argument that you are forwarding 
# will go in as the first argument of the function that follows the %>%. 
mtcars
mtcars %>%
  filter(carb > 1) %>%
  lm(mpg ~ cyl + hp, data = .) %>%
  summary()


# Additional Functions. In addition to the %>% operator, magrittr provides several additional 
# functions which make operations such as addition, multiplication, logical operators, 
# re-naming, etc. more pleasant when composing chains using the %>% operator. Some examples follow:

# subset with extract:   
mtcars %>%  
  subset(, 1:4) %>% 
  head

# add, subtract, multiply, divide:  
mtcars %>% 
subset(, "mpg") %>% 
  multiply_by(5) %>%
  head

# logical assessments and filters:  
mtcars %>% 
subset(, "cyl") %>% 
  equals(4)

# renaming columns and rows:  
mtcars %>%
head %>%
  set_colnames(paste("Col", 1:11, sep = ""))


# Additional Pipe Operators: The compound assignment %<>% operator is used to update 
# a value by first piping it into one or more expressions, and then assigning the result. 

# Example: Let’s say you want to transform the mpg variable in the mtcars data frame to a square root 
# measurement. Using %<>% will perform the functions to the right of %<>% and save the changes these 
# functions perform to the variable or data frame called to the left of %<>%.
# Note that mpg is in its typical measurement
head(mtcars)
mtcars$mpg %<>% sqrt
head(mtcars)


# The Exposition (%$%) Operator is useful when you want to pipe a dataframe, 
# which may contain many columns, into a function that is only applied to some of the columns. 

# Example, the correlation (cor) function only requires an x and y argument so if you pipe the mtcars data into 
# the cor function using %>% you will get an error because cor doesn’t know how to handle mtcars. However, 
# using %$% allows you to say “take this dataframe and then perform cor() on these specified columns within mtcars.”

# regular piping results in an error
mtcars %>%
  subset(vs == 0) %>%
  cor(mpg, wt)

# using %$% allows you to specify variables of interest
mtcars %>%
  subset(vs == 0) %$%
  cor(mpg, wt)


