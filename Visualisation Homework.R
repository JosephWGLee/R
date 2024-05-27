setwd("C:\\Users\\jofu2\\Documents\\Bioinformatics\\R")
getwd()
movies <- read.csv("HomeworkData.csv")
head(movies)

#filter data frame after importing csv
str(movies)
summary(movies)
#want to filter the data to only having 

selectedgenres <- (movies$Genre == "action") | (movies$Genre == "adventure") | (movies$Genre == "animation") | (movies$Genre == "comedy") | (movies$Genre == "drama")
selectedstudios <- (movies$Studio == "Buena Vista Studios") | (movies$Studio == "Fox") | (movies$Studio == "Paramount Pictures") | (movies$Studio == "Sony") | (movies$Studio == "Universal") | (movies$Studio == "WB") 

movies2 <- movies[selectedgenres & selectedstudios,]

head(movies2)
tail(movies2)
str(movies2)


a <- ggplot(data=movies2, aes(y=Gross...US, x=Genre))
a + geom_jitter(aes(size=Budget...mill., colour=Studio)) + 
  geom_boxplot(alpha=0.7, outlier.colour=NA) 
b <- a + geom_jitter(aes(size=Budget...mill., colour=Studio)) + geom_boxplot(alpha=0.7, outlier.colour=NA) 

b +xlab("Genre") + ylab("Gross %") + ggtitle("Domestic Gross % by Genre") +
  theme(axis.title.x = element_text(colour ="Blue", size=30), 
        axis.title.y = element_text(colour="Blue", size=30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20),
        
        legend.title =  element_text(size=20),
        legend.text = element_text(size=20),
        
        plot.title = element_text(colour="Black", size=40),
  )

