########################################################
################# Week 2 - Breakout#1 ##################
########################################################


# 1. Solve the following problems using R - What is square root of 656? 
sqrt(656)

# 2. Create a vector called weather.weekday with the following data points: 45,43,52,54,61

weather.weekday <- c(45,43,52,54,61)
weather.weekday

# 3. Assign names to the weather data points relating to the weekday, Mon, Tue, Wed, etc...

names(weather.weekday) <- c('Mon','Tues','Wed','Thu','Fri')

# 4. What was the average (mean) weather temperature for the week? (use a built-in function) 

mean(weather.weekday)

# 5. Create a vector called Greater40 corresponding to the days where the weather temperature was more than 40 degrees

Greater40 <- weather.weekday>40


# 6. Use the Greater40 vector to filter out the temperature vector and only return the day and temperature where the price was over 40 degrees

weather.weekday[Greater40]


# 7. Grab the day with highest temperature
weather.weekday[weather.weekday==max(weather.weekday)]


# 8. Grab the temperature from Wednesday through Friday
weather.weekday[3:5]