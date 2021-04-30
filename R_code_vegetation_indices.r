R_code_vegetation_indices

# carico la libreria di riferimento
library(raster) 
# inserisco la libreria RStoolbx per calcolare l'indice di vegetazione
library(RStoolbox) 
# set della working directory indicando la cartella da cui andrò a prendere i dati
setwd("C:/lab/")

#funzione brick per importare dei dati
defor1 <- brick ("defor1.jpg")
defor2 <- brick("defor2.jpg")

# b1= NIR, b2= red, b3= green
par(mfrow=c(2,1))
plotRGB(defor1, r=1, g=2, b=3, stretch="lin") 
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

# indice di vegetazione time 1
dvi <- defor1$defor1.1-defor1$defor1.2
# dev.off()
plot(dvi)

#colorRampPalette time 1
cl <- colorRampPalette(c"yellow","black", "orange", "red"))(100)
plot(dvi, col=cl, main="DVI at time 1")

# indice di vegetazione time 2
dvi2 <- defor2$defor2.1-defor2$defor2.2
plot(dvi2)

#colorRampPalette time 2
cl <- colorRampPalette(c"yellow","black", "orange", "red"))(100)
plot(dvi2, col=cl, main="DVI at time 2")
 
par(mfrow=c(2,1))
plot(dvi, col=cl, main="DVI at time 1")
plot(dvi2, col=cl, main="DVI at time 2")

# per ogni pixel faremo la differenza del dvi time1 e dvi time 2
difdvi<- dvi-dvi2
# colorRampPalette difdvi
# dev.off()
cld <- colorRampPalette(c('blue','white','red'))(100)
plot(difdvi, col=cld)

# andiamo a calcolare l'ndvi 
# (NIR-RED) / (NIR+RED)
ndvi1 <- (defor1$defor1.1-defor1$defor1.2)/ (defor1$defor1.1+defor1$defor1.2)
plot(ndvi1, col=cl)

#RStoolbox 

ndvi2 <- (defor2$defor2.1-defor1$defor2.2)/ (defor2$defor2.1+defor1$defor2.2)
plot(ndvi1, col=cl)
par(mfrow=c(2,1))
plot(ndvi1, col=cl)
plot(ndvi2, col=cl)

# Funzione spectralIndices calcola una serie di indici multispettrali come NDVI in modo efficiente.
vi1 <- spectralIndices(defor1, green=3, red=2, nir=1)
plot(vi, col=cl)
vi2 <- spectralIndices(defor2, green=3, red=2, nir=1)
plot(vi2, col=cl)

difndvi <- ndvi1 - ndvi2

# dev.off()
cld <- colorRampPalette(c('blue','white','red'))(100) 
plot(difndvi, col=cld)


