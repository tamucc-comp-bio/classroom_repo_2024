#function to check whether number is triangular
isTriangular <- function(y){
  #triangular numbers (T) defined by n(n+1)/2, thus
  #y is triangular if the following is an integer
  n <- (sqrt((8*y)+1) - 1) / 2
  if(as.integer(n) == n){
    return(TRUE) # function will end here in n is integer
  }
  #if n is not integer, return FALSE
  return(FALSE)
}

#function to find and store triangular numbers
findTriangular <- function(max_number){
  to_test <- 1:max_number
  triangular_numbers <- numeric(0)
  for(i in to_test){
    if(isTriangular(i)){
      triangular_numbers <- c(triangular_numbers, i)
    }
  }
  print(paste("There are", 
              length(triangular_numbers), 
              "triangular numbers between 1 and ", 
              max_number))
  return(triangular_numbers)
}



