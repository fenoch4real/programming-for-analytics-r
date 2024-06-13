######################################################################
# MSCA 37010 Programming for Analytics, Autumn 2020                  #
# Week 3 Assignment                                                  #
# Due by October 23 at 11:59pm (CST) | 111 points                    #
######################################################################

# Please submit your R script with output for the following questions.(10 points)
# 1) Given the following two vectors:
x <- 1:15; y <- 5:25
# 1.1) What elements of x are in y?
# 1.2) What is the output of x%%3?
# 1.3) Use a function to see is there any x greater than 5?
# 1.4) Use a function to see if all the elements of x are greater than 5?
  
# 1.1)


# 1.2) 


# 1.3) 


# 1.4) 


# 2) Given x <- c(10,12,7,2,0,1, NaN, NA), what is the mean(x) after NA is removed? (5 points)



# 3) Use a data frame t as the following: (15 points)
set.seed(12345)
t <- data.frame(unit = LETTERS[1:3],  a = rnorm(3),  b = rnorm(3))
# class(t)

# 3.1) Create two new columns: sort_a and sort_b by using sort() function of a and b columns.


# 3.2) Create two new columns: order_a and order_b by using order() function of a and b columns.


# 3.3) Create two new columns: rank_a and rank_b by using rank() function of a and b columns.


# 4) Use AutoClaims dataset: (36 points)
# 4.1) Use read_csv to import AutoClaims data into R
# 4.2) Check and remove duplicates
# 4.3) Sort by Column “Paid”, ascending
# 4.4) Sort by Age, descending
# 4.5) Export the sorted data to a csv file
# 4.6) Subsetting Age>= 90 and Gender = "F"
# 4.7) Subsetting Age>= 90 or Gender = "F"
# 4.8) Subsetting PAID >=2000 without Class column
# 4.9) Calculate Average Age by Gender = F and M 
# 4.10) Calculate Average PAID by Gender = F and M 
# 4.11) Calculate Average PAID by STATE 
# 4.12) Calculate Average PAID by CLASS 


# 4.1)


# 4.2)


# 4.3) # Sort by PAID, ascending


# 4.4) # Sort by AGE, descending


# 4.5) 


# 4.6) Subsetting Age>= 90 and Gender = "F"
 

# 4.7) Subsetting Age>= 90 or Gender = "F"


# 4.8) Subsetting PAID >=2000 without Class column  


# 4.9) Calculate Average Age by Gender = F and M (5 bonus points)


# 4.10) Calculate Average PAID by Gender = F and M (5 bonus points)


# 4.11) Calculate Average PAID by STATE (5 bonus points)


# 4.12) Calculate Average PAID by CLASS (5 bonus points)


# 5) Merge two datasets by an ID variable, where ID is not the same for both datasets (10 points)
data1 <- data.frame(ID= letters[1:5], x=1:5)
data2 <- data.frame(ID= letters[6:10], y=4:8)
# 5.1) Keep all the ID from either data1 or data2
# 5.2) Keep the ID which are in both datasets
# 5.3) Only keep the rows from the 1st argument data1
# 5.4) Only keep the rows from the 2nd argument data2

# 5.1) 


# 5.2)


# 5.3) 


# 5.4)



# 6) Merge two datasets to add columns, where the ID variable has a different name (5 points)
data1 <- data.frame(ID1=1:5, x=letters[1:5])
data2 <- data.frame(ID2=1:5, x=letters[6:10])


# 7) Merge two datasets to add rows, where the ID variable has a different name (10 points)
data1 <- data.frame(ID1=1:5, x=letters[1:5]);data1
data2 <- data.frame(ID2=1:5, x=letters[6:10]);data2
# Hint: you can rename one of the ID variable so that both ID variables have a same name



# 8) Use as.Date to convert the following date format to “yyyy-mm-dd” (10 points)
# 8.1)	dates.1 <- c("5jan2008", "19aug2008")
# 8.2)	dates.2 <- c("5-1-2008", "19-8-2008")




# 9) (10 points)
# 9.1) Use as.Date to add 14 days to 2011/1/1 
# 9.2) Use as.Date to Subtract 1 week from 2011/2/8
# 9.3) Compare dates: jan15 > jan1 
# 9.4) Use format.Date to extract Year of 2011/1/1
# 9.5) Use format.Date to extract moth and day of 2011/1/1

# 9.1)


# 9.2) 


# 9.3)


# 9.4) 


# 9.5)




