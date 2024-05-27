A <- 10
B <- 5
C <- A + B
#Spaces in R don't matter. R studio ignores spaces
C

variable1 <- 2.5
variable2 <- 4
typeof(variable1)

result <- variable1/variable2
result

answer <- sqrt(variable2)

counter <- 1

while(counter < 5)
  
{
  
  print("Abra Kadabra")
  
  counter = counter + 1;
  
}

greeting <- "Hello"
name <- "Bob"
message <- paste(greeting, name)
message

# Logical variables and operators
# EEither true or False must be all CAPS TRUE FALSE
4 < 5
5 > 6
4 == 5
# ==
# !=
# <
# >
# <=
# >=
# !
# | or

result <- 4 < 5 
result
typeof(result)

result2 <- !(5 > 1)
result2

result & result2 #if both are true

isTRUE(result)
result | result2

x <- 5
x


for(i in 5:10){ #i has to iterate through these values
  print("Hello R")
}

# for loop a bit different in R 
# This construct is a vector

rm(answer) #remove answer variable
x <- rnorm (1)
if(x > 1){
  answer <- "Greater than 1"
} else if(x >=-1){
      answer <- "Between -1 and 1"
} else{
      answer <- "Less than -1"
}

# This is a nested else if statement 
# Better to chain statements 











while(TRUE){
  print("Hello")
}
#esc to force stop a loop

#counter loop
counter <- 1
while(counter < 12){
  print(counter)
  counter <- counter + 1
}
















