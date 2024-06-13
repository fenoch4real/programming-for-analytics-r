###############################
# if, else, else if Statements
###############################

# Here is the syntax for an if statement in R:
  if (condition){
    # Execute some code
  }

# Example: 
x <- 0

if(x > 0){ 
  print ("Positive number") 
} else if (x < 0){ 
  print ("Negative number") 
} else{
  print("Zero")
}

# Also, the above condition can be written in a single line as follows:
  
if(x > 0) print("Non-negative number") else print("Negative number") 

# Example

x <- 10
if (x==9){
  # Code execute
  print('X is equal to 9')
} else if (x==10){
  print('X equal to 10')
} else{
  print('X is equal to others')
}


# Example: we have two variables, hot and temp:

hot <- FALSE
temp <- 83

if (temp > 82){
  # Execute if condition is true
  print('Hot')
} else {
  print('Temp is not that hot')
}

# Reset temp
temp <- 92
if (temp > 82){
hot <- TRUE
}
hot

# Reset temp
hot <- FALSE
temp <- 40
if (temp > 82){
  hot <- TRUE
}
print(hot)

# Because {}, we can write sloppy codes:
if( 1 == 1){print('hi')}

if(1 ==   1)
{
  print('hi')
}

# This works...but hard to read


# It has the syntax: Notice the alignment of the curly brackets and the use of the else keyword
if (condition) {
  # Code to execute if true
} else {
  # Code to execute if above was not true
}

temp <- 72
if (temp > 95){
  print("Hot outside!")
} else{
  print("It's not too hot")
}


temp <- 82
  
if (temp > 78){
  print("Hot")
} else if(temp<78 & temp>70){
  print('Nice outside')
} else if(temp <=70 & temp > 32){
  print("Its cooler outside!")
} else{
  print("Its really cold outside")
}


  
# Example

# Items purchased
  soap <- 10
  papertowel <- 10
  
  # Report to HQ
  report <- 'blank'
  
  if(soap > 10 & papertowel > 10){
  report <- "plenty to purchase"
  
  } else if(soap == 0 & papertowel == 0){
  report <- "Nothing purchased"
  
  }else{
  report <- 'purchased something'
  }
  print(report)
  
