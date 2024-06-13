###############################################################################
# Week 5 Quiz
###############################################################################

##############
#  For Loop  #
##############

# Exercise 1: Iterate over all the elements of the course vector and print
course <- c('Linear Algebra', 'Programming for Analytics', 'Machine Learning')
for(val in course){
  print(val)
}


# Exercise 2: Iterate by using x between 1 and 4 over x^3 and store it in a list
# Hint: Create an empty list first: list <- c()

x<- c(1:4)
list <- c()
for(val in 1:length(x)){
  list[[val]]  <- x^3
}
list

# Exercise 3: Calculate the sum of the first 100 squares.

x<- c(1:100)
for(val in 1:length(x)){
  y <- y + (val*val)
}
y


# Exercise 4: Use a for loop to estimate the average of the results of 1000 rolls 
# of a die (6 sides).

mean(pbinom(10,1000,0.1666))


# Exercise 5: Use a for loop over the following matrix to show the values of each 
# combination of rows and columns: 
mat <- matrix(data = seq(10, 15, by=1), nrow = 3, ncol =2)

# Create the loop with r and c to iterate over the matrix
x <- 1
y <- 1
xl <- dim(mat)[1]
yl <- dim(mat)[2]
mat
for(x in 1:xl){
  for (y in 1:yl){
    print(mat[x,y])
  }
}

# Exercise 6: Use a for loop to calculate the sum and the sum of squares in c(20,21,22) 

v <- c(20,21,22)
z <- 0
for(i in 1:length(v)){
 z <- z + (v[i]*v[i])
}
z


# Exercise 7: Use a for loop to count the number of even numbers in a vector.

v <- c(1:10)
z <- 0
for(val in 1:10){
  if(v[val]%% 2 == 0){
    z <- z + 1
  }
}
z

################
#  Subsetting  #
################

# We will use the data set, painters, from the MASS library for the following questions
library(MASS) 
head(painters) 
attach(painters)

# Exercise 8: Select the observations of painters with Expression greater than 4

painters %>% filter(Expression > 4)

# Exercise 9: Use two ways to create a data set that contain the Drawing (the second 
# column) and Expression (the fourth column)
#Method 1
mydrawing <- painters %>% dplyr::select(Drawing)
mydrawing
myexpression <- painters %>% dplyr::select(Expression)
myexpression
head(merge(mydrawing,myexpression))

#Method 2
myData <- painters %>% dplyr::select(Drawing, Expression)
head(myData)
# Exercise 10: Use subset() function to subset Composition >=12 without Expression column  
subset(painters,Composition >= 12)
