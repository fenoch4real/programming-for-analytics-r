######################################################################################
# sort() vs. order() vs. rank() Function
# - sort() sorts the vector in an ascending order.
# - rank() ranks the numbers in the vector the smallest number receiving the rank 1
# - order() returns the indices of the vector in a sorted order
######################################################################################

# Build a data frame
set.seed(12345)
t <- data.frame(unit = LETTERS[1:3],  a = rnorm(3),  b = rnorm(3)); t
class(t)

# Create two new columns: sort_a and sort_b by using sort() function of a and b columns.
t$sort_a <- sort(t$a)
t$sort_b <- sort(t$b)
t

# Create two new columns: order_a and order_b by using order() function of a and b columns.

t$order_a <- order(t$a)
t$order_b <- order(t$b)
t

# Create two new columns: rank_a and rank_b by using rank() function of a and b columns.
t$rank_a <- rank(t$a)
t$rank_b <- rank(t$b)
t

# Example
x <- c(1,2,3,4,5,6,-1) 
sort(x)
rank(x)
order(x)
x[order(x)]

# sort(x) = x[order(x)]

# Check More Details
?sort()
?rank()
?order()


### The sort() function takes one vector argu?ent, either numeric or character, and returns a vector of sorted values; 
# To sort in decreasing order: rev(sort(x)) 
# Example: 
x <- c(1,2.3,2,3,4,8,12,43,-4,-1,NA); sort(x) 

### The order() function sorts a vector, matrix or data frame: order(x, decre?sing = FALSE, na.last = NA, ...)
# - x:                    vector
# - decreasing:    decrease or not
# - na.last:           if TRUE, NAs are put at last position, FALSE at first, if NA, remove them (default)
# Example:       
order(x)

# Example:  Sort Vector Continue:
x <- c(1,2.3,2,3,4,8,12,43,-4,-1,NA)
order(x)

order(x, decreasing=TRUE)
order(x, decreasing=TRUE, na.last=TRUE)
order(x, decreasing=TRUE, na.last=FALSE)


### Example:  Sort a Dataframe:

getwd()
library(readr)
AutoColl <-read_csv("C:\\Users\\chris\\OneDrive\\Desktop\\TeachingUChicago\\Spring2020\\Data\\AutoCollision.csv")
head(AutoColl)

str(AutoColl)        # Gives the structure of data
summary(AutoColl)
View(AutoColl)       # View imported data

# Sort by ClaimSeverity, ascending
AutoColl<-AutoColl[order(AutoColl$ClaimSeverity),]; AutoColl

# Sort by AgeGroup, descending
AutoColl<-AutoColl[order(AutoColl$AgeGroup, decreasing=TRUE),]; AutoColl






