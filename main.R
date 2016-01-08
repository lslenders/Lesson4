## name: Jason Davis & Lieven Slenders
## Date: 
## Lesson : 
# ------------------------

# set the temporary fodler for `raster` operations
options(rasterTmpDir='~/your_temp_dir')
# set wd
setwd("D:/workspace/geoscripting/Rprojects")
# Import packages
library(sp)
library(raster)

# Source functions
# source('R/ageCalculator.R')
# source('R/HelloWorld.R')
# source('R/minusRaster.R')
source('R/isLeap.R')

# self study 
source('R/ss_l4.R')



#--------------------------------
# call leap year function

isLeap(2000)
isLeap(1400)
isLeap('john')
isLeap(2000.2)
isLeap(1999)







