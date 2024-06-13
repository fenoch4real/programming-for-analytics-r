#############################
# Week 4 Quiz               #
#############################

# 1. Sort the vector: x <- c(1,2.3,2,3,4,8,12,43,-4,-1,NA) 
sort(x)

# 2. Import QuizAutoClaims.csv named as data1 and QuizAutoCollision.csv named as data2: 
getwd()
setwd("C:/Users/chris/OneDrive/Desktop/TeachingUChicago/Autumn2020/Data")
data1<-read.csv("QuizAutoClaims.csv"); data1
data2<-read.csv("QuizAutoCollision.csv"); data2

# 3. Merge the data1 and data2 from #2:    
data3<-merge(data1,data2,by="STATE"); head(data3)

# 4. Sort data3 by PAID
data3_ordered<-data3[order(data3$PAID, decreasing=TRUE),]; head(data3_ordered)

# 5. Import KaggleHealthcare.csv named as data4:
data4 <- read.csv("KaggleHealthcareNoshows.csv"); head(data4)
dim(data4)

# 6. Use a function to Check if there are duplicated rows in the data4 from #5
dim(data4)
unique(data4)
dim(data4)
