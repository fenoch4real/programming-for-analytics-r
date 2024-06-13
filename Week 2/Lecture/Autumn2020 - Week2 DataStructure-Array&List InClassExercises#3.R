#############################################################################
# Data Structures                                                           #
# 1. Vectors: A vector is an ordered collection of objects of the same type #
# 2. Matrices:        ?                                                     # 
# 3. Arrays: a multi-dimensional generalization of a vector                 #
# 4. Lists                                                                  # 
# 5. Dataframes                                                             #
#############################################################################

###########################################################################################################?
# Array: To create an array, array(data = NA, dim = length(data), dimnames = NULL)
# - data: A vector that gives data to fill the array; if data does not have enough elements to fill 
#         the matrix, then the elements are recycled
# - dim: Dimension of th? array, a vector of length one or more giving the maximum indices in each dimension
# - dimnames: Name of the dimensions, list with one component for each dimension, either NULL or a character 
#             vector of the length given by dim for that dimen?ion. The list can be named, and the list 
#             names will be # used as names for the dimensions.
# Values are entered by columns; Like with vectors and matrices, when arrays are used in math expressions 
# the operations are performed element by element
# Like vectors and matrices, the elements of an array must all be of the same type (numeric, character, 
# logical, etc.)
############################################################################################################

##########?#######
# Arrays Example
##################

z <- array(1:12,dim =c(2,2,3),dimnames=list(c("Row1","Row2"), c("Col1","Col2"), c("Mat1","Mat2","Mat3")));z

# Create your own 2X2X3 array
z2 <- array(1:12,dim =c(2,2,3),dimnames=list(c("A","B"), c("C","D"), c("E","F","G")));z2

w <- array(1:24, dim=c(2,3,4),dimnames=list(c("A","B"), c("X","Y","Z"), c("N","M","O","P"))); w


##########################################################################################################
# Reference array elements using the [ ] just like with vectors and matrices,but now with more dimensions
##########################################################################################################

z <- array(1:24,dim =c(2,3,4),dimnames=list(c("Row1","Row2"), c("Col1","Col2","col3"), c("Mat1","Mat2","Mat3","Mat4")));z

z[2,3,1]          # Row 2, Column 3, Matrix 1

z[,"Col2",]       # Column named "Col2"

z[1,,]            # Row 1

z[1:2,,"Mat3"]    # Rows 1 and 2, Matrix "Mat3"

####################################################################################################
# We can use the apply() function for more than one dimension
# For a 3-dimensional array there are now three margins to apply the function to: 
# 1=rows, 2=columns, and 3=matrices.
####################################################################################################
?apply
z <- array(1:12,dim =c(2,2,3),dimnames=list(c("Row1","Row2"), c("Col1","Col2"), c("Mat1","Mat2","Mat3")));z
apply(z, 2, sum)       # Column sums
apply(z, 1, sum)       # row sums
apply(z, c(1,3), sum)  # Row and matrix sums

z <- array(1:12, dim=c(2,3,2),dimnames=list(c("A","B"), c("X","Y","Z"), c("N","M")));z
apply(z, 2, sum)       # Column sums
apply(z, 1, sum)       # row sums
apply(z, c(1,3), sum)  # Row and matrix sums

# Exercise: 
z <- array(1:12, dim=c(2,2,2),dimnames=list(c("A","B"), c("X","Y"), c("N","M")));z

# Column sums

# row sums

# Row and matrix sums


##############################################?####################################################
# Lst: a general form of a vector where the elements don't need to be of the same type or dimension
# The function list(...) creates a list of the arguments
# Arguments have the form name=value. Argument can be specified with and without names.
###################################################################################################

x <- list(num=c(1,2,3), "Nick", identity=diag(2)); x

############################################################?######################################
# Reference Elements of a List: Elements of a list can be referenced using [] as well as [[ ]] or $
##################################################################################################
x <- list(num=c(1,2,3), "Nick", identity=diag(2));x
x[[2]]      # Second element of x
x[[1]]      # Element named "num"
x[["num"]]  # Element named "num"
x$identity  # Element named "identity"
x[[3]][1,]  # First row of the third element
x[1:2]      # Create a sublist of the first two elements

# Exercise:
# What is the second column of the third elements?

# What is the second element of the first element?
 

##########################?#######################################################################
# List Example: Lists are sometimes called recursive vector because a list contains other lists
##################################################################################################
# Example:
nestedList<-list(c1=1, letters, list(c1=2,c2=LETTERS)); nestedList
str(nestedList)

##################################################################################################
# The unlist() function converts a list to a vector
##################################################################################################

student.vec<-c(name="John",year=2, classtaken=c("CS101","CS102","CS103"), GPA=3.9); student.vec
student.list<-as.list(student.vec);student.list
str(student.list)
unlist(student.list)
student.vec[3]
student.vec[[3]]

##################################################################################################
# Using the concatenate function, c(), to concatenate lists
##########################################?#######################################################
list1<-c(list(letters[1:3],2:4),list(c(1,3,5)));list1
str(list1)

nestedList<-list(c1=1, letters, list(c1=2,c2=LETTERS)); nestedList
str(nestedList)
?integer 

dbl_var <- c(1, 2.5, 4.5) ; dbl_var

int_var <- c(1L, 6L, 10L); int_var

typeof(dbl_var) ## [1] "double" 

typeof(int_var) ## [1] "integer"

##################################################################
# Note: Single bracket returns you a list                        #
#       Double brackets return only a element from the list      #
##################################################################