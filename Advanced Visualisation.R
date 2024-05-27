#ADVANCED VISUALISATION
#data, aesthetics, geometrics, statistics, facets, coordinates, theme

#Factors
getwd()
setwd("C:\\Users\\jofu2\\Documents\\Bioinformatics\\R")
get(wd)

movies <- read.csv("Movie Ratings.csv")
head(movies)
colnames(movies) <-c("Film", "Genre", "CriticRating", "AudienceRating", "BudgetMillions", "Year")
str(movies)
summary(movies)
#R treating year like other numeric vairables such as mean and median
#Want year to be a categorical variable 

factor(movies$Year) #turning the vector year in movies from an int to a factor
movies$Year <- factor(movies$Year)
summary(movies)
str(movies)

#aesthetics how the data is mapped
library(ggplot2)

ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))

#add geometry
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating)) + 
  geom_point()

#add color
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, 
                        colour=Genre)) + 
  geom_point()

#add size
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, 
                        colour=Genre, size=BudgetMillions)) + 
  geom_point()
# First visualisation

#Geometries - Plotting with layers
#Every time you want a layer you have to + add it to the object you're creating

p <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, 
                             colour=Genre, size=BudgetMillions))
#overlaying a geometry
p + geom_point()
p + geom_line()

#can overlay multiple layers
p + geom_point() + geom_line()
p + geom_line() + geom_point()

#layer over layer over layer. Order is important 

#OVERRIDING AESTHETICS

q <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, 
                             colour=Genre, size=BudgetMillions))

#add geom layer It is inheriting the aesthetics from object q

q + geom_point()
#This overrides the aesthetics specified in q but it doesn't modify q

q + geom_point(aes(size=CriticRating)) #Mapping 
q + geom_point(aes(colour=BudgetMillions)) +
  xlab("Budget Millions $$$")

q + geom_point()

#can override X and Y variables as they are still aesthetics
#But the labelled X and Y variables do not change 
q + geom_point(aes(x=BudgetMillions))

q + geom_line(size=1) + geom_point() #Setting

#Mapping vs Setting

r <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))
r + geom_point()

#Adding colour by MAPPING

r + geom_point(aes(colour=Genre))

#ADDING colour by SETTING

r + geom_point(colour = "DarkGreen")

r + geom_point(aes(size=BudgetMillions))
r + geom_point(size=10)
#error mixing both r + geom_point(aes(size=10)) ERROR ERROR ERROR ERROR 

#---------------------------------------------------------------------------
#Histograms and density charts
#Statistics levels

s <- ggplot(data=movies, aes(x=BudgetMillions))
s + geom_histogram(binwidth = 10) #how wide the bars are, here 10 million

s + geom_histogram(binwidth=10, aes(fill=Genre)) #mapped is inside aes
s + geom_histogram(binwidth=10, aes(fill=Genre), colour ="Black") #black outline is set

#density chart. Probability density function
s + geom_density(aes(fill=Genre))
s + geom_density(aes(fill=Genre), position ="stack")

#-----------------------------------------------------------------------
#Starting layer tips 

t <- ggplot(data=movies, aes(x=AudienceRating)) #setting
t + geom_histogram(binwidth=10, fill ="White", colour="Black")

t + geom_histogram(binwidth=10, fill ="White", colour="Black",
                   aes(x=AudienceRating))

t + geom_histogram(binwidth=10, fill ="White", colour="Black",
                   aes(x=CriticRating)) #more efficient don't have to recreae t variable 

#skeleton plot, can then set data inside my layers 

z <- ggplot()

#--------------------------------------------------------------------------
#Statistcal transformation


u <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             colour=Genre))

u + geom_point() + geom_smooth(fill=NA)

#boxplota

u <- ggplot(data=movies, aes(x=Genre, y=AudienceRating,
                             colour=Genre))
u + geom_boxplot()
u + geom_boxplot(size=1)
u + geom_boxplot(size=1) + geom_point()

u + geom_boxplot(size=1) + geom_jitter() #throws points around. Helps with data visualisation 

u + geom_jitter() + geom_boxplot(size=1, alpha=0.5)

#-------------------------------------------------------------------------
#FACETS

v <- ggplot(data=movies, aes(x=BudgetMillions))
v + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black")

#SET IS WITHOUT USING THE AESTHETICS FUNCTION

v + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black") +
  facet_grid(Genre~., scales="free") #each one now has own scale 

#scatterplots and facets

w <-ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre))
w + geom_point(size=3)

w + geom_point(size=3) + facet_grid(Genre~.)
w + geom_point(size=3) + facet_grid(.~Year)

w + geom_point(size=3) + facet_grid(Genre~Year)

w + geom_point(aes(size=BudgetMillions)) + geom_smooth() + facet_grid(Genre~Year)
#y axis going for -150 to 150 can't have -150 budget uncertainty gives wide badns 

#--------------------------------------------------------------------------
#Co-oridantes

#limits
#zoom

m <- ggplot(data=movies, aes(x=BudgetMillions, y=AudienceRating, size=BudgetMillions, colour=Genre))
m + geom_point()

# cutting out highest rated movies 50 to 100 by critics and audience

m + geom_point() + xlim(50,100) + ylim(50,100)

n <- ggplot(data=movies, aes(x=BudgetMillions))
n + geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black")

n + geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black") +
  coord_cartesian(ylim = c(0,50))

w + geom_point(aes(size=BudgetMillions)) + geom_smooth() + facet_grid(Genre~Year) +
 coord_cartesian(ylim=c(0,100))

#---------------------------------------------------------------------
#Theme - layering our visualisations non data 
o <- ggplot(data=movies, aes(x=BudgetMillions))
o + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black")
h <- o + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black")

#axis label, format label 

h +xlab("Money Axis") + ylab("Number of Movies") + ggtitle("Domestic Gross % by Genre") +
  theme(axis.title.x = element_text(colour ="DarkGreen", size=30), 
  axis.title.y = element_text(colour="Red", size=30),
  axis.text.x = element_text(size=20),
  axis.text.y = element_text(size=20))

#format label
#theme element 
#LEGEND FORMATTING

h +xlab("Money Axis") + ylab("Number of Movies") + 
  theme(axis.title.x = element_text(colour ="DarkGreen", size=30), 
        axis.title.y = element_text(colour="Red", size=30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20),
        
        
        legend.title =  element_text(size=20),
        legend.text = element_text(size=20),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        
        plot.title = element_text(colour="Blue", size=40, family="Courier")
        )











