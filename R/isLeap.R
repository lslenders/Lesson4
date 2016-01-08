## Team Puma
## Lesson 4
## 7-1-2015
#-----------------------------------------------------------

# Function to calculate leapyear
isLeap <- function(y) {
# y must be numeric number
  if(!is.numeric(y)) {
    stop("Provide year in numeric class")
  }
# check if y is integer 
  else if(y - floor(y) != 0) { 
    stop("Year not integer")
  }
# check if in the right range
  else if (y < 1581) {
    stop("Provide year in range 1581-2016")
  } else { # calculate if y is a normal year 
    x <- 365 + (y %% 4)
    if (x != 365) {
      x <- FALSE
    } else {
      x <- TRUE
    }
    return(x)
  }
}


# isLeap(1999)
# isLeap(2008)
# isLeap(1400)
# isLeap('john')
# isLeap(2000,4)
