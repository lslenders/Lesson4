## Team Puma
## Lesson 4
## 7-1-2015
#-----------------------------------------------------------

# Function to calculate leapyear
leap <- function(y){
# y must be numeric number
  if(!is.numeric(y)){
    stop("Provide year in numeric class")
    }
# check if y is integer 
  else if(y - floor(y) != 0){ 
    stop("Year not integer")
    }
# check if in the right range
  else if (y < 1581){
    stop("Provide year in range 1581-2016")
    } 
# calculate if y is a normal year 
  else{
    x <- 365 + (y %% 4)
    if (x != 365){
        x <- FALSE
        } else{ 
          x <- TRUE
        }
      return(x)
    }
  }


# leap(1999)
# leap(2008)
# leap(1400)
# leap('john')
# leap(2000,4)
