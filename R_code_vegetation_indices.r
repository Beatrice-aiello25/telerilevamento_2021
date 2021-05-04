R_code_vegetation_indices

# carico la libreria di riferimento
library(raster) 
# inserisco la libreria RStoolbx per calcolare l'indice di vegetazione
library(RStoolbox) 
# set della working directory indicando la cartella da cui andrò a prendere i dati
setwd("C:/lab/")

#funzione brick per importare i dati
defor1 <- brick ("defor1.jpg")
defor2 <- brick("defor2.jpg")

# b1= NIR, b2= red, b3= green
par(mfrow=c(2,1))
plotRGB(defor1, r=1, g=2, b=3, stretch="lin") 
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

# Indice di vegetazione time 1
# andiamo a cacolare la differenza tra la banda del NIR e la banda del rosso, informazioni che ricavo scrivendo defor1 su R
# uso il $ per associare il nome dell'immagine alla banda NIR e alla banda del rosso
# per ogni pixel prendiamo il suo valore nell'infrarosso e nel rosso e calcoliamo la loro differenza 
dvi1 <- defor1$defor1.1-defor1$defor1.2
# dev.off()
plot(dvi1)

# Cambio colorazione per la visualizzazione dell'immagine utilizzando la colorRampPalette time 1
cl <- colorRampPalette(c('darkblue', 'yellow', 'red', 'black'))(100)
plot(dvi1, col=cl, main="DVI at time 1")

# Indice di vegetazione time 2
# andiamo a cacolare la differenza tra la banda del NIR e la banda del rosso, informazioni che ricavo scrivendo defor1 su R
# uso il $ per associare il nome dell'immagine alla banda NIR e alla banda del rosso
# per ogni pixel prendiamo il suo valore nell'infrarosso e nel rosso e calcoliamo la loro differenza 
dvi2 <- defor2$defor2.1-defor2$defor2.2
plot(dvi2)

# Cambio colorazione per la visualizzazione dell'immagine utilizzando la colorRampPalette time 2
cl <- colorRampPalette(c('darkblue', 'yellow', 'red', 'black'))(100)
plot(dvi2, col=cl, main="DVI at time 2")

# faccio il plot delle immagini delle due immagini dvi
par(mfrow=c(2,1))
plot(dvi1, col=cl, main="DVI at time 1")
plot(dvi2, col=cl, main="DVI at time 2")

# Per ogni pixel faremo la differenza del dvi del primo momento temporale e del dvi del secondo momento temporale
difdvi<- dvi1-dvi2
# cambio colorazione per la visualizzazione dell'immagine utilizzando la colorRampPalette per difdvi
# dev.off()
cld <- colorRampPalette(c('blue','white','red'))(100)
plot(difdvi, col=cld)

# andiamo a calcolare l'NDVI
# (NIR-RED) / (NIR+RED)
# andiamo a legare le variabili con il $
ndvi1 <- (defor1$defor1.1-defor1$defor1.2)/ (defor1$defor1.1+defor1$defor1.2)
plot(ndvi1, col=cl)

# RStoolbox 

ndvi2 <- (defor2$defor2.1-defor2$defor2.2)/ (defor2$defor2.1+defor2$defor2.2)
plot(ndvi2, col=cl)
par(mfrow=c(2,1))
plot(ndvi1, col=cl)
plot(ndvi2, col=cl)

# RStoolbox: Funzione spectralIndices calcola una serie di indici multispettrali come NDVI in modo efficiente
# vado a vedere come inserire gli argomenti per questa funzione che vengono dichiarati nella sua descrizione 
vi1 <- spectralIndices(defor1, green=3, red=2, nir=1)
plot(vi1, col=cl)
vi2 <- spectralIndices(defor2, green=3, red=2, nir=1)
plot(vi2, col=cl)

# calcolo la differenza delle due NDVI
difndvi <- ndvi1 - ndvi2

# dev.off()
# faccio il plot della differenza delle due NDVI
cld <- colorRampPalette(c('blue','white','red'))(100) 
plot(difndvi, col=cld)


