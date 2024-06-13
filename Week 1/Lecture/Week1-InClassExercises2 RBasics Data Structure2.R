#############################################################################
# R Basics 2: Data Structures                                               #
# 1. Vectors: A vector is an ordered collection of objects of the same type #
# 2. Matrices:                                                              # 
# 3. Arrays                                                                 #
# 4. Lists                                                                  # 
# 5. Dataframes                                                             #
#############################################################################

#################################################################
# A vector is an ordered collection of objects of the same type #
# A vector is a 1 dimensional array that can hold character,    # 
# numeric, or logical data elements.                            # 
# Create a vector by using the combine function c().            # 
# To use the function, pass in the elements in the array,       #  
# with each individual element separated by a comma.            #
#################################################################

# Using c() to create a vector of numeric elements

v1 <- c(2.5, 4, 7.3, 0.1); v1; class(v1)

# Vector of characters
v2 <- c("A", "B", "C", "D"); v2; class(v2)

#: Sequence of integers
v3 <- -3:3; v3

# seq() General sequence
seq(0, 2, by=0.333); seq(0, 2,len=6); 
x = c(0,5,7,9,1,2,8);  mean(x)
?seq

# rep() Vector of replicated elements
rep(1:5, each=2); 
rep(1:5, times=2)
?rep


#################################################################
# Vector Names - use the names() function to assign names to    #
# each element in our vector                                    #
#################################################################

# Example, vector of a week of temperatures:
temps <- c(32,31,38,33,39,35,31); temps

# Assign the elements with names 
names(temps) <- c('Mon','Tue','Wed','Thu','Fri','Sat','Sun'); temps

# Example: use simple use a variable name as a names() assignment:
days <- c('Mon','Tue','Wed','Thu','Fri','Sat','Sun')
temps2 <- c(1,2,3,4,5,6,7)
names(temps2) <- days
temps2


#####################################################################
# Vector Operations - basics arithmetic with vectors and operations #
# will occur on an element by element basis                         #
#####################################################################

# Example:
v1 <- c(31,32,33)
v2 <- c(65,66,67)

# Adding Vectors
v1+v2

# Subtracting Vectors
v1-v1
v1-v2

# Multiplying Vectors
v1*v2

# Dividing Vectors
v1/v2

###############################################################################
# Functions with Vectors - some useful functions that we can use with vectors #
# A function will be in the form: name_of_function(input)                     #
###############################################################################

# Example:

v1; sum(v1)

v <- c(12,45,100,2); sd(v)
var(v)
max(v)
min(v)

# Product of elements
prod(v1)
prod(v)


################################################################################
# Vector Indexing and Slicing - use bracket notation [ ] to index and access   # 
# individual elements from a vector/scalar of positions to reference elements  # 
# of a vector Include a minus sign before the vector/scalar to remove elements #
################################################################################

x <- c(4, 7, 2, 10, 1, 0)

# Indexing
x[4]
x[1:3]
x[c(2,5,6)]
x[-3]
x[-c(4,5)]
x>4
x[x>4]
x[3] <- 99
x


v1 <- c(100,200,300)
v2 <- c('a','b','c')
v1
v2

# Indexing works by using brackets and passing the index position of the element 
# as a number. Keep in mind index starts at 1 (Python programming languages indexing starts at 0).

# Grab second element
v1[2]
v2[2]

# Multiple Indexing - grab multiple items from a vector by passing a vector of index positions 
# inside the square brackets. 

# Example:
v1[c(1,2)]
v2[c(2,3)]
v2[c(1,3)]

# Slicing - use a colon (:) to indicate a slice of a vector. 
# The format is: vector[start_index:stop_index]

# Example:
v <- c(1,2,3,4,5,6,7,8,9,10)
v[7:10]

# Indexing with Names 
# Example:

v <- c(1,2,3,4)
names(v) <- c('a','b','c','d')
v

#  Use those names along with the indexing brackets to grab individual elements from the array
v['a']

# Or pass in a vector of names we want to grab with a redefined order
v[c('a','c','b')]

# use comparison operators to filter out elements from a vector. Sometimes this is referred to 
# as boolean/logical masking (a vector of logicals to filter out results)
v>2

v[v>2]

# assign names to these logical vectors and pass them as well
# Example:

filter <- v>2
filter
v[filter]



####################################################################################
# Additional functions that will return the indices of a vector
# - which() Indices of a logical vector where the condition is TRUE
# - which.max() Location of the (rst) maximum element of a numeric vector
# - which.min() Location of the (rst) minimum element of a numeric vector
# - match() Returns positions of (first) matches of its first argument in its second
#####################################################################################

x <- c(4, 7, 2, 10, 1, 0)
x>=4
which(x>=4)
which.max(x)
x[which.max(x)]
max(x)

y <- rep(1:5, times=5:1);y
match(1:5, y)
match(unique(y), y)
?match

#############################################################################################
# When vectors are used in math expressions the operations are performed element by element #
#############################################################################################
x <- c(4,7,2,10,1,0)
y <- x^2 + 1;
y
x*y

###########################
# Useful Vector Functions #
###########################
sum(x)
prod(x)
cumsum(x) 
cumprod(x)
min(x)
max(x)
mean(x)
median(x)
var(x)
sd(x)
cov(x,y)
cor(x,y)
range(x)
quantile(x)
fivenum(x)
length(x)
unique(x)
rev(x)
sort(x)
which()
which.max(x); which.min(x)
match(x,y)
union(x,y)
intersect(x,y)
setdiff(x,y)
setequal(x,y)

