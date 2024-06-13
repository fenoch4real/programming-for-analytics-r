###############################
### Quiz 1                  ###
###############################

# 1)	Calculate the sum of x<-c(4,7,1,3,5)
x<-c(4,7,1,3,5)
sum(x)

# 2)	Calculate the mean of x after removing the first element
# (Hint: Use [ ] with a vector/scalar of positions to reference elements of a vector)

x <- x[2:5]
mean(x)

# 3)	How to assign an object name?
#  A.	<-                   B. =                     C. >                        D. Both A and B
D

  
# 4)	Sort the vector y<-c(10,19,21,58) so that the numbers are ascending
y<-c(10,19,21,58)
sort(y,decreasing = FALSE)


# 5)	What is the output of seq(0, 6, by=0.5)? # Note that both starting and ending points are included
seq(0, 6, by=0.5)
#Answer = 0.0 0.5 1.0 1.5 2.0 2.5 3.0 3.5 4.0 4.5 5.0 5.5 6.0

# 6)	Create a sequence: 0 1 2 3 4...100
seq(0, 100, by=1)


# 7)	What is the output of rep(1:3,each=5)?
rep(1:3,each=5)
#Answer - five occurrences of numbers 1, 2 and 3 i.e  1 1 1 1 1 2 2 2 2 2 3 3 3 3 3


# 8)	What is the output of rep(1:3,times=5)?
rep(1:3,times=5)
#Answer - Numbers 1, 2 and 3 appear in order five different times i.e 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3

# 9)	How to get the current work directory? 
getwd()

# 10)	 How to set the working directory?
setwd("~/Desktop/MSc Analytics/Autumn 2020")


# 11)	 How to see the contents of the directory? 

dir()

# 12)	How to list the variables you have created in the current session

ls()

# 13)	How to see the loaded libraries and dataframes



# 14)	How to see what libraries have been installed
library()

