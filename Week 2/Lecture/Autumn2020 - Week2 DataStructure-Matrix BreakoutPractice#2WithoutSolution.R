#########################
### Creating a Matrix ###
#########################


# 1). Create sequential numeric vectors from 5 to 10 and use the colon notation from slicing to create sequential vectors:



# Use v and the matrix() function to create a matrix: 

matrix(v)
# Use v to create a matrix with 2 rows:

# 2) Combine bank and ins to stocks to a vector
bank <- c(358,459,482,425,411)
ins <- c(230,231,232,236,228)


# Combine bank and ins to stocks2 to two columns



# Combine bank and ins to stocks3 to two rows



# Use stocks to create a matrix with 2 rows:



# 3) Matrix Arithmetic performs element by element mathematical operations on a matrix with a scalar (single number) just like we could with vectors

mat <- matrix(1:50,byrow=TRUE,nrow=5); mat

# Addition to itself


# Multiplication to iteself


# Division (reciprocal)


# Division by itself



# 4) Matrix arithmetic 



# Grab first row


# Grab first column


# Grab first 3 rows


# Grab top left rectangle of:


# Grab last two columns



#####################################
#  Factor and Categorical Matrices  #
#####################################

# The factor() function and its use for creating categorical matrices and known as creating dummy variables.

pets <- c('dog','at','dog','cat','cat')

# Use the factor() function and pets to create a vector named as factor.pets:



# Use the factor() function and height to create Ordinal categorical variables (as the name implies) do have an order. 
height <- c('low','med','high','med','high','high','low')



# Compare the outputs from summary(height) vs summary(fact.height)
