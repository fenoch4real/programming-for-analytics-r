#######################################################################
# Create Your Own Function
# 1. Function Syntax
# 2. When to Create a Function
# 3. Set Default Values/Optional Arguments
# 4. Return Values
# 5. Function Scope (local vs. global)
# 6. Nesting Functions
#######################################################################

# 1. Function Syntax
Func_Name <- function (argu1, argu2, argu3, argu4, argu5=default_value){
    # Code Execution when the function is called
    result=argu1+argu2-argu3*argu4/argu5
    return(result)
}


hello <- function(){
  print("Hello R")
}
hello()  # call the hello() function


hello2 <- function(name){
  # Code executed when the function is called
  print(paste("Hello", name))
}
hello2() # get error that no default
hello2("Zoey")

# Exercise: Write your own hello function:




# 2. When to Create a Function
# Suppose you would like to detect the number of extreme values from a numeric vector
# The extreme values are defined as the ones that are greater than or less than two times 
# standard deviation from mean; We can generate a sequence of number that followd the 
# standard normal distribution to test this example

set.seed(12345)
vec1<-rnorm(100)
sum((abs(vec1-mean(vec1)))>2*sd(vec1))

set.seed(12312)
vec2<-rnorm(100)
sum((abs(vec2-mean(vec2)))>2*sd(vec2))

set.seed(12312)
vec3<-rnorm(100)
sum((abs(vec3-mean(vec3)))>2*sd(vec3))


# We can create a small function to calculate the number of extreme values in a given 
# vector. The purpose of writing a function in this example will eliminate the needs
# for changing the vector names during the calculation.

extreme <- function (vec){
  extreme_n <- sum(abs(vec-mean(vec))>2*sd(vec))
  extreme_n
}
extreme(vec1)
extreme(vec2)
extreme(vec3)

# If you want to return several values, you combine them into one object 
# - Most of time, a list object is used to store all the returned values
# - You can also combine them into a vector; but it requires the returned
#   values have the same data type
# Suppose, in addition to return the number of extreme values, you would 
# also like to calculate the mean and standard deviation of the given vector. 
# The extreme1 function below group the returned value into a list; 
# while the extreme 2 function group the returned values into a vector

extreme1 <- function (vec){
  extreme_n <- sum(abs(vec-mean(vec))>2*sd(vec))
  list(extreme_num=extreme_n,average=mean(vec),SD=sd(vec))
}
extreme1(vec1)

extreme2 <- function (vec){
  extreme_n <- sum(abs(vec-mean(vec))>2*sd(vec))
  c(extreme_num=extreme_n,average=mean(vec),SD=sd(vec))
}
extreme2(vec1)


# 3. Set Default Values

hello <- function(name="Mei"){
  # Code executed when the function is called
  print(paste("Hello", name))
}
hello()
hello("Sandy")


two_vars <- function(var1=1,var2=2){
  print(var1+var2)
}
two_vars(4,53)
two_vars(4,)
two_vars()


# 4. Return Values

# Exercise: Create a function that will return the product of two integers. 

product <- function(var1,var2){
    return(var1*var2)
}
product(3,2)

product <- function(var1,var2){
    print(var1*var2)
}
product(3,2)

# Use return so that we can assign the result to a variable
add_vars <- function(var1,var2){
  both <- var1+var2
  return(both)
}
result <- add_vars(4,5)
print(result)

# Or, equivalently:
add_num <- function(var1,var2){
  return(var1+var2)
}
result <- add_vars(4,5)
print(result)



times2 <- function(var){
  return(var*2)
}
print(times2)
print(times2(30))


times2 <- function(var){
  myresult <- var*2
  return(myresult)
}
print(times2)
print(times2(30))
myresult <-times2(30)
print(myresult)


# Or, equivalently:
times2 <- function(var){
  return(var*2)
}
print(times2(30))

# Exercise: Create a function with two arguments: x*y^2

two_argus <- function(x,y){
  return(x*y*y)
}
print(two_argus(3,4))
two_argus(3,4)
# Exercise: Create a function with three arguments: x*exp(y)/log(z)



# 5. Function Scope indicates that the variable only defines/redefines inside of the funtion
# A variable assigned outside of the function is known as a global variable 

# Example: Function Scoping implies that variables that are defined inside a function 
# are not accessible outside that function. y was defined inside the calc3() function 
# and therefore it is not accessible outside of that function.
# This is also true for the function’s arguments of course - x in this case.

calc3 <- function(x) {
  y <- log(x)+exp(x)
  return(y)
}
calc3(4)
calc3(3)

y
x

calc3 <- function(x) {
  y <- log(x)+exp(x)
  y
}
print(y)
calc3(4)
calc3(3)

####################################################################################
# Local and global variables in R
# Create in R, the environment is a collection of objects like functions, 
# variables, data frame, etc. R opens an environment each time Rstudio is prompted. 
# The top-level environment available is the global environment, called R_GlobalEnv. 
# And we have the local environment.
# We can list the content of the current environment. This will output the list of 
# global variables and functions on the right pane of RStudio Environment section. 
####################################################################################


# Difference between global and local environments

a <- "Global Variable1"
b <- "Global Variable2"
func <- function(b){
  print(a)
  print(b)
}

func(b)


a <- "Global Variable1"
b <- "Global Variable2"
func <- function(b){
  print(a)
  b <- "Reassign as variable3"
  print(b)
}

func(b)

print(b)  # print outside of the function returning the global variable which 
          # was defined in the global environment

# Some Simple Examples
a <- 1
print(a)
b <- 2
print(b)

func <- function(b){
  print(a)
  b <- 3
  print(b)
}

func(b)

print(b)


y<-8
f<-function(x){
  x+y
}
f(5)
y


# R also uses the most recent variable definition to pass inside 
# the body of a function

y<-8
f<-function(x){
  y<-5
  x+y
}
f(5)


# 6. Nesting Functions

# Let’s define a function fahrenheit_to_celsius that converts temperatures 
# from Fahrenheit to Celsius:

fahrenheit_to_celsius <- function(temp_F) {
  temp_C <- (temp_F - 32) * 5 / 9
  return(temp_C)
}
fahrenheit_to_celsius(32)
# boiling point of water
fahrenheit_to_celsius(212)

# Let's define a function celsius_to_kelvin to turn Celsius into Kelvin:

celsius_to_kelvin <- function(temp_C) {
  temp_K <- temp_C + 273.15
  return(temp_K)
}
# freezing point of water in Kelvin
celsius_to_kelvin(0)


# Let's define a function to convert Fahrenheit to Kelvin by nesting the two functions we have already created:

fahrenheit_to_kelvin <- function(temp_F) {
  temp_C <- fahrenheit_to_celsius(temp_F)
  temp_K <- celsius_to_kelvin(temp_C)
  return(temp_K)
}
# freezing point of water in Kelvin
fahrenheit_to_kelvin(32.0)

# Nesting Functions
# This example showed the output of fahrenheit_to_celsius assigned to temp_C, which is then 
# passed to celsius_to_kelvin to get the final result. It is also possible to perform this
# calculation in one line of code, by “nesting” one function inside another, like so:

# freezing point of water in Fahrenheit
celsius_to_kelvin(fahrenheit_to_celsius(32.0))

