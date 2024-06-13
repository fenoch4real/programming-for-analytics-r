#############################################################################
# Data Structures                                                           #
# 1. Vectors: A vector is an ordered collection of objects of the same type #
# 2. Matrices:                                                              # 
# 3. Arrays                                                                 #
# 4. Lists                                                                  # 
# 5. Dataframes                                                             #
#############################################################################

#########################################################################################################
# Matrix: A matrix is just a two-dimensional generalization of a vector                                 #
# To create a matrix, matrix(data=NA, nrow=1, ncol=1, byrow = FALSE, dimnames = NULL)                   #
# - data:  a vector that gives data to fill the matrix; if data does not have enough elements to fill   #
# the matrix, then the elements are recycled                                                            #
# - nrow: desired number of rows; ncol: desired number of columns                                       #
# - byrow: if FALSE (default) matrix is filled by columns, otherwise by rows                            #
# - dimnames: (optional) list of length 2 giving the row and column names respectively, list            #
# names will be used as names for the dimensions                                                        #
#########################################################################################################

####################
# Create a Matrix  #
####################

M <- seq(1:20); M

matrix(M)

matrix(M, nrow = 4)

matrix(M, byrow = FALSE, nrow=4)

matrix(M, byrow = TRUE, nrow=4)

x <- matrix(c(5,0,6,1,3,5,9,5,7,1,5,3), nrow=3, ncol=4, byrow=TRUE,
              dimnames=list(rows=c("r.1", "r.2", "r.3"),cols=c("c.1", "c.2", "c.3", "c.4")))
x

#### Creating Matrices from Vectors: combine vectors into a matrix
winter.temps <- c(31, 32, 34, 35, 32, 29, 27)
summer.temps <- c(78, 76, 81, 84, 81, 88, 89)

temps <- c(winter.temps, summer.temps); temps

temps.matrix <- matrix(temps,byrow=TRUE,nrow=2); temps.matrix


#### Naming Matrices: Like the names() function for vectors, the colnames() and rownames() functions for matrix

days <- c('Mon','Tue','Wed','Thu','Fri', 'Sat', 'Sun')

season.names <- c('winter.temps','summer.temps')

colnames(temps.matrix) <- days
rownames(temps.matrix) <- season.names

temps.matrix

colSums(temps.matrix)
rowSums(temps.matrix)

colMeans(temps.matrix)
rowMeans(temps.matrix)

# Exercise: Use the following two vectors to create a matrix

StockA <- c(100,95,90,85,80)
StockB <- c(50,45,40,35,30)


#### Matrix Arithmetic is element by element mathematical operations on a matrix with a scalar (single number) just like vectors. 
# Examples:
M

matrix1 <- matrix(M, byrow = TRUE, nrow = 4); matrix1

# Multiplication
200*matrix1

# Reciprocal
1/matrix1

# Division
matrix1/2

# Power
matrix1 ^ 2

# Modular
matrix1%%3

# Exponential
exp(matrix1)


#### Matrix Comparison operators: comparison operations across an entire matrix to return a matrix of logicals:
  
matrix1 > 12

#### Matrix Arithmetic with multiple matrices

matrix1 + matrix1

matrix1 - matrix1

matrix1 * matrix1

matrix1 / matrix1

matrix1 ^ matrix1


#############################################
# Referencing Elements of a Matrix  Method 1 
#############################################
x <- matrix(c(5,0,6,1,3,5,9,5,7,1,5,3), nrow=3, ncol=4, byrow=TRUE,
            dimnames=list(rows=c("r.1", "r.2", "r.3"),cols=c("c.1", "c.2", "c.3", "c.4")))
x

x[2,3]      # Row 2, Column 3
x[1,]       # Row 1
x[,2]       # Column 2
x[c(1,3),]  # Rows 1 and 3, all Columns

# Exercise: Rows 1 and 3 , Columns 1 and 3



#############################################
# Referencing Elements of a Matrix Method 2 
#############################################
N <- matrix(c(5,8,3,0,4,1), nrow=2, ncol=3, byrow=TRUE); N

colnames(N) <- c("c.1", "c.2", "c.3"); N

N[,"c.2"]   # Column named "c.2"

colnames(N)

rownames(N) <- c("r.1", "r.2"); N

N["r.1",]   # row named "r.1"

rownames(N)


M <- diag(2); M
?diag
?cbind
N

(MN <- cbind(M, N))    # Placing the expression in parentheses
MN[,2]                 # Column 2
MN[,"c.2"]             # Column named "c.2"

O<- diag(3); O
NO <- rbind(N,O); NO

rownames(NO) <- c("r.1", "r.2","r.3","r.4","r.5"); NO

# Exercise: Combine H and x
H <-diag(4); H
x


##############################################################################################
# Matrix Operations: 
# When matrices are used in math expressions *, the operations performes element by element.
# For matrix multiplication use the %*% operator
# If a vector is used in matrix multiplication, it will be coerced to either a row or column 
# matrix to make the arguments conformable. Using %*% on two vectors will return the inner 
# product (%o% for outer product) as a matrix and not a scalar. 
# Use either c() or as.vector() to convert to a scalar.
##############################################################################################

A <- matrix(1:4, nrow=2); A
B <- matrix(5:8, nrow=2, ncol=2); B
A*B
A%*%B

y <- 1:3; y
y*y
y%*%y
c(y%*%y)
A/(y%*%y)
A/c(y%*%y)

# We can use the cbind() to bind a new column, and rbind() to bind a new row

spring.temps <- c(58, 56, 51, 54, 51, 58, 59)
three.temps <- rbind(temps.matrix, spring.temps); three.temps

# Add an average column to the matrix
avg <- round(rowMeans(three.temps),0); avg

three.temps <- cbind(three.temps,avg); three.temps

# Exercise: Add a max column to the matrix
max<- max(three.temps); max

#### Matrix Indexing and Slicing: use the square bracket notation to select elements from a matrix
#### for the two dimensions, use a comma to separate our indexing for each dimension.

### Example: matrix[rows,columns]

mat1 <- matrix(1:64,byrow=TRUE,nrow=8); mat1

# Grab first row
mat1[1,]

# Grab first column
mat1[,1]

# Grab first 3 rows
mat1[1:3,]

# Grab top left rectangle of:

mat1[1:2,1:8]

# Grab last 4 columns
mat1[,5:8]

# Grab a square with 4 elements:

mat1[2:3,5:6]


#### factor() to create Categorical Matrices

# The factor() function and its use for creating categorical matrices and dummy variables.

# Example:

dogs <- c('sandy','zoey','blair','peter'); dogs
gender <- c('F','F','F','M');gender

factor.dogs <- factor(dogs)
factor.gender<-factor(gender)

# Will show levels
factor.dogs
factor.gender

# In R there are two distinct types of categorical variables, a ordinal categorical variable and a nominal categorical variable

# Nominal categorical variables don't have any order like animal: 

gender <- c('F','F','F','M');gender

# Ordinal categorical variables: assign order, such as: p0 < p2 < p4 < p6
  
clothes.size <- c('p0','p2','p4','p6')

clothes <- c('p0','p6','p0','p2','p2','p4','p2')
factor.clothes <- factor(clothes,ordered=TRUE,levels=c('p0','p2','p4','p6')); factor.clothes

summary(clothes)

summary(factor.clothes)


######################################################################################################
# The apply() function is used for applying functions to the margins of a matrix, array, or dataframes                                                                            
# apply(X, MARGIN, FUN, ...)
# - X: A matrix, array or dataframe
# - MARGIN: Vector of subscripts indicating which margins to apply the function to 
# 1=rows, 2=columns, c(1,2)=rows and columns
# - FUN Function to be applied
# - ... Optional arguments for FUN
# You can also use your own function (more on this later)
#####################################################################################################

x <- matrix(1:12, nrow=3, ncol=4); x
apply(x, 1, sum)         # Row totals
apply(x, 2, mean)        # Column means
?apply

x <- matrix(1:18, nrow=3, ncol=6); x
apply(x, 1, max)         # Row max
apply(x, 2, median)      # Column median     

getwd()
setwd("C:/Users/chris/OneDrive/Desktop/TeachingUChicago/Autumn2020/Week2/CanvasNotes")


