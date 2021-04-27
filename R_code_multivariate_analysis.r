## Analisi multivariata

library(raster)
library (RStoolbox)

#settaggio working directory
setwd("C:/lab/") 

# Funzione brick
p224_2011 <- brick("p224r63_2011_masked.grd")
plot(p224_2011)
# mi indica tutte le informazioni sull'immagine
p224_2011

plot(p224_2011$B1_sre, p224_2011$B2_sre, col="red", pch=19, cex=2)
plot(p224_2011$B2_sre, p224_2011$B1_sre, col="red", pch=19, cex=2)
# funzione pairs mette in correlazione a due a due le variabili di un certo dataset
pairs(p224_2011)



















