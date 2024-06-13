######################################################################
# PFA Week 2 Assignment Solutions                                    #
# Due by October 14 at 11:59pm | 100 points + 10 bonus points        #
######################################################################


### Data Structure - Matrix ###

# 1) Create 2 vectors A and B, where A is (1,2,3,4) and B is (5,6,7,8). You'll need to choose 
# the cbind() or rbind() function correctly to create a 2 by 4 matrix from the vectors. (5 points)

A <- c(1,2,3,4)
B <- c(5,6,7,8)
rbind(A,B)


# 2.1) Create a 4 by 4 matrix consisting of the numbers 1-16. Create this matrix using 1:16 in the matrix() function call. 
# Assign this matrix to the variable Mat (10 points)

Mat <- matrix(1:16,nrow = 4); Mat

# 2.2) Confirm that Mat is a matrix

is.matrix(Mat)

# 2.3) The top row should be the numbers 1-4
Mat <- matrix(1:16,byrow=TRUE,nrow = 4); Mat

# 2.4) Using indexing notation, grab a sub-section of Mat from the previous exercise that looks like this:

# [11,12]
# [15,16]

Mat[3:4,3:4]

# 2.5) What is the sum of all the elements in Mat?
sum(Mat)

# OR,
apply(matrix(apply(Mat,1,sum)),2,sum)

# 3) Use runif() function to create a 4 by 5 matrix consisting of 20 random numbers between 0 and 100. (10 points)

# Note: The runif() function generates random deviates about the uniform distribution on the interval from min to max

Mat2 <- matrix(runif(20,min=0,max=100),nrow = 4)
Mat2


# 4) (10 points)
# A= matrix(1:9, nrow=3),   B= matrix(15:23,nrow=3), y <- 1:3                     
# 4.1)	Calculate math expression multiplication
# 4.2)	Calculate matrix multiplication
# 4.3)  Write code to calculate A divided by y%*%y
y<- 1:3; y
A= matrix(1:9, nrow=3)
B= matrix(15:23,nrow=3)
A*B
A%*%B

# (y%*%y) is a matrix so it should be converted to vector first by using c() function:

A/(y%*%y)
A/c(y%*%y)

# Or, use as.vector() function:

temp <- y%*%y ;temp      # value is 14
A/as.vector(temp)

# 5) (10 points)
# x <- matrix(c(0,6,1,3,5,9), nrow=2, ncol=3, 
#             dimnames=list(rows=c("r.1", "r.2"),cols=c("c.1", "c.2", "c.3")))             
# 5.1)	Grab the elements of row 1 and column 3 
# 5.2)  Grab the elements of third column   
# 5.3)	Grab Rows 1 and 2, all Columns

x <- matrix(c(0,6,1,3,5,9), nrow=2, ncol=3, 
                        dimnames=list(rows=c("r.1", "r.2"),cols=c("c.1", "c.2", "c.3")))

# 5.1) 
x[1,3] 

# 5.2)
x[,3]

# 5.3)
x[c(1,2),]

# Or,
x[,]

# 6) Use apply() function and x <- matrix(1:9, nrow=3, ncol=3) to calculate: (10 points)                                    
# 6.1)	Row mins
# 6.2)	Column sums
x <- matrix(1:9, nrow=3, ncol=3); x
apply(x,1,min)
apply(x,2,sum)

# Or,
apply(x,1,FUN=min)
apply(x,2,FUN=sum)

# 7.1) Use the factor() function and degrees to create ordinal categorical variables. (10 points)
degrees <- c('BS','MS','PhD','BS','BS','MS','PhD','BS','BS','MS','BS')

fact.degrees <- factor(degrees); fact.degrees

# Or, you can specify the order you like:
fact.degrees <- factor(degrees,ordered=TRUE,levels=c('PhD','MS','BS')); fact.degrees

# Or,

degrees <- c('cold','med','cold','med','hot','hot','cold') #created this vector because I didn't see the "degrees"
fact.temp <- factor(degrees,ordered=TRUE,levels=c('cold','med','hot')); fact.temp

# 7.2) Summarize the numbers by different degrees

summary(fact.degrees)
# You can compare the output from above to the output from the following:
summary(degrees)

### Data Structure - Array ###

# 8) Use apply() function and y <- array(1:12,dim =c(2,2,3),
# dimnames=list(c("Row1","Row2"), c("Column1","Column2"), c("Matrix1","Matrix2","Matrix3")))  to calculate:  (10 points)                                                         
# 8.1)	 Column sums
# 8.2)	 Row means

y <- array(1:12,dim =c(2,2,3),
          dimnames=list(c("Row1","Row2"), c("Column1","Column2"), c("Matrix1","Matrix2","Matrix3"))); y
apply(y,2,sum)
apply(y,1,mean)

# 9) Use drink <- c("redwine", "whitewine", "water")  (10 points)     
# 9.1)	What is the number of strings of drink?
# 9.2)	What is the number of characters in each string?
# 9.3)	What are the characters 2-4 of each drink?
# 9.4)	How to print the first three characters of drink?
# 9.5)	How to print drink in all upper case?
drink <- c("redwine", "whitewine", "water") 

# 9.1) What is the number of strings of drink?
length(drink)

# 9.2) What is the number of characters in each string?
nchar(drink)

# 9.3)	What are the characters 2-4 of each drink?
substr(drink,2,4)

# 9.4)	How to print the first three characters of drink?
substr(drink,1,3)

# 9.5)	How to print drink in all upper case?
toupper(drink)

tolower(drink)

### Data Structure - Data Frame ###

# 10) Use the following codes to import KaggleHealthcareNoshows.csv (15 points)

install.packages("readr")
library(readr)
getwd()
setwd('C:/Users/yumei/OneDrive/Desktop/New/TeachingUChicago/Spring2020/Data')
khc<- read.csv("KaggleHealthcareNoshows.csv")
View(khc)

# 10.1) View the structure of data (2.5 points)
str(khc)

# 10.2) List the column names (2.5 points)
names(khc)

# Or,
colnames(khc)   

# 10.3) First 5 Row names (2.5 points)
head(rownames(khc),5)

# 10.4) Dimension of the dataframe (2.5 points)
dim(khc)    

# 10.5) Create a data set with "PatientId", "AppointmentID","Gender" columns (2.5 points)

khc[,c("PatientId", "AppointmentID","Gender")]

# Or,
patientId <- KaggleHealthcareNoshows$PatientId
appointmentId <- KaggleHealthcareNoshows$AppointmentID
gender <- KaggleHealthcareNoshows$Gender
combine.columns <- data.frame(patientId, appointmentId,gender)


# 10.6) Use two ways to pull No.show column (2.5 points)
khc$No.show                                     
khc[,14]  

# Or,
subset(KaggleHealthcareNoshows, select=`No-show`)


# 10.7) Use factor() function to summarize the count of No.show column by Yes and No (5 bonus points)
fact.No.show <- factor(khc$No.show,ordered=TRUE,levels=c('No','Yes')); fact.No.show
summary(fact.No.show)

# 10.8) Calculate Average Age by No.show = Yes and No. (5 bonus points)
install.packages("magrittr") # package installations are only needed the first time you use it
install.packages("dplyr")    # alternative installation of the %>%
library(magrittr) # needs to be run every time you start R and want to use %>%
library(dplyr)    # alternatively, this also loads %>%

khc %>%
  #khc[,c("Age", "No.show")] %>%
  #filter(No.show == "Yes") %>%
  group_by(No.show) %>%
  summarize(AvgAge=mean(khc$Age))

# Group by PolicyNumber and LOB
lossdata<-HamiltonAssrantLossPolicyLOB%>%
  #colnames(lossdata)
  filter(No.show == "Yes") %>%
  group_by(PolicyLOB, CarrierName)%>%
  summarize(SumTotInc=sum(TotalIncurred))

# Or,
aggregate(khc$Age,by=list(khc$'No.show'),FUN = mean)
