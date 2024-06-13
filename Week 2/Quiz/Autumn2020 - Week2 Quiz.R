###########################################
# MSCA 37010 Programming for Analytics    #
# Week 2 Quiz                             #
###########################################

# Please write down R code and output for the following questions.

# Question 1. Use matrix() function to create a 2x3 matrix with row and column names


                                                                          
                                                                          
# Question 2. Use apply() function and x <- matrix(1:9, nrow=3, ncol=3) to calculate:                                       
# 1). Row maxs
# 2). Column means
# 3). Row mins
# 4). Column sum

y <- matrix(1:9, nrow=3, ncol=3); y

# Answer:
# 1). 
apply(y, 1,max)

# 2). 
apply(y, 2,mean)

# 3). 
apply(y, 1,min)

# 4). 
apply(y, 2,sum)
                                                                      

# Question 3. When x <- 1:9, what is the output of (x%%3==0) | (x > 3)?
                                                                          
# Answer:
x <- 1:9
(x%%3==0) | (x > 3)                                                            
#Answer is FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  


                                                                        
# Question 4. home <- c("tree", "barn", "lake"), write down your R code for the following questions: 
# 1) How to calculate the number of strings of home? 
# 2) How to calculate the number of characters of home in each string? 
# 3) How to get characters 2-4 of each home?
# 4) How to print the first three characters of home?
# 5) How to print home in all upper case?

# Answer:
# 1) 
home <- c("tree", "barn", "lake");
length(home)

# 2) 
nchar(home)

# 3) 
substring(home, 2, 4)

# 4) 
strtrim(home,3)

# 5)
toupper(home)


# Question 5. A <- matrix(11:14, nrow=2); B <- matrix(15:18, nrow=2, ncol=2); 
# 1) What is the math operation: A*B = ?
# 2) What is the matrix multiplication: A%*%B = ?
# 3) Which one, 1) or 2), is the element to element operation?

# 1) 
A <- matrix(11:14, nrow=2); B <- matrix(15:18, nrow=2, ncol=2)
A*B

# 2) 
A%*%B

# 3)                                                                     

#1

# Question 6. 
# 1) What is the library name used to import csv file?

library(readr)

# 2) What is the R code/function to import csv file?

data3way<-read.csv(file=paste("~/Desktop/MSc Analytics/Autumn 2020/MSCA 31007 1 - Statistical Analysis/Week 2/Seminar/","test_sample.csv",sep="/"))

# 3) What is the R code/function to export csv file?

write.csv(res, file = paste(dataPath,'result.csv',sep = '/'), row.names = F)

# 4) What is the R function to view data frame in RStudio?

#Answer = dim(x)
