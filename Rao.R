library(imageRy)
library(terra)
library(rasterdiv)

sent <- im.import("sentinel.dolomites")

ren3 <- Renyi(sent[[1]], window=3, alpha=seq(0,12,4), na.tolerance=0.2, np=1)

renstack <- c(ren3[[1]], ren3[[2]], ren3[[3]], ren3[[4]])

plot(renstack)
writeRaster(renstack, "ren3.tif")

# rao3 <- paRao(sent, window=3, alpha=seq(0,6,2)) 
rao3 <- paRao(sent, window=3, alpha=2) 

# 32 core!
rao3 <- paRao(sent, window=3, alpha=2, np=32)


#---


