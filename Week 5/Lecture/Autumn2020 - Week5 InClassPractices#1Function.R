####################################
# R Functions Practices 
####################################

# 1. Create a function that takes in a name as a string argument, 
# and prints out "Hello name"

sayhello <- function(myname){
  print(paste('Hello ', myname))
}

sayhello('femi')

# 2. Create a function that takes in a name as a string argument 
# and returns a string of the form - "Hello name"
sayhello <- function(myname){
  return (paste('Hello ', myname))
}
sayhello('Jane')


# 3. Create a function to triple the values - one argument


trippler <- function(value){
   value*3
}
trippler(5)

# 4. Create a calculation function - two arguments: x/y+sqrt(x)*y

solver <- function(x, y){
   x/y+sqrt(x)*y
}
solver(5,6)

# 5. Create a calculation function with optional argument/default values: x/y+sqrt(x)*y

solver_opt <- function(x, y=3){
  x/y+sqrt(x)*y
}
solver_opt(5)



# 6. Create a function to calculate a*b+log(a)

log_cal <- function(a, b){
  (a*b+log(a))
}

log_cal(3,4)

# 7. Create a calculation function with return() function


log_cal <- function(a, b){
  return (a*b+log(a))
}

log_cal(3,4)

