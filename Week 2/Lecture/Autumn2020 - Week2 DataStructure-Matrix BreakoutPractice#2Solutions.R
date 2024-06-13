#########################
### Creating a Matrix ###
#########################


# 1). Create sequential numeric vectors from 5 to 10 and use the colon notation from slicing to create sequential vectors:

5:10
seq(5,10)
v <- 5:10; v


# Use v and the matrix() function to create a matrix: 

matrix(v)
# Use v to create a matrix with 2 rows:
matrix(v,nrow=2,byrow=FALSE)

# 2) Combine bank and ins to stocks to a vector
bank <- c(358,459,482,425,411)
ins <- c(230,231,232,236,228)
stocks <- c(bank,ins)

# Combine bank and ins to stocks2 to two columns

stocks2 <- cbind(bank,ins);stocks2

# Combine bank and ins to stocks3 to two rows
stocks3 <- rbind(bank,ins);stocks3

# Use stocks to create a matrix with 2 rows:

stocks.max <- matrix(stocks,nrow=2); stocks.max

# 3) Matrix Arithmetic performs element by element mathematical operations on a matrix with a scalar (single number) just like we could with vectors

mat <- matrix(1:50,byrow=TRUE,nrow=5); mat

# Addition to itself
mat+mat

# Multiplication to iteself
mat*mat

# Division (reciprocal)
1/mat

# Division by itself
mat/mat


# 4) Matrix arithmetic 

mat2 <- matrix(1:9, nrow=3); mat2

# Grab first row
mat2[1,]

# Grab first column
mat2[,1]

# Grab first 3 rows
mat2[1:3,]

# Grab top left rectangle of:
mat2[1:2,1:2]

# Grab last two columns
mat2[,2:3]


#####################################
#  Factor and Categorical Matrices  #
#####################################

# The factor() function and its use for creating categorical matrices and known as creating dummy variables.

pets <- c('dog','at','dog','cat','cat')

# Use the factor() function and animal to create a vector named as factor.ani:

factor.pets <- factor(pets)
factor.pets

# Use the factor() function and height to create Ordinal categorical variables (as the name implies) do have an order. 
height <- c('low','med','high','med','high','high','low')

fact.height <- factor(height,ordered=TRUE,levels=c('low','med','high')); fact.height 

# Compare the outputs from summary(height) vs summary(fact.height)
summary(height)
summary(fact.height)