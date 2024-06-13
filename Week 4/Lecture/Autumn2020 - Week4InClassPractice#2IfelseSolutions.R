# if else Statement Exercises - Solutions

# Exercise 1: Write a script that prints "Hello" if the variable x is equal to 1: 

x <- 1
if (x ==1){
  print("Hello")
}


# Exercise 2: Write a script that will print "Even Number" if the variable x is an even number, 
# otherwise print "Not Even". Hint: use operator modular '%%' with remainder==0

x <- 4 # Change x to test

if (x%%2 == 0){
  print('Even Number')
}else{
  print('Not Even')
}


# Exercise 3: Check if "Truth" is in the vector.
# Hint: "Truth" is not the same as "truth"

x <- c("what","is","truth")
if("Truth" %in% x) {
  print("Truth is found")
} else {
  print("Truth is not found")
}

# Exercise 4: Write a script that will print 'Is a Vector' if the variable x is a vector, 
# otherwise print "Not a Vector".  Hint: You may want to check out help(is.vector, etc.) 

x <- data.frame()

if (is.vector(x)){
  print('Is a Vector')
}else{
  print("Not a Vector")
}


# Exercise 5: Write a script that uses if,else if, and else statements to print the min element in a numeric vector with 3 elements. 

x <- c(100, 3, 2)

if (x[1] < x[2] & x[1] < x[3] ) {
  print(x[1] )
} else if (x[2] < x[3] ) {
  print(x[2])
} else {
  print(x[3])
}

# Exercise 6: Use ifelse() function to create a new column to indicate if it is a Perfect GPA (=4.0) or not

GPA <-data.frame(year=c("2016","2017","2018","2019"),score=c(3.4,3.5,3.6,4.0)); GPA
GPA$Perfect<-ifelse(GPA$score==4.0, 1,0); GPA


