########################
# while loops
########################

# while loops are a while to have your program continuously run some block of code
# until a condition is met (made TRUE). The syntax is:
  while (condition){
    # Code executed here 
    # while condition is true
  }

# A major concern when working with a while loop is to make sure that at some point 
# the condition should become true, otherwise the while loop will go forever 
# Remember you can use Crtl-C to kill a process in R Studio

print("Just a string")

var <- 'a variable'
cat('My variable is: ',var)


var <- 25
cat('My number is:',var)


# Could also use:
print(paste0("Variable is: ", var))

x <- 0
while(x < 10){
  cat('x is currently: ',x)
  print(' x is still less than 10, adding 1 to x')
  # add one to x
  x <- x + 1
}


x <- 0
while(x < 10){
    cat('x is currently: ',x)
    print(' x is still less than 10, adding 1 to x')

    # add one to x
    x <- x+1
    if(x==10){
        print("x is equal to 10, Terminating loop")
    }
}


# break: We can use break to break out of a loop. 
# Previously we showed an if statement checking for 10, but this wasn't 
# actually stopping the loop, the while condition check on the next run 
# stopped the loop, let's show an example where we could use break to terminate the loop:

x <- 0
while(x < 5){

   cat('x is: ',x)
   print(' x is still less than 5, adding 1 to x')

   # add one to x
   x <- x+1
   if(x==5){
      print("x is equal to 5")
      print("can I print?")
  }
}


x <- 0
while(x < 5){

  cat('x is: ',x)
  print(' x is still less than 5, adding 1 to x')

  # add one to x
  x <- x+1
  if(x==10){
     print("x is equal to 10!")
     break
     print("can I print?")
  }
}


# Example: while loop in R with Break statement:
# break statement will end the loop abruptly. Once the break statement is read, the loop will be terminated.

i <- 1
while (i <= 6) {
  if (i==4)
    break;
  print(i*i)
  i = i+1
}
# Once the value reaches i=4, then the break statements terminates the loop. 
# So only the square of values from 1 to 3 is printed

# Example: while loop with Next statement:
# Next statement will skip one step of the loop. Once the next statement is read,
# the loop will skip the while once.

i <- 1
while (i <= 6) {
  if (i==4)
  {
    i=i+1
    next;
  }
  print(i*i);
  i = i+1;
}
# Once the value reaches i=4, then the next statement skips the loop and 
# the square of 4 i.e 16 is not printed

