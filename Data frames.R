#Data Frames in R
#In data frames all the data doesn't need to be the same type 
#csv file 

#Importing data into R 

#method 1 selct file manually

stats <- read.csv(file.choose())
stats

#method 2 set working directory and read data from there 
#getwd()
#setwd("C:\\Users\\jofu2\\Documents\\Bioinformatics\\R")

#rm(stats)
#stats <- read.csv("DemographicData.csv")

nrow(stats)
ncol(stats)
head(stats) #top 5
tail(stats) #bottom 6
str(stats) #structure
#runif() Random numerals uniformally distributed 
summary(stats)

stats
head(stats)
stats[3,3]
stats[3, "Birth.rate"]
stats$Internet.users #returns the whole column of internet users
stats$Internet.users[2]
stats[,"Internet.users"]
levels(stats$Income.Group)

# BASIC OPERATIONS WITH DATA FRAME

#Subsetting 
stats[1:10,] 
stats[c(4,100),]
stats[1,]

is.data.frame(stats[1,])
#extracting from data frame keeps as a data frame

is.data.frame(stats[,1])

stats$Birth.rate * stats$Internet.users

#can add a column to a data frame
head(stats)

stats$MyCalc <- stats$Birth.rate * stats$Internet.users
head(stats)

stats$xyz <- 1:5
head(stats, n=10)
#when vector is insufficent length it gets recycled 

#remove column
stats$MyCalc <- NULL
stats$xyz <- NULL
head(stats)

#Filtering data frames 
filter <- stats$Internet.users < 2
stats[filter,]

stats[stats$Birth.rate >40 & stats$Internet.users < 2 ,]
stats[stats$Income.Group == "High income",]

stats[stats$Country.Name == "Malta",]


#QPLOT
installed.packages("ggplot2")
library(ggplot2)
?qplot

qplot(data=stats, x=Internet.users)
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(1))
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(1), colour=I("Red"))
qplot(data=stats, x=Income.Group, y=Birth.rate, geom="boxplot")

qplot(data=stats, x=Internet.users, y=Birth.rate, size=I(1), colour=Income.Group)


#Building Data Frames 
mydf <- data.frame(Countries_2012_Dataset, Codes_2012_Dataset, Regions_2012_Dataset)
head(mydf)
colnames(mydf) <- c("Country", "Code", "Region")
head(mydf)
rm(mydf)

mydf <- data.frame(Country=Countries_2012_Dataset, Code=Codes_2012_Dataset, 
                   Region=Regions_2012_Dataset)
head(mydf)
tail(mydf)

merged <- merge(stats, mydf, by.x = "Country.Code", by.y = "Code")
head(merged)

merged$Country <- NULL

str(merged)
tail(merged)


qplot(data=merged, x =Internet.users, y=Birth.rate,
      colour=Region)

qplot(data=merged, x =Internet.users, y=Birth.rate,
      colour=Region, size=I(1), shape=I(15))

#shape is shape

qplot(data=merged, x =Internet.users, y=Birth.rate,
      colour=Region, size=I(1), shape=I(15), alpha=I(0.5))

#alpha is transparency 

qplot(data=merged, x =Internet.users, y=Birth.rate,
      colour=Region, size=I(1), shape=I(15), alpha=I(0.5),
      main ="Title")


#Add title
#----------------------------------------------------------------------------


qplot(data=merged, x =Birth.rate, y=Life_Expectancy_At_Birth_2013,
      colour=Region, size=I(1), shape=I(15), alpha=I(0.5),
      main ="Title")




merged <- merged[!is.na(merged$Birth.rate) & !is.na(merged$Life_Expectancy_At_Birth_2013), ]






