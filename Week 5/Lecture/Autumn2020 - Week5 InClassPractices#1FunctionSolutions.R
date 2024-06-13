####################################
# R Functions Practices - Solutions
####################################

# 1. Create a function that takes in a name as a string argument, 
# and prints out "Hello name"

hello <- function(name){
print(paste('Hello',name))
}
hello('Sam')


# 2. Create a function that takes in a name as a string argument 
# and returns a string of the form - "Hello name"

hello2 <- function(name){
return(paste('Hello',name))
}
print(hello2('Sam'))


# 3. Create a function to triple the values - one argument
myfunction<-function(x){
  3*x 
} 
myfunction(6)

triple<-function(x){
  3*x 
} 
triple(6)

# 4. Create a calculation function - two arguments: x/y+sqrt(x)*y
calc <-function(x,y) {
  x/y+sqrt(x)*y
} 
calc(3,4) 
calc(4,3)
calc(x=4,y=3)
calc(y=4,x=3)



# 5. Create a calculation function with optional/default argument
calc_opt <-function(x,y=2) {
  x/y+sqrt(x)*y
} 
calc_opt(3) 
calc_opt(3,0)
calc_opt(3,4)

# 6. Create a function to calculate a*b+log(a)
calc2<-function (a,b) {
  a*b+log(a)
}
calc2(3,4)
calc2(3,0)
calc2(0,3)


# 7. Create a calculation function with return() function
calc_return <-function(x,y=2) {
  if (y==0) {
    return(0)    #return 0 and exit function
  }
  2*x+sqrt(x)*y  # only execute when y is not equal to 0
} 
calc_return(3,0)
calc_return(3,1)

  

