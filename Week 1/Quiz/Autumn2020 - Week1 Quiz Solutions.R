###############################
### Quiz 1 Review Solutions ###
###############################

# 1)	Calculate the sum of x<-c(4,7,1,3,5)
x<-c(4,7,1,3,5)
sum(x)
               

# 2)	Calculate the mean of x after removing the first element
# (Hint: Use [ ] with a vector/scalar of positions to reference elements)
x[-1]
mean(x[-1])       

# 3)	How to assign an object name?
#  A.	<-                   B. =                     C. >                        D. Both A and B

D
  
# 4)	Sort the vector y<-c(10,19,21,58) so that the numbers are Ascending
y<-c(10,19,21,58)
sort(y,decreasing=FALSE)

# 5)	What is the output of seq(0, 6, by=0.5)? # Note that both starting and ending points are included

seq(0, 3, by=0.6)

# 6)	Use seq() funtion to create a sequence: 0 1 2 3 4 ....100

seq(0,100)

# 7)	Use rep() function to create a sequence: 1 1 1 2 2 2 3 3 3

rep(1:3,each=5)

# 8)	Use rep() function to create a sequence: 1 2 3 1 2 3 1 2 3

rep(1:3,times=5)

# 9)	How to get the current work directory? 

getwd()

# 10)	 How to set the working directory?

setwd("C:/Users/chris/OneDrive/Desktop/TeachingUChicago/Autumn2020")

# 11)	 How to see the contents of the directory? 

dir()

# 12)	How to list the variables you have created in the current session

ls()

# 13)	How to see the loaded libraries and dataframes

search()

# 14)	How to see what libraries have been installed

library()
