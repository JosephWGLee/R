# What is a vector?

# numeric vector
# a sequence of data elements of the same data type
# 1 2 3 4 8 9
# integer or a double
# Indexing does not start at 0, starts at 1

# Character vector
# vector can only have elements of the same type
# "Q" "T" "7" "Beans"

# a single number/char is stored as a vector at length = 1

MyFirstVector <- c(3, 45, 56, 21) #combines num to vector
MyFirstVector
is.numeric(MyFirstVector)
is.integer(MyFirstVector)
#default stores as double with decimal e.g 3.0
is.double(MyFirstVector)
#need L to classify as an integer
V2 <- c(3L, 21L, 19L)
is.integer(V2)

v3 <- c("c", "b23", "Dinosaur", 7)
v3
is.character(v3)
is.numeric(v3)
#Cannot mix data types within a vector
# same data type within a vector

seq(1,15)
1:15
seq(1,15,2)
#seq gives additional flexibility

z <- seq(1,15,4)
z

rep(3, 50)
# converted into one long vector
d <- rep(3, 50)
rep("B", 5)
x <- c(80, 20)
rep(x, 5)


#USING [ ] BRACKETS
w <- c("a", "b", "c", "d")
w[1]
w[2]
w[-1]

v <- w[-3]
v

w[1:3]
w[c(1,3,4)]
w[c(-2,-4)]
w[-1:-2]
w[7]
w[0]

#Steep learning curve 
# ask questions. What can I do. What can't I do

#VECTORIZED OPERATIONS
#adding two vectored elements together

a <- c(1,2,3)
b <- c(4,5,6)

# R is a vectorised programming language

c <- a+b
c

#recycling of vectors e.g 

e <- c(1,2) #(1,2)
f <- c(3,4,5,6)
g <- e + f
g

#R is based upon vectors

# THE POWER OF VECTORISED OPERATIONS 

x <-rnorm(5)
x

for(i in x){ 
  print(i)
  }

print(x[1])

for(j in 1:5){
  print(x[j])  
}

#------------------------------------------------

N <- 100
A <- rnorm(N)
B <- rnorm(N)

# compare vectorised operation and non-vectorised
# vectorised

C <- A * B

# Devectorised

D <- rep(NA, N)
for(i in 1:N){
  D[i]<- A[i] * B[i]
}

#in vectorised operations faster than non-vectorised

# Functions in R 

?rnorm()
rnorm(n=5, mean=10, sd=8)

?seq()
seq(from=10, to=20, length.out=100)

?rep()
rep(5:6, times=10)
rep(5:6, each=10)

# Packages in R 
# allow you to expand functionality available in R

install.packages("ggplot2")

library(ggplot2)

vector <- (6, 5.6 "beans")













