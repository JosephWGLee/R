
#Matrices 
#Indexation A[3,4]
#first number is the row you want
#the second number is the column you want to look at 
#A[1, ] whole top row
#A[,1] whole column one
#In R a matrix can only have elements of the exact same type 

my.data <- 1:20
my.data

A <- matrix(my.data, 4, 5)
A
A[2,3]
B <- matrix(my.data, 4, 5, byrow=1)
B

r1 <- c("I", "Dog", "Roux")
r2 <- c("What", "Day", "Is")
r3 <- c(1,2,3)
C <- rbind(r1, r2, r3)
C

c1 <- 1:5
c2 <- -1:-5
D <- cbind(c1,c2)
D

#Naming dimensions
#Can rename rows and columns 
# A ["Row", "Column"]

Charlie <- 1:5
Charlie
names(Charlie) <- c("a", "b", "c", "d", "e")
Charlie
Charlie["d"]
names(Charlie)

#clear names
names(Charlie) <- NULL
Charlie

temp.vec <- rep(c("a", "b", "ZZ"), each=3)
temp.vec

Bravo <- matrix(temp.vec, 3, 3)
Bravo

rownames(Bravo) <- c("How", "are", "you")
colnames(Bravo) <- c("Beans", "on", "toast")

Bravo["are", "toast"] <- 0
Bravo
rownames(Bravo)

#Matrix operations



Games
rownames(Games)

Games["LeBronJames", "2012"]

FieldGoals


round(MinutesPlayed / Games, 1)



#Visualisation with Matplot


matplot(FieldGoals)
t(FieldGoals/Games)

Data <- MinutesPlayed[]

matplot(t(Data), type = "b", pch=15:18, col=c(1:4,6))

legend("bottomleft", inset=0.01, legend=Players[],col=c(1:4,6), pch=15:18, horiz=F )

#legend completely separate to matplot. Appears on same chart
#But not part of matplot itself 

#SUBSETTING 

x <- (2:5)
x
x[c()]

Games[1:3, 6:10]
Games[c(1,10),]
Games[,c("2008","2009")]


Games[1,]
is.matrix(Games[1,])
is.vector(Games[1,])

Games[1,,drop=F] #drop, drops uneccesary dimensions 
#drop =5 square brackets return same class of objects as you specify originally 

#CREATING YOUR FIRST FUNCTION 

Data <- MinutesPlayed[1,,drop=F]
matplot(t(Data), type = "b", pch=15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players[1],col=c(1:4,6), pch=15:18, horiz=F )


myplot <- function(data, rows=1:10){
  Data <- data[rows,,drop=F]
  matplot(t(Data), type = "b", pch=15:18, col=c(1:4,6))
  legend("bottomleft", inset=0.01, legend=Players[rows],col=c(1:4,6), pch=15:18, horiz=F )
}

myplot(Games)

#---------------------------------------------------------------------------

myplot(Salary)
myplot(Salary/Games)
myplot(Salary/FieldGoals)

myplot(MinutesPlayed)
myplot(Points)

myplot(FieldGoals/Games)
myplot(FieldGoals/FieldGoalAttempts)
myplot(FieldGoalAttempts/Games)
myplot(Points/Games)

myplot(MinutesPlayed/Games)
myplot(Games)

myplot(FieldGoals/MinutesPlayed)

myplot(Points/FieldGoals)

f <- function(vector=1:3){
  
  vector * 5
  
}
f() + f(c(1,1,1))
