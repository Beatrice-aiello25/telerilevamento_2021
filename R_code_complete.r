# R code complete - Telerilevamento Geo-Ecologico

#----------------------------------------------

# Summary:

# 1. Remote sensing - first code
# 2. R code time series
# 3. R code Copernicus data
# 4. R code knitr
# 5. R code multivariate analysis
# 6. R code classification
# 7. R code ggplot2
# 8. R code vegetation indices 
# 9. R code land cover
# 10. R code variability

#---------------------------------------------------

# 1. Remote sensing - first code

# il mio primo codice in R per il telerilevamento!

# Codice per installazione pacchetti aggiuntivi raster
install.packages("raster")

# Funzione library per richiamare il pacchetto raster
library(raster)

# Indicare la cartella da cui estrarre i dati
library(raster)

# Funzione brick per importare i dati
p224r63_2011 <- brick("p224r63_2011_masked.grd")

# Funzione per avere informazioni sulle bande
p224r63_2011

# Funzione plot immagini per visualizzare le varie bande 
plot(p224r63_2011) 

# Funzione colorRampPalette stabilisce una determinata palette di colori
cl <- colorRampPalette(c("black", "grey", "light grey"))(100)

# Funzione plot 
plot(p224r63_2011, col= cl)

# Funzione plot colour change new
cl <- colorRampPalette(c("blue", "green", "yellow", "red", "light blue"))(100)
plot(p224r63_2011, col= cl)

# Funzione plot colour change new2
cl <- colorRampPalette(c("blue", "green", "orange", "red", "light blue", "purple"))(100)
plot(p224r63_2011, col= cl)

##### DAY 3
# Funzione library per richiamare il pacchetto raster
library(raster)

# Indicare la cartella da cui estrarre i dati
setwd("C:/lab/")

# Bande Landsat
# B1: blu
# B2: verde
# B3: rosso
# B4: infrarosso vicino
# B5: infrarosso medio
# B6: infrarosso termico
# B7: infrarosso medio

# funzione dev.off ripulisce la grafica
dev.off()

# Funzione brick per importare i dati
p224r63_2011 <- brick("p224r63_2011_masked.grd")


# Funzione plot
plot(p224r63_2011$B1_sre)

# plot band 1 with a predefined colut ramp palette

# Funzione colorRampPalette stabilisce una determinata palette di colori
cl <- colorRampPalette(c("blue", "light blue", "dark blue"))(100)

# Funzione plot 
plot(p224r63_2011$B1_sre, col= cl)

# Funzione plot colour change new
cl <- colorRampPalette(c("blue", "turquoise", "light blue", "dark blue"))(100)
plot(p224r63_2011$B1_sre, col= cl)

# funzione dev.off ripulisce la grafica
dev.off()

# Funzione plot
plot(p224r63_2011$B1_sre)

# Funzione plot
plot(p224r63_2011$B2_sre)

# Funzione par permette di personalizzare la visualizzazione delle bande 
# 1 riga, 2 colonne
par(mfrow=c(1,2))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)

# 2 riga, 1 colonne
par(mfcol=c(2,1))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)

# Plot le prime 4 bande di landsat
par(mfrow=c(4,1))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
plot(p224r63_2011$B3_sre)
plot(p224r63_2011$B4_sre)

# distribuzione quadrata delle bande, 2 righe, 2 colonne
par(mfrow=c(2,2))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
plot(p224r63_2011$B3_sre)
plot(p224r63_2011$B4_sre)

# distribuzione quadrata delle bande, 2 righe, 2 colonne
par(mfrow=c(2,2))

# Cambio la colorazione delle bande
clb <- colorRampPalette(c("dark blue", "light blue", "blue"))(100)
plot(p224r63_2011$B1_sre, col=clb)

clg <- colorRampPalette(c("green", "light green", "dark green"))(100)
plot(p224r63_2011$B2_sre, col=clg)

clr <- colorRampPalette(c("dark red","red","pink")) (100)
plot(p224r63_2011$B3_sre, col=clr)

clnir <- colorRampPalette(c("orange","red","yellow")) (100)
plot(p224r63_2011$B4_sre, col=clnir)


# distribuzione quadrata delle bande, 2 righe, 2 colonne
par(mfrow=c(2,2))

# Cambio la colorazione delle bande
clb <- colorRampPalette(c("dark blue", "light blue", "blue"))(100)
plot(p224r63_2011$B1_sre, col=clb)

clg <- colorRampPalette(c("dark green", "light green", "green"))(100)
plot(p224r63_2011$B2_sre, col=clg)

clr <- colorRampPalette(c("dark red","red","pink")) (100)
plot(p224r63_2011$B3_sre, col=clr)

clnir <- colorRampPalette(c("orange","red","yellow")) (100)
plot(p224r63_2011$B4_sre, col=clnir)

### DAY 4

# Visualizzazione dati in RGB

# Funzione library per richiamare il pacchetto raster
library(raster)

# Indicare la cartella da cui estrarre i dati
 setwd("C:/lab/")

# Funzione brick per importare i dati
p224r63_2011 <- brick("p224r63_2011_masked.grd")

# Bande Landsat
# B1: blu
# B2: verde
# B3: rosso
# B4: infrarosso vicino
# B5: infrarosso medio
# B6: infrarosso termico
# B7: infrarosso medio

# Funzione plotRGB 
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")

# Funzione plotRGB 2
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")

# Funzione plotRGB 3
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")

# Funzione plotRGB 4
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")

# Exercise: mount a 2x2 multiframe

# distribuzione quadrata delle bande, 2 righe, 2 colonne
par(mfrow=c(2,2))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")

# Genero il mio pdf
pdf("il_mio_primo_pdf_con_R.pdf")
par(mfrow=c(2,2))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")
dev.off()

# Funzione stretch
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="hist")

# Genero il mio multiframe con la funzione par: immagine colori naturali, immagine falsi colori, immagine histogram stretching
par(mfrow=c(3,1))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="hist")
 
#### DAY 5

# Codice per installazione pacchetti aggiuntivi RStoolbox
install.packages("RStoolbox")

# Funzione library per richiamare il pacchetto RStoolbox
library(RStoolbox)


#### DAY 6

# Funzione library per richiamare il pacchetto raster
library(raster)

# Indicare la cartella da cui estrarre i dati
setwd("C:/lab/")

# Funzione brick per importare i dati
p224r63_2011 <- brick("p224r63_2011_masked.grd")
p224r63_2011

# Multitemporal set
# Funzione brick per importare i dati
 p224r63_1988 <- brick("p224r63_1988_masked.grd")
 p224r63_1988

# Bande Landsat
# B1: blu
# B2: verde
# B3: rosso
# B4: infrarosso vicino
# B5: infrarosso medio
# B6: infrarosso termico
# B7: infrarosso medio

# Funzione plotRGB 
plotRGB(p224r63_1988, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")

# distribuzione quadrata delle bande, 2 righe, 1 colonna
par(mfrow=c(2,1))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_1988, r=3, g=2, b=1, stretch="Lin")

# distribuzione quadrata delle bande, 2 righe, 1 colonna
par(mfrow=c(2,1))
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")

# hist
par(mfrow=c(2,2))
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_1988, r=3, g=2, b=1, stretch="hist")
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="hist")
# hist
pdf("multitemp.pdf")
par(mfrow=c(2,2))
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="hist")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="hist")
dev.off()


#---------------------------------------------------


# 2. R code time series

# Time series analysis 
# Greenland increase of temperature 
# Data and code from Emanuela Costa

# Funzione library per richiamare il pacchetto raster
library(raster)

# Indicare la cartella da cui estrarre i dati
setwd("C:/lab/greenland") 

# Funzione raster per caricare i singoli dati 
lst_2000 <- raster ("lst_2000.tif")

# Funzione plot
plot(lst_2000)
lst_2005 <- raster ("lst_2005.tif")
# Funzione plot
plot(lst_2005)
lst_2010 <- raster ("lst_2010.tif")
lst_2015 <- raster ("lst_2015.tif")

par(mfrow=c(2,2))
plot(lst_2000)
plot(lst_2005)
plot(lst_2010)
plot(lst_2015)

# Funzione list.files crea una lista di file
list.files()

rlist <- list.files(pattern="lst")
rlist

# Funzione lapply permette di importare la lista di file e applicarvi la funzione raster
import <- lapply(rlist,raster)

import

# Funzione stack crea un unico pacchetto di file
TGr <- stack(import)
plot(TGr)
plotRGB(TGr, 1, 2, 3, stretch="Lin")
plotRGB(TGr, 2, 3, 4, stretch="Lin")

## DAY 9

# Funzione library per richiamare il pacchetto raster
library(rasterVis)

# Indicare la cartella da cui estrarre i dati
setwd("C:/lab/greenland") 


rlist <- list.files(pattern="lst")

rlist import <- lapply(rlist,raster)

import TGr <- stack(import)

TGr

# Funzione levelplot
levelplot(TGr)


cl <- colorRampPalette(c("purple","dark red","pink","red"))(100)
levelplot(TGr, col.regions=cl)

# Funzione per cambiare nome ad ogni livello
levelplot(TGr,col.regions=cl, names.attr=c("July 2000","July 2005", "July 2010", "July 2015"))

# Comando per inserire titolo al complesso di grafici
levelplot(TGr,col.regions=cl, main="LST variation in time",
          names.attr=c("July 2000","July 2005", "July 2010", "July 2015"))

# Melt Greenland

meltlist <- list.files(pattern="melt")
melt_import <- lapply(meltlist,raster)
melt<- stack(melt_import)
melt
levelplot(melt)

melt_amount <- melt$X2007annual_melt - melt$X1979annual_melt
clb <- colorRampPalette(c("blue","white","red"))(100)
plot(melt_amount, col=clb)

levelplot(melt_amount, col.regions=clb)

#--------------------------------------------------------

# 3. R code Copernicus data

# R_code_copernicus.r
# Visualizing Copernicus data

# install.packages("ncdf4")
library(raster)
library(ncdf4)

setwd("~/lab/") # Linux
# setwd("C:/lab/") # Windows
# setwd("/Users/name/Desktop/lab/") # Mac 

albedo <- raster("c_gls_ALBH_202006130000_GLOBE_PROBAV_V1.5.1.nc")

cl <- colorRampPalette(c('light blue','green','red','yellow'))(100) # 
plot(albed0, col=cl)

# resampling
albedores <- aggregate(albedo, fact=100)
plot(albedores, col=cl)

#---------------------------------------------------

# 4. R code knitr
#R_code_knitr.r

# Indico la cartella da cui estrarre i dati
setwd("C:/lab)

# Funzione library per richiamare il pacchetto knitr
library(knitr)

# Funzione stitch
stitch("r_code_greenland.r.txt", template=system.file("misc", "knitr-template.Rnw", package="knitr"))
# viene generato un file tex nella cartella lab
R_code_greenland.tex
# apriamo il file con un programma di testo blocco note, codice che verrà poi copiato su overleaf per poter generare un pdf


#---------------------------------------------------

# 5. R code multivariate analysis

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

#---------------------------------------------------

# 6. R code classification

# setto della working directory, indicando la cartella da cui estrarre i dati
setwd("C:/lab/")

library(raster)
library(RStoolbox)

# funzione brick ci permette di importare un'immagine dall'esterno
so <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")

# visualizzare i livelli con RGB
plotRGB(so, 1, 2, 3, stretch="lin")

install.packages("RStoolbox")
library(RStoolbox)

# Classificazione non supervisionata,funzione unsuperClass 
soc <- unsuperClass(so, nClasses=3)

# Funzione plot
plot(soc$map)

# Classificazione non supervisionata,funzione unsuperClass con 20 classi 
set.seed(42)
sor <- unsuperClass(so, nClasses=20)
plot(sor$map)

# Dowload an image from: 
#https://www.esa.int/ESA_Multimedia/Missions/Solar_Orbiter/(result_type)/images

sun <- brick("Solar_Orbiter_sun.jpg")
# Classificazione non supervisionata,funzione unsuperClass 
sunc <- unsuperClass(sun, nClasses=3)
plot(sunc$map)
suns <- brick("The_Sun_png.png")
# Classificazione non supervisionata,funzione unsuperClass 
sunr <- unsuperClass(suns, nClasses=10)
plot(sunr$map)

## Grand Canyon Landsat
# https://landsat.visibleearth.nasa.gov/view.php?id=80948

#Funzione library per richiamare il pacchetto che ci interessa
library(raster)
library(RStoolbox)
# setto della working directory, indicando la cartella da cui estrarre i dati
setwd("C:/lab/")

# funzione brick per inserire l'immagine in RGB
gc <- brick("dolansprings_oli_2013088_canyon_lrg.jpg")
# funzione plot per visualizzare i livelli con RGB
plotRGB(gc, r=1, g=2, b=3, stretch="lin")
plotRGB(gc, r=1, g=2, b=3, stretch="hist")

# Classificazione non supervisionata,funzione unsuperClass 
gcc2 <- unsuperClass(gc, nClasses=2)
gcc2
plot(gcc2$map)

gcc3 <- unsuperClass(gc, nClasses=4)
gcc3
plot(gcc3$map)

#---------------------------------------------------

# 7. R code ggplot2

library(raster)
library(RStoolbox)
library(ggplot2)
library(gridExtra)

setwd("~/lab/")

p224r63 <- brick("p224r63_2011_masked.grd")

ggRGB(p224r63,3,2,1, stretch="lin")
ggRGB(p224r63,4,3,2, stretch="lin")

p1 <- ggRGB(p224r63,3,2,1, stretch="lin")
p2 <- ggRGB(p224r63,4,3,2, stretch="lin")

grid.arrange(p1, p2, nrow = 2) # this needs gridExtra

#------------------------------------------------

# 8. R code vegetation indices 
 
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

#------------------------------------------------

# 9. R code land cover

### R_code_land_cover_temp.r

library(raster)
library(RStoolbox)
#install.packages("ggplot2") funziona con qualsiasi dataset
library(ggplot2)
library(gridExtra)
# Set della working directory 
setwd("C:/lab/")

# NIR 1, RED 2, GREEN 3

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

## 07/05

# inserisco le librerie che mi serviranno 
library(raster)
library(RStoolbox)
library(ggplot2)

# Set della working directory 
setwd("C:/lab/")

# funzione brick per importare i dati
defor1 <- brick("defor1.jpg")
defor2 <- brick("defor2.jpg")

# classificazione non supervisionata
d1c <- unsuperClass(defor1, nClasses=2)
plot(d1c$map)
# classe 1: forest
# classe 2: agriculture

# set.seed() would allow you to attain the same results ...

d2c <- unsuperClass(defor2, nClasses=2)
plot(d2c$map)
# class 1: agriculture
# class 2: forest

# Classificazione con 3 classi
d2c3 <- unsuperClass(defor2, nClasses=3)
plot(d2c3$map)

# calcolo delle frequenze dei pixel
freq(d1c$map)
# value  count= risultati 
# [1,]     1  34371
# [2,]     2 306921
# somma totale dei pixel della prima immagine
s1 <- 306921+ 34371
# proporzione di pixel delle due classi nella prima immagine
prop1 <- freq(d1c$map)/s1
prop1
# prop agricoltura: 0.8992915
# prop foresta: 0.1007085
# somma totale dei pixel della seconda immagine
s2 <- 342726
# proporzione di pixel delle due classi nella seconda immagine
prop2 <- freq(d2c$map) / s2
prop2
# prop agricoltura: 0.5212969
# prop foresta: 0.4787031

# costruiamo un dataframe, mettiamo la c perchè sono due blocchi di una stessa parte
cover <- c("Forest", "Agriculture")
percent_1999 <- c(89.93, 10.07)
percent_2006 <- c(52.13, 47.87)

percentages <- data.frame(cover, percent_1999, percent_2006)

# dataframe creato
 cover percent_1999 percent_2006
1      Forest        89.93        52.13
2 Agriculture        10.07        47.87

# utilizziamo ggplot2 per creare un grafico con il dataframe appena realizzato
ggplot(percentages, aes(x=cover, y=percent_1999, color=cover)) + geom_bar(stat="identity", fill="white")
ggplot(percentages, aes(x=cover, y=percent_2006, color=cover)) + geom_bar(stat="identity", fill="white")

p1 <- ggplot(percentages, aes(x=cover, y=percent_1999, color=cover)) + geom_bar(stat="identity", fill="white")
p2 <- ggplot(percentages, aes(x=cover, y=percent_2006, color=cover)) + geom_bar(stat="identity", fill="white")

grid.arrange(p1, p2, nrow=1)

#------------------------------------------------

# 10. R code variability











































































