#########################
# For loops
#########################

# A for loop iterates over an object (such as a vector) to perform and execute 
# blocks of codes for every loop:
   for (variable in object){
      # Execution for every loop
  }

# For loop over a vector: We can think of looping through a vector in two different ways, 
# the first way would be to create a temporary variable with the use of the in keyword:

vec <- c(1,2,3,4,5,6,7,8,9,10,11); vec

for (w in vec){
   print(w)
}

# Exercise: We iterate over all the elements of a vector and print the current value.
# Create fruit vector
fruit <- c('Apple', 'Orange', 'Banana'); fruit
      
# Create the for statement 
        
for (e in fruit){ 
     print(e) 
} 

# Exercise: Use the Weekdays vector to create a for loop to list all the weekdays
WDays <- c("Mon","Tues","Wed","Thurs","Fri"); WDays

for (f in WDays) {
     print(f)
}


# The other way would be to loop a numbered amount of times and then use indexing to 
# continually grab from the vector:
vec <-c(1,2,3,4,5,6)
length(vec)
for (i in 1:length(vec)){
print(vec[i])
}


# For loop over a list

list1 <- list(71,72,73,74,75,76,77)

for (temp_var in list1){
print(temp_var)
}

length(list1)

for (i in 1:length(li)){
print(li[[i]])    # double brackets here
}

# Exercise: create a non-linear function by using the polynomial of x 
# between 1 and 4 and we store it in a list

# Create an empty vector
vec1 <- c() 

# Create a for statement to populate the list 
for (i in seq(1, 4, by=1)) { 
  vec1[[i]] <- i*i 
} 
print(vec1) 

# Exercise: create a expontential function by using the exp()
vec2 <- c() 
for (i in seq(1, 4, by=1)) { 
  vec2[[i]] <- exp(i)
} 
print(vec2) 


# Take square of all the values in the vector
v<-c(1,2,3,4,5)

for (var in v) {
   squared <- var*var
   print("var*var=: ")
   print(squared)
}



# Exercise: For loop with a matrix 
mat <- matrix(1:9,nrow=3);mat




  
# Create a matrix 
mat2 <- matrix(data = seq(10, 15, by=1), nrow = 3, ncol =2); mat2

# Create the loop with r and c to iterate over the matrix 
for (r in 1:nrow(mat2)) 
  for (c in 1:ncol(mat2)) 
    print(paste("Row", r, "and column",c, "have values of", mat2[r,c])) 


# for Loop over a list of Dataframe in a Function
m <- data.frame("ID"=c("a","b","c"),"Value"=c(0.23,0.54,0.71)); m
n <- data.frame("ID"=c("c","d"),"Value"=c(0.91,0.52)); n
o <- data.frame("ID"=c("f","g","h","i"),"Value"=c(0.15,0.49,0.89,1.89)); o   

Datalist<-list(m,n,o); Datalist
stackData<-function(alist){ 
  result=data.frame() 
  for (i in 1:length(alist)) { 
    result=rbind(result,alist[[i]]) 
  } 
  return(result) 
} 
stackData(Datalist)

stackData(list(m,n,o))

# Nested for loops: loops can be nested inside one another
# Tradeoff: additional for loop nested inside another may cause additional time to execute code 

# Example:
mat <- matrix(1:9,nrow=3);mat
for (row in 1:nrow(mat)){
   for (col in 1:ncol(mat)){
print(paste('The element at row:',row,'and col:',col,'is',mat[row,col]))
}
}
?paste0
