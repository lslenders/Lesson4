## name: Jason Davis & Lieven Slenders
## Date: 8-01-2015
## Lesson 4 
# ------------------------


# I set wd
setwd("D:/workspace/geoscripting/Rprojects")
# II Import packages
library(sp)
library(raster)

# III functions used in Lesson 4
source('R/minusRaster.R')
source('R/isLeap.R')
source('R/selfS_l4.R') # self study 
source('R/isLeap.R')


#--------------------------------
# 1. Assignment Lesson 4. Leapyear function 

# testing on differnt input 
isLeap(2000)
isLeap(1400)
isLeap('john')
isLeap(2000.2)
isLeap(1999)

#----------------------------------
# 2. Raster demo - Minusraster

minusRaster(r, r2, plot=TRUE) 



