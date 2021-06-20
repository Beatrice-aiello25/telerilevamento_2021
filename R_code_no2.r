# R_code_no2.r

# fase  1: set working directory EN
setwd("C:/lab/EN/")

# Funzione library per richiamare il pacchetto raster precedentemente installato
library(raster)

# fase 2: importare la prima banda
EN0001 <- raster ("EN_0001.png")
# Funzione plot
plot(EN0001) 

clr <- colorRampPalette(c("red","orange","pink","yellow")) (100)
plot(EN0001, col=clr)

# fase 3: importare l'ultima banda e plottarla con la precedente colorRampPalette
EN0013 <- raster ("EN_0013.png")
# Funzione plot
plot(EN0013) 

clr <- colorRampPalette(c("red","orange","pink","yellow")) (100)
plot(EN0013, col=clr)

# fase 4: make the difference between the two images and plot it
ENdif <- EN0013-EN0001
plot(ENdif, col=clr)
# 
ENdif <- EN0001-EN0013
plot(ENdif, col=clr)
# fase 5 
par(mfrow=c(3,1))
plot(EN0001, col=clr, main="NO2 in January")
plot(EN0013, col=clr, main="NO2 in March")
plot(ENdif, col=clr, main="Difference between January - March")



