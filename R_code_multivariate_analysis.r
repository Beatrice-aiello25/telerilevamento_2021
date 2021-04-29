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

# funzione plot
plot(p224_2011$B1_sre, p224_2011$B2_sre, col="red", pch=19, cex=2)
plot(p224_2011$B2_sre, p224_2011$B1_sre, col="red", pch=19, cex=2)
# funzione pairs mette in correlazione a due a due le variabili di un certo dataset
pairs(p224_2011)

# funzione aggregate, aggrega i pixel facendo una media con l’obiettivo di diminuire la risoluzione dell'immagine, aumentando la dimensione del pixel
p224_2011res <- aggregate(p224_2011, fact=10)

# funzione plot per visualizzare l'immagine
par(mfrow=c(2,1))
plotRGB(p224_2011, r=4, g=3, b=2, stretch=”lin”)
plotRGB(p224_2011res, r=4, g=3, b=2, stretch=”lin”)

# funzione rasterPCA (Principal component analysis) : prende il pacchetto di dati e lo compatta in un numero minore di bande
p224_2011res_pca <- rasterPCA(p224_2011res)

# Funzione summary ci dà un sommario per il nostro modello, utilizzo il $ per legare due componenti
summary(p224_2011res_pca$model)

# funzione plot per visualizzare l'immagine
plot(p224_2011res_pca$map)

# funzione plot per visualizzare l'immagine
plotRGB(p224_2011res_pca$map, r=1, g=2, b=3, stretch=”lin”)





