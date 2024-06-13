# Ex 1) Recreate the following dataframe by creating vectors and using the data.frame function:
  
Name <- c("sandy","zoey","peter")
Age <- c(7,0.2,2)
Weight <- c(35,4.5,20)
Sex <- c("M", "M", "F")
  
df <- data.frame (row.names = Name, Age, Weight, Sex)
df
  
# Ex 2) Check if mtcars is a dataframe using is.data.frame()
  
is.data.frame(mtcars)
  
# Ex 3) Use as.data.frame() to convert a matrix into a dataframe:
    
mat <- matrix(1:10,nrow = 5)
  
as.data.frame(mat)
  
  
# Ex 4. Set the built-in data frame mtcars as a variable df. We'll use this df variable for the rest of the exercises.

df <- mtcars

# Ex 4.1) Display the first 3 rows of df

head(df)


# Ex 4.2) What is the average mpg value for all the cars?

mean(mtcars$mpg)

# Ex 4.3) Select the rows where all cars have 4 cylinders (cyl column)

df[df$cyl==4,]


# Ex 4.4) Select the columns hp and wt

df[,c('hp','wt')]

# Ex 4.5) Create a new column called performance, which is calculated by hp/wt.

df$performance <- df$hp/df$wt
head(df)

# Ex 4.6) What is the average mpg for cars that have less than 110 hp AND a wt value of more than 3?

mean(subset(df,hp<110 & wt > 3)$mpg)

# Or, 
mean(df[df$hp < 110 & df$wt > 3,]$mpg)

# Ex 4.7) What is the performance of the Mazda RX4?
  
df['Mazda RX4',]$performance
