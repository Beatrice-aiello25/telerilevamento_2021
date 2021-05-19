## R_code_variability.r

# carico le librerie che mi serviranno per analizzare i dati
library(raster)
library(RStoolbox)
# set della working directory con la quale lavoreremo
setwd("C:/lab/")

# utilizzo la funzione brick per importare tutto il blocco di dati uscendo da R, per questo utilizzo le virgolette
sent <-brick("sentinel.png")

# plottaggio dell'immagine a tre livelli con la funzione plotRGB
# NIR 1, RED 2, GREEN 3
# r=1, g=2, b=3
plotRGB(sent) # plotRGB(sent, r=1, g=2, b=3, stretch="lin")

plotRGB(sent, r=2, g=1, b=3, stretch="lin")
# associamo le bande dell'immagine
nir <- sent$sentinel.1
red <- sent$sentinel.2
ndvi <- (nir-red) / (nir+red)
# cambio la colorazione dell'immagine
cl <- colorRampPalette(c('black', 'red', 'white', 'magenta', 'green')) (100)
plot(ndvi, col=cl)

## calcolo della deviazione standard
# utilizzo la funzione focal ("moving window") values for the neighborhood of focal cells using a matrix of weights, perhaps in combination with a function.
ndvisd3 <- focal(ndvi, w=matrix(1/9, nrow=3,ncol=3), fun=sd)
plot(ndvisd3)
# cambio la colorazione dell'immagine
clsd <- colorRampPalette(c('blue', 'green', 'pink', 'magenta', 'orange', 'brown', 'red', 'yellow')) (100)
plot(ndvisd3, col=clsd)

pc1-devst <- focal(pc1, w=matrix(1/9, nrow=3,ncol=3), fun=sd)
#calcolo della media della deviazione standard
# finestra di 3*3 pixel
ndvimean3 <- focal(ndvi, w=matrix(1/9, nrow=3,ncol=3), fun=mean)
clsd <- colorRampPalette(c('blue', 'green', 'pink', 'magenta', 'orange', 'brown', 'red', 'yellow')) (100)
plot(ndvimean3, col=clsd)

# finestra di 13*13 pixel
ndvisd13 <- focal(ndvi, w=matrix(1/169, nrow=13,ncol=13), fun=sd)
plot(ndvi13)
clsd <- colorRampPalette(c('blue', 'green', 'pink', 'magenta', 'orange', 'brown', 'red', 'yellow')) (100)
plot(ndvisd13, col=clsd)

# finestra di 5*5 pixel
ndvisd5 <- focal(ndvi, w=matrix(1/25, nrow=5,ncol=5), fun=sd)
plot(ndvi5)
clsd <- colorRampPalette(c('blue', 'green', 'pink', 'magenta', 'orange', 'brown', 'red', 'yellow')) (100)
plot(ndvisd5, col=clsd)

# calcolo dell'analisi multivariata PCA
sentpca <- rasterPCA(sent)
summary(sentpca$model)



