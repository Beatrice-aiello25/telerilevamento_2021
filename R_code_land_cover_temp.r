### R_code_land_cover_temp.r

library(raster)
library(RStoolbox)
#install.packages("ggplot2") funziona con qualsiasi dataset
library(ggplot2)
# Set della working directory 
setwd("C:/lab/")

# funzione brick per importare i dati
defor1 <- brick("defor1.jpg)
# plot dell'immagine defor1
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
ggRGB(defor1, r=1, g=2, b=3, stretch="lin")

defor2 <- brick("defor2.jpg")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")
ggRGB(defor2, r=1, g=2, b=3, stretch="lin")

# funzione par
par(mfrow=c(1,2))
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

#  install.packages("gridExtra")
library(gridExtra)

# multiframe con ggplot2 e gridExtra
p1 <- ggRGB(defor1, r=1, g=2, b=3, stretch="lin")
p2 <- ggRGB(defor2, r=1, g=2, b=3, stretch="lin")
grid.arrange(p1,p2, nrow=2)
































