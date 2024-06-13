##################################################################################
# Data Visualization - ggplot2 Package
##################################################################################

# To determine which amongst these is best suited for the data, a few questions:
# •	How many variables do you want to show in a single chart?
# •	How many data points will you display for each variable?
# •	Will you display values over a period of time, or among items or groups?

# Most popular charts
# 1.	Scatter Plot
# 2.	Histogram
# 3.	Bar & Stack Bar Chart
# 4.	Box Plot
# 5.	Area Chart
# 6.	Heat Map
##################################################################################
# 1. Scatter Plot
#    - When to use: Scatter Plot is used to see the relationship between two 
#      continuous variables
##################################################################################
# In our above mart dataset, if we want to visualize the items as per their cost 
# data, then we can use scatter plot chart using two continuous variables, 
# namely Item_Visibility & Item_MRP as shown below.
# Here is the R code for simple scatter plot using function ggplot() with geom_point().

getwd()
setwd("C:\\Users\\chris\\OneDrive\\Desktop\\TeachingUChicago\\Autumn2020\\Data")
library(ggplot2)     #ggplot2 is an R library for visualizations
library(readr)

BigMart <- read.csv("BigMartDataset.csv")
attach(BigMart)
detach(BigMart)
head(BigMart)

ggplot(BigMart, aes(Item_Visibility, Item_MRP)) + geom_point() + 
       scale_x_continuous("Item Visibility", breaks = seq(0,0.35,0.05))+ 
       scale_y_continuous("Item MRP", breaks = seq(0,270,by = 30))+ 
       theme_bw() 
?ggplot

# Now, we can view a third variable also in same chart, say a categorical variable 
# (Item_Type) which will give the characteristic (item_type) of each data set. 
# Different categories are depicted by way of different color for item_type

# R code with an addition of category:
  
ggplot(BigMart, aes(Item_Visibility, Item_MRP)) + geom_point(aes(color = Item_Type)) + 
       scale_x_continuous("Item Visibility", breaks = seq(0,0.35,0.05))+
       scale_y_continuous("Item MRP", breaks = seq(0,270,by = 30))+
       theme_bw() + labs(title="Scatterplot")

# We can even make it more visually clear by creating separate scatter plots 
# for each separate Item_Type as shown below.
# R code for separate category wise chart:
  
ggplot(BigMart, aes(Item_Visibility, Item_MRP)) + geom_point(aes(color = Item_Type)) + 
       scale_x_continuous("Item Visibility", breaks = seq(0,0.35,0.05))+
       scale_y_continuous("Item MRP", breaks = seq(0,270,by = 30))+ 
       theme_bw() + labs(title="Scatterplot") + 
       facet_wrap( ~ Item_Type)
?ggplot
# Here, facet_wrap works superb & wraps Item_Type in rectangular layout.


# Exercise
df <-mtcars

# Data and Aesthetics
ggplot(df, aes(x=wt,y=mpg))

# Adding Geometry
ggplot(df, aes(x=wt,y=mpg)) + geom_point()
ggplot(df, aes(x=wt,y=mpg)) + geom_point(size=5)
ggplot(df, aes(x=wt,y=mpg)) + geom_point(size=5, alpha=0.4)

ggplot(df, aes(x=wt,y=mpg)) + geom_point(aes(size=hp))
                                         
ggplot(df, aes(x=wt,y=mpg)) + geom_point(aes(size=hp),color="green")

# Or Color Hex: color-hex.com                                                                            
ggplot(df, aes(x=wt,y=mpg)) + geom_point(aes(size=hp),color='#20d664')

ggplot(df, aes(x=wt,y=mpg)) + geom_point(aes(color=hp),size=5) + 
  scale_color_gradient (low='green',high='red')

################################################################################
# 2. Histogram
# - When to use: Histogram is used to plot continuous variable. It breaks the 
# data into bins and shows frequency distribution of these bins. We can
#      always the bin size and see the effect it has on visualization.
# From our mart dataset, if we want to know the count of items on basis of their
# cost, then we can plot histogram using continuous variable Item_MRP as shown below.
####################################################################################

# Here is the R code for simple histogram plot using function ggplot() with 
# geom_histogram().
ggplot(BigMart, aes(Item_MRP)) + geom_histogram(binwidth = 4, color="red",fill="Purple", alpha=1)+
  xlab("Item MRP") +
  ylab("Count") +
  ggtitle ("My Histogram")

ggplot(BigMart, aes(Item_MRP)) + geom_histogram(binwidth = 4, aes(fill=..count..)) +
  xlab("Item MRP") +
  ylab("Count") +
  ggtitle ("My Histogram")

ggplot(BigMart, aes(Item_MRP)) + geom_histogram(binwidth = 4, color="red",fill="Purple", alpha=0.1)+
       scale_x_continuous("Item MRP", breaks = seq(0,270,by = 20))+
       scale_y_continuous("Count", breaks = seq(0,200,by = 10))+
       labs(title = "Histogram") + 
       coord_cartesian(xlim=c(20,280),ylim=c(30,250)) +
       coord_fixed(3/3) + # ratio y to x
       #facet_grid(. ~ Outlet_Location_Type)
       facet_grid(Outlet_Type ~ .)
       facet_grid(Outlet_Type ~ Outlet_Location_Type)

help("facet_grid")
head(BigMart)
# Save plots - three options & clear all plots

####################################################################################
# 3. Bar & Stack Bar Chart
# - When to use: Bar charts are recommended when you want to plot a categorical 
# variable or a combination of continuous and categorical variable.
# From our dataset, if we want to know number of marts established in particular 
# year, then bar chart would be most suitable option, use variable Establishment 
# Year as shown below.
####################################################################################

# Here is the R code for simple bar plot using function ggplot() for 
# a single continuous variable.

ggplot(BigMart, aes(Outlet_Establishment_Year)) + geom_bar(fill = "red")+theme_bw()+
  scale_x_continuous("Establishment Year", breaks = seq(1985,2010)) + 
  scale_y_continuous("Count", breaks = seq(0,1500,150)) +
  coord_flip()+ labs(title = "Bar Chart") + theme_gray()
?ggplot


####################################################################################
# 4. Vertical Bar Chart
#    As a variation, you can remove coord_flip() parameter to get the above bar 
#    chart vertically.
####################################################################################

# To know item weights (continuous variable) on basis of Outlet Type (categorical 
# variable) on single bar chart, use following code:
ggplot(BigMart, aes(Item_Type, Item_Weight)) + 
       geom_bar(stat = "identity", fill = "darkblue") + 
       scale_x_discrete("Outlet Type")+ 
       scale_y_continuous("Item Weight", breaks = seq(0,15000, by = 2500)) + 
       theme(axis.text.x = element_text(angle = 90, vjust = 0.5)) + 
       labs(title = "Bar Chart")

# Exercise:
attach(mtcars)
head(mtcars)
str(mtcars)
dim(mtcars)
ggplot(mpg,aes(x=class)) + geom_bar()


####################################################################################
# Stacked Bar chart:
# Stacked bar chart is an advanced version of bar chart, used for visualizing 
# a combination of categorical variables.
####################################################################################
# From our dataset, if we want to know the count of outlets on basis of categorical 
# variables like its type (Outlet Type) and location (Outlet Location Type) both, 
# stack chart will visualize the scenario in most useful manner.

# Here is the R code for simple stacked bar chart using function ggplot().

ggplot(BigMart, aes(Outlet_Location_Type, fill = Outlet_Type)) + geom_bar()+
  labs(title = "Stacked Bar Chart", x = "Outlet Location Type", y = "Count of Outlets")

head(BigMart)

# Exercise: Item_Fat_Content by Tier

ggplot(BigMart, 
       aes(Item_Fat_Content, fill = Outlet_Type)) +
       geom_bar() +
       labs(title = "Stacked Bar Chart", 
              x = "Item_Fat_Content", 
              y = "Count of Item_Fat_Content")

####################################################################################
# 4. Box Plot
# - When to use: Box Plots are used to plot a numeric variables. This plot is useful
# for visualizing the spread of the data and detect outliers. It shows five statistically 
# significant numbers: minimum, 25th percentile, median, 75th percentile and the maximum
# variability of the outside of the upper and lower quartiles 
####################################################################################

# The black points are outliers. Outlier detection and removal is an essential step 
# of successful data exploration.

# Here is the R code for simple box plot using function ggplot() with geom_boxplot.

ggplot(BigMart, 
       aes(Outlet_Identifier, Item_Outlet_Sales)) + 
       geom_boxplot(fill = "purple")+
       scale_y_continuous("Item Outlet Sales", 
                           breaks= seq(0,15000, by=2500))+
       labs(title = "Box Plot", x = "Outlet Identifier")
unique(Outlet_Identifier)
# From our dataset, if we want to identify each outlet’s detailed item sales 
# including minimum, maximum & median numbers, box plot can be helpful. 
# In addition, it also gives values of outliers of item sales for each outlet as 
# shown in below chart.

# Exercise
mtcars
ggplot(mtcars,aes(x=am,y=mpg)) + 
  geom_boxplot()                 # x-need to be categorical variable



####################################################################################
# 5. Area Chart
# - When to use: Area chart is used to show continuity across a variable or data 
# set. It is very much same as line chart and is commonly used for time series 
# plots. Alternatively, it is also used to plot continuous variables and analyze
# the underlying trends.

# From our dataset, when we want to analyze the trend of item outlet sales, area 
# chart can be plotted as shown below. It shows count of outlets on basis of sales
# Here is the R code for simple area chart showing continuity of Item Outlet Sales 
# using function ggplot() with geom_area
####################################################################################

# Here is the R code for simple area chart showing continuity of Item Outlet Sales 
# using function ggplot() with geom_area.

ggplot(BigMart, aes(Item_Outlet_Sales)) + 
  geom_area(stat = "bin", bins = 30, fill = "steelblue") + 
  scale_x_continuous(breaks = seq(0,11000,1000))  + 
  labs(title = "Area Chart", x = "Item Outlet Sales", y = "Count") +
  theme_dark()

####################################################################################
# 6. Heat Map
# - When to use: Heat Map uses intensity (density) of colors to display 
# relationship between two or three or many variables in a two dimensional 
# image. It allows you to explore two dimensions as the axis and the third
# dimension by intensity of color.
####################################################################################

# From our dataset, if we want to know cost of each item on every outlet, we can plot
# heatmap as shown below using three variables Item MRP, Outlet Identifier & Item 
# Type from our mart dataset.

# The dark portion indicates Item MRP is close 50. The brighter portion indicates 
# Item MRP is close to 250.

# Here is the R code for simple heat map using function ggplot().

ggplot(BigMart, aes(Outlet_Identifier, Item_Type))+
  geom_raster(aes(fill = Item_MRP))+
  labs(title ="Heat Map", x = "Outlet Identifier", y = "Item Type")+
  scale_fill_continuous(name = "Item MRP") 


data("airquality")
attach(airquality)
str(airquality)

############################################################
# Theme
# - Set theme for all the plots: theme_set(theme_minimal())
# - Add a theme to each individual plot: theme_dark() etc.
############################################################

theme_set(theme_minimal())
install.packages("ggthemes")
library(ggthemes)

ggplot(BigMart, aes(Item_Visibility, Item_MRP)) + geom_point(aes(color = Item_Type)) + 
  scale_x_continuous("Item Visibility", breaks = seq(0,0.35,0.05))+
  scale_y_continuous("Item MRP", breaks = seq(0,270,by = 30))+ 
  theme_bw() + labs(title="Scatterplot") + facet_wrap( ~ Item_Type)

ggplot(BigMart, aes(Item_Visibility, Item_MRP)) + geom_point(aes(color = Item_Type)) + 
  scale_x_continuous("Item Visibility", breaks = seq(0,0.35,0.05))+
  scale_y_continuous("Item MRP", breaks = seq(0,270,by = 30))+ 
 labs(title="Scatterplot") + facet_wrap( ~ Item_Type)+
theme_fivethirtyeight()
