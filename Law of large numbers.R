#mean = 0
# Create R scirpt taht count how many of these numbers are
# between -1 and 1 and divide by n
#expected should be 68.2%
# Check the mean of measured value 

#hint 1 
#i is the variable itself



n <- 10000
counter <- 0
for(x in rnorm(n)){
  if(x <= 1 & x >= -1){
    counter <- counter + 1
  }
}
answer <- counter/n
answer

#compare to 68.2%



