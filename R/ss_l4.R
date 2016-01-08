## SEFL STUDY
## name: Jason Davis & Lieven Slenders
## Date: 7-1-2015
## Lesson : 3

setwd("D:/workspace/geoscripting/Lesson4/")

# Create two rastersLayer objects of similar extent
library(raster)

## warnings

#
r <- s <- raster(ncol=50, nrow=50)
# fill the raster with values
r[] <- 1:ncell(r)
s[] <- 2 * (1:ncell(s))
s[200:400] <- 150
s[50:150] <- 151
# perform the replacement
r[s %in% c(150, 151)] <- NA
# Visualize the result
plot(r)

# for built in Dsets like cars, meuse.grid_ll, Rlogo, iris .. 
# use 
data("meuse" #autocomplete to find datasets available 
  ) 
data(cars) 
class(cars)
head(cars)

# The plot function on this type of dataset (class = data.frame, 2 column)
# automatically generates a scatterplot
plot(cars)

## Example using built-in dataset from the sp package
library(sp)
# Load required datastes
data(meuse)
# The meuse dataset is not by default a spatial object
# but its x, y coordinates are part of the data.frame
class(meuse)
coordinates(meuse) <- c("x", "y")
class(meuse)
str(meuse)

bubble(meuse,
       "zinc", maxsize = 2.5,
       main = "zinc concentrations (ppm)",
       key.entries = 2^(-1:4)
       )

# example 2
# Load meuse.riv dataset
data(meuse.riv)
# Create an object of class spatialPolygons from meuse.riv
meuse.sr <- SpatialPolygons(
              list(Polygons(list(
                  Polygon(meuse.riv)),"meuse.riv")))
# Load the meuse.grid dataset
data(meuse.grid)
# Assign coordinates to the dataset and make it a grid
coordinates(meuse.grid) = c("x", "y")
gridded(meuse.grid) = TRUE

    # # explanation of gridded()
    ## just 9 points on a grid:
    # x <- c(1,1,1,2,2,2,3,3,3)
    # y <- c(1,2,3,1,2,3,1,2,3)
    # xy <- cbind(x,y)
    # S <- SpatialPoints(xy)
    # class(S)
    # plot(S)
    # gridded(S) <- TRUE
    # gridded(S)
    # class(S)
    # summary(S)
    # plot(S)
    # gridded(S) <- FALSE
    # gridded(S)
    # class(S)
    # plot(S)

# Plot all variables of the meuse.grid dataset in a multiple window spplot
spplot(meuse.grid, col.regions=bpy.colors(), main = "meuse.grid",
       sp.layout=list(
         list("sp.polygons", meuse.sr),
         list("sp.points", meuse, pch="+", col="black")
       )
)

# examples of spacing and indentation  --------------------------------------------------

ageCalculator <- function(x) {
  # Function to calculate age from birth year
  # x (numeric) is the year you were born
  if(!is.numeric(x)) {
    stop("x must be of class numeric")
  } else { # x is numeric
    # Get today's date
    date <- Sys.Date()
    # extract year from date and subtract
    year <- as.numeric(format(date, "%Y"))
    if(year <= x) {
      stop("You aren't born yet")
    }
    age <- year - x
  }
  return(age)
}

ageCalculator(1985)
# Control flow -------------------------------------------------------------

# 5 different objects belonging to 5 different classes
a <- 12
class(a)
b <- "i have"
class(b)
library(raster)
c <- raster(ncol=10, nrow=10)
class(c)
d <- stack(c, c)
class(d)
e <- brick(d)
class(e)
plot(c)

# controlling input ---------------------------------------------

adele <- function (x) {
  # x= name
  if (is.character(x)) {
    hello <- sprintf('%s, hello is it me youre looking for?', x)
  } else {
    hello <- warning("not good name, provide characters")
  }
  return(hello)
}

# test
adele('jason')
adele(21)

is.character('john')
# is equivalent to 
class('john') == 'character'
is.character(32)




library(raster)
# Function to substract 2 rasterLayers
minusRaster <- function(x, y, plot=FALSE) { 
  z <- x - y
  if (plot) {
    plot(z)
  }
  return(z)
}

# Let's generate 2 rasters 
# that first one is the R logo raster
# converted to the raster package file format.
r <- raster(system.file("external/rlogo.grd", package="raster")) 
# The second RasterLayer is derived from the initial RasterLayer in order
# to avoid issues of non matching extent or resolution, etc
r2 <- r 
# Filling the rasterLayer with new values.
# The /10 simply makes the result more spectacular
## note 1:max ncells -> to devide all cells ranging instead of only the last one
r2[] <- (1:ncell(r2)) / 10
# simply performs the calculation
r3 <- minusRaster(r, r2) 
# Now performs the calculation and plots the resulting RasterLayer
r4 <- minusRaster(r, r2, plot=TRUE) 
