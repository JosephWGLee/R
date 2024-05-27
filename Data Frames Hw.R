data <- read.csv(file.choose())
data
str(data)
summary(data)

data1960 <- data[data$Year == 1960,]
data2013 <- data[data$Year == 2013,]

nrow(data1960)
nrow(data2013)

add1960 <- data.frame(Code=Country_Code, Life.Exp = Life_Expectancy_At_Birth_1960)
add2013 <- data.frame(Code=Country_Code, Life.Exp = Life_Expectancy_At_Birth_2013)

#check summaries
summary(add1960)
summary(add2013)

#merged dataframes
merged1960 <- merge(data1960, add1960, by.x="Country.Code", by.y="Code")
merged2013 <- merge(data2013, add2013, by.x="Country.Code", by.y="Code")

str(merged1960)

qplot(data=merged1960, x =Fertility.Rate, y=Life.Exp,
      colour=Region, size=I(1), shape=I(15), alpha=I(0.5),
      main ="1960")

qplot(data=merged2013, x =Fertility.Rate, y=Life.Exp,
      colour=Region, size=I(1), shape=I(15), alpha=I(0.5),
      main ="2013")

