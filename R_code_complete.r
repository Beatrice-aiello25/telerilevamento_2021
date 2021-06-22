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
# 11. R code spectral signatures

#---------------------------------------------------

# 1. Remote sensing - first code

# il mio primo codice in R per il telerilevamento!

#la funzione sewd (set working directory) serve a richiamare una specifica cartella di lavoro (directory), in questo caso è "lab", inoltre utilizziamo le virgolette perchè usciamo fuori da R
setwd("C:/lab/")

# Codice per installazione pacchetti aggiuntivi raster
install.packages("raster")

# Funzione library per richiamare il pacchetto raster precedentemente installato
library(raster)

# Funzione brick ci permette di importare i dati presenti nell cartella lab
p224r63_2011 <- brick("p224r63_2011_masked.grd")

# scrivendo il nome dell'oggetto è possibile ottenere tutte le caratteristiche, come ad esempio le informazioni sulle bande dell'immagine
p224r63_2011

# Funzione plot immagini per visualizzare le varie bande 
plot(p224r63_2011) 

# Funzione colorRampPalette stabilisce una determinata palette di colori. è necessario associare un nome ad ogni funzione. il 100 sta ad indicare il numero di livelli delle bande, maggiore è questo numero, maggiori saranno le sfumature dell'immagine 
cl <- colorRampPalette(c("black", "grey", "light grey"))(100)

# Funzione plot 
plot(p224r63_2011, col= cl)

# Funzione plot colour change new
cl <- colorRampPalette(c("blue", "green", "yellow", "red", "light blue"))(100)
plot(p224r63_2011, col= cl)

# Funzione plot colour change new2
cl <- colorRampPalette(c("blue", "green", "orange", "red", "light blue", "purple"))(100)
plot(p224r63_2011, col= cl)

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
# utilizzo il simbolo $ per associare due oggetti, ad esempio plottiamo l'immagine p224r63_2011 con la sola banda del blu 
plot(p224r63_2011$B1_sre)
# plot band 1 with a predefined colorRampPalette
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

# Funzione par permette di plottare e personalizzare la visualizzazione delle bande. ciò che viene fuori è un multiframe ovvero la proiezione di due o più bande insieme 
# con "mfrow" inseriamo prima le righe
# con "mcol" inseriamo prima le colonne
# 1 riga, 2 colonne
par(mfrow=c(1,2))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)

# 2 riga, 1 colonne
par(mfcol=c(2,1))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)

# Proietto le prime 4 bande di landsat
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

# Funzione plotRGB crea un grafico a tre bande (rosso, verde, blu), viene inoltre utilizzata per proiettare immagini a "colori reali" da landsat o altri satelliti, ma devono rispettare un ordine ben preciso (3,2,1)
#la funzione stretch serve a visualizzare le bande inserite da 0 a 1, anche laddove queste non coprano tutto il campo da 0 a 1 
#in questo caso l'infrarosso vicino è montato sulla banda del rosso (e cosi viene visualizzato), il rosso su quella del verde ed il verde su quella del blu. la banda del blu viene cosi non considerata (si possono visualizzare solo 3 bande per volta).
plotRGB(p224r63_2011,r=4,g=3,b=2,stretch="Lin")
# qui di seguito le bande vengono montate nell'ordine di visualizzazione delle immagini a "colori reali"
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")

# Funzione plotRGB 2
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
# Funzione plotRGB 3
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
# Funzione plotRGB 4
# montando le bande in questo modo l'infrarosso vicino viene visualizzato come verde, la parte viola rappresenta invece il suolo nudo in questo tipo di montaggio.
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")
# A seconda di come vengono montate le bande avremo visualizzazioni differenti, alcuni elementi verranno visualizzati meglio in particolari combinazioni rispetto ad altre
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

# Codice per installazione pacchetti aggiuntivi RStoolbox
install.packages("RStoolbox")

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
# attraverso lo strecth "hist" è possibile stretchare ancora di più i valori centrali, permettendo cosi di evidenziare meglio differenze all'interno del patch forestale.
# negli studi di vegetazione l'infrarosso vicino viene montato sulla componente red, non c'è una visualizzazione migliore di altre.
par(mfrow=c(2,2))
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_1988, r=3, g=2, b=1, stretch="hist")
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="hist")
# hist
# genero quindi in pdf in cui sono raccolte le immagini del 1988 e del 2011 in RGB
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

# Funzione raster per caricare i singoli dati, a differenza della funzione "brick" che permette di caricare pacchetti di dati, multiple layer
lst_2000 <- raster ("lst_2000.tif")

# Funzione plot
plot(lst_2000)
lst_2005 <- raster ("lst_2005.tif")
# Funzione plot
plot(lst_2005)
lst_2010 <- raster ("lst_2010.tif")
lst_2015 <- raster ("lst_2015.tif")
# funzione par
par(mfrow=c(2,2))
plot(lst_2000)
plot(lst_2005)
plot(lst_2010)
plot(lst_2015)

# Funzione list.files crea una lista di file
list.files()
# si utilizza la scritta 'pattern' per tutti gli oggetti che stiamo inserendo nella lista, questi devono avere un carattere comune e verranno presi di default dalla working directory
rlist <- list.files(pattern="lst")
rlist

# Funzione lapply permette di importare la lista di file e applicarvi la stessa funzione ad una lista di file senza importarli uno per volta
import <- lapply(rlist,raster)
import

# Funzione stack permette di unire i fil e creare un unico pacchetto 
TGr <- stack(import)
plot(TGr)
plotRGB(TGr, 1, 2, 3, stretch="Lin")
plotRGB(TGr, 2, 3, 4, stretch="Lin")
rlist <- list.files(pattern="lst")
rlist import <- lapply(rlist,raster)
import TGr <- stack(import)
TGr

# Funzione levelplot
levelplot(TGr)
cl <- colorRampPalette(c("purple","dark red","pink","red"))(100)
# levelplot ci fornisce un layout maggiormente chiaro rispetto al solo plot (in questo specifico caso), permettendoci una migliore analisi multitemporale.
# gli strati di una immagine stack si chiamano attributi (in TGr abbiamo 4 attributi: lst_20-00/05/10/15).
levelplot(TGr, col.regions=cl)
# Funzione per cambiare nome ad ogni livello
# è possibile modificare il layout del levelplot andando a modificare gli attributi negli argomenti della funzione levelplot. 
# nel caso specifico del rasterstack TGr, se si vogliono modificare i titoli delle immagini (di default uguali ai nomi dei singoli file) si agisce sull'argomento names.attr che serve a nominare i singoli attributi.
levelplot(TGr,col.regions=cl, names.attr=c("July 2000","July 2005", "July 2010", "July 2015"))

# attraverso la funzione main posso inserire titolo al complesso di grafici
levelplot(TGr,col.regions=cl, main="LST variation in time",names.attr=c("July 2000","July 2005", "July 2010", "July 2015"))

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

# set della working directory
setwd("C:/lab/") # Windows
albedo <- raster("c_gls_ALBH_202006130000_GLOBE_PROBAV_V1.5.1.nc")

cl <- colorRampPalette(c('light blue','green','red','yellow'))(100) # 
plot(albed0, col=cl)

# resampling
albedores <- aggregate(albedo, fact=100)
plot(albedores, col=cl)

#---------------------------------------------------

# 4. R code knitr
#R_code_knitr.r
#il pacchetto knitr permette di generare report

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
# mi indica tutte le informazioni e le caratteristiche dell'immagine
p224_2011

# funzione plot
plot(p224_2011$B1_sre, p224_2011$B2_sre, col="red", pch=19, cex=2)
plot(p224_2011$B2_sre, p224_2011$B1_sre, col="red", pch=19, cex=2)
# La banda 1 e la banda 2 sono strettamente correlate tra di loro perché il loro indice di correlazione (indice di Pearson) è 0,93, più è vicino a 1, maggiore sarà il loro grado di correlazione. La PC1 passa per il gradiente più grande, che spiegherà la variabilità maggiore, rispetto alla PC2, per cui questo sistema mi permette di ridurre il sistema da due bande, a una sola
# funzione pairs mette in correlazione a due a due le variabili di un certo dataset
pairs(p224_2011)

# funzione aggregate, aggrega i pixel facendo una media con l’obiettivo di diminuire la risoluzione dell'immagine, aumentando la dimensione del pixel
# fact rappresenta il valore di quanto vogliamo diminuire la risoluzione
# res: resampling
p224_2011res <- aggregate(p224_2011, fact=10)

# funzione plot per visualizzare l'immagine
par(mfrow=c(2,1))
plotRGB(p224_2011, r=4, g=3, b=2, stretch=”lin”)
plotRGB(p224_2011res, r=4, g=3, b=2, stretch=”lin”)

# funzione rasterPCA (Principal component analysis) : prende il pacchetto di dati e lo compatta in un numero minore di bande, dà come risultato una mappa e un modello
p224_2011res_pca <- rasterPCA(p224_2011res)

# Funzione summary ci dà un sommario per il nostro modello, utilizzo il $ per legare due componenti, in questo modo ci dà informazioni rispetto alle proporzioni delle componenti per spiegare la varianza 
#la prima componente è sempre quella che spiega la maggiore variabilità
summary(p224_2011res_pca$model)

# funzione plot associata a '$map' per visualizzare le immagini dopo l'analisi multivariata 
plot(p224_2011res_pca$map)

# funzione plot per visualizzare l'immagine
plotRGB(p224_2011res_pca$map, r=1, g=2, b=3, stretch=”lin”)
# il verde rappresenta la neve e il blu indicano le praterie d'alta quota 

#---------------------------------------------------

# 6. R code classification

# setto della working directory, indicando la cartella da cui estrarre i dati
setwd("C:/lab/")

library(raster)
library(RStoolbox)

# funzione brick ci permette di importare un'immagine dall'esterno di R
so <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")

# visualizzare i livelli con RGB
plotRGB(so, 1, 2, 3, stretch="lin")
install.packages("RStoolbox")
library(RStoolbox)
# Maximum likelihood, ovvero massimogrado di somiglianza-> un pixel viene assegnato ad una classe di appartanenza rispetto alla riflettanza nelle varie bande,si calcola la distanza del centroide delle diverse nuvole, verrà quindi assegnato alla nuvola di pixel con la distanza minore. 
#ciò viene fatto attraverso una classificazione non-supervisionata-> compiuta attraverso i training-set (pixel guida scelti dal software) il cui numero è fissato dall'operatore, cosi come il numero delle classi
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

# funzione brick per inserire l'immagine in RGB
gc <- brick("dolansprings_oli_2013088_canyon_lrg.jpg")
# funzione plot per visualizzare i livelli con RGB
plotRGB(gc, r=1, g=2, b=3, stretch="lin")
# hist crea un effetto ancora più ampio di stretch
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

# set della working directory indicando la cartella da cui andrò a prendere i dati
setwd("C:/lab/")

#funzione brick per importare i dati
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
# immagini la cui banda dell'infrarosso è montata sulla componente rossa
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
# NDVI=(NIR-RED) / (NIR+RED)
# è necessario scrivere le operazioni tra parentesi 
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

# La zona tra il rosso e l’infrarosso viene definita red edge più è alta questa pendenza più sana la vegetazione, se la vegetazione sta morendo non fa più fotosintensi, non assorbono più perché le cellule a palizzata collassano, diminuisce la pendenza.
Red edge ->maggiore è questo valore maggiore sarà la qualità dello stato di salute della vegetazione

# calcolo la differenza delle due NDVI
difndvi <- ndvi1 - ndvi2

# dev.off()
# faccio il plot della differenza delle due NDVI
cld <- colorRampPalette(c('blue','white','red'))(100) 
plot(difndvi, col=cld)

#------------------------------------------------

# 9. R code land cover

## R_code_land_cover_temp.r

library(raster)
library(RStoolbox)
#install.packages("ggplot2") funziona con qualsiasi dataset
library(ggplot2)
# gridExtra -> multiframe con ggplot 
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
# la funzione grid.arrange permette di unire due plot distinti in uno unico
grid.arrange(p1,p2, nrow=2)

# classificazione non supervisionata
d1c <- unsuperClass(defor1, nClasses=2)
plot(d1c$map)
# classe 1: forest
# classe 2: agriculture

# set.seed() permette di raggiungere gli stessi risultati nonostante la classificazione avvenga in maniera randomica

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
# la funzione data.frame 
# creo un dataframe a tre colonne, la copertura vegetale, la percentuale nel 1999 e la percentuale nel 2006 
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

#------------------------------------------------

# 11. R_code_spectral_signatures


# R_code_spectral_signatures

# Funzione library per richiamare il pacchetto raster precedentemente installato
library(raster)
library(rgdal)
library(ggplot2)
#la funzione sewd (set working directory) serve a richiamare una specifica cartella di lavoro (directory), in questo caso è "lab", inoltre utilizziamo le virgolette perchè usciamo fuori da R
setwd("C:/lab/")
# Funzione brick per importare i dati, anche qui utilizziamo le virgolette perchè peschiamo i dati al di fuori di R
defor2 <- brick("defor2.jpg")
# defor2.1, defor2.2, defor2.3
# Nir, red, green 
# funzione plot defor2
plotRGB(defor2, r=1, g=2, b=3,  stretch="lin")
plotRGB(defor2, r=1, g=2, b=3,  stretch="hist")

# funzione click per seleionare le firme spettrali
# id= valore identificativo per ogni punto, xy= vogliamo utilizzare un'info spaziale ,cell= pixel, type= punti, pch= caratteristica del punto(apice)
click(defor2, id=T, xy=T, cell=T, type="p", pch=16, cex=4, col="yellow")
## pixel vegetazione
# defor2.1= 217  ottengo un valore molto alto di riflettanza perchè si tratta della banda del NIR 
# defor2.2= 6    ho un valore molto basso perchè si tratta della banda del rosso ed essendo vegetazione in questa determinata banda assorbe
# defor2.3= 20   valore medio basso per la banda del verde 

## pixel corso d'acqua
# defor2.1= 51 riflettanza molto bassa nell'infrarosso
# defor2.2= 92 riflettanza alta in rosso
# defor2.3= 136 riflettanza ancora più alta nel verde

# costruiamo le colonne del nostro dataset:
# c sta per characters
# nella colonna corrispondente a forest e water inseriremo i valori di riflettanza ottenuti corrispondenti a ciascuna banda
band <- c(1,2,3)
forest <- c(217,6,20)
water <- c(51,92,136)
# creaiamo la nostra tabella, con la funzione data.frame
spectrals <- data.frame (band,forest, water)

# band forest water
# 1    1    217    51
# 2    2      6    92
# 3    3     20   136

# vado a plottare le firme spettrali con la funzione ggplot
# aes: estetics
ggplot(spectrals, aes(x=band)) + geom_line(aes(y=forest), color="green") + geom_line(aes(y=water), color="blue") 
labs(x="band",y="reflectance")

## Multitemporal 

# Funzione brick per importare i dati, anche qui utilizziamo le virgolette perchè peschiamo i dati al di fuori di R
defor1 <- brick("defor1.jpg")
# funzione plot
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")
# firme spettrali di defor1
# funzione click per seleionare le firme spettrali
# time 1
click(defor1, id=T, xy=T, cell=T, type="p", pch=16, cex=4, col="yellow")

#     x     y   cell defor1.1 defor1.2 defor1.3
# 1 34.5 333.5 102851      218       17       35
#     x     y  cell defor1.1 defor1.2 defor1.3
# 1 50.5 339.5 98583      224       10       34
#      x     y  cell defor1.1 defor1.2 defor1.3
# 1 87.5 339.5 98620      215       12       32
#      x     y  cell defor1.1 defor1.2 defor1.3
# 1 77.5 374.5 73620      199        1       18
#     x     y  cell defor1.1 defor1.2 defor1.3
# 1 87.5 395.5 58636      230       33       63

# time 2
click(defor2, id=T, xy=T, cell=T, type="p", pch=16, cex=4, col="yellow")

#    x     y  cell defor2.1 defor2.2 defor2.3
# 1 86.5 338.5 99750      198      162      150
#      x     y   cell defor2.1 defor2.2 defor2.3
# 1 101.5 335.5 101916      171      170      150
#       x     y  cell defor2.1 defor2.2 defor2.3
# 1 111.5 345.5 94756      213      195      175
#      x     y  cell defor2.1 defor2.2 defor2.3
# 1 101.5 366.5 79689      204       23       38
#     x     y  cell defor2.1 defor2.2 defor2.3
# 1 90.5 375.5 73225      217       16       32
 
# costruiamo le colonne del nostro dataset:
band <- c(1,2,3)
time1 <- c(218,17,35)
time2 <- c(198,162,150)
spectralst <- data.frame(band, time1, time2)

# vado a plottare le firme spettrali con la funzione ggplot
# aes: estetics
ggplot(spectrals, aes(x=band)) + geom_line(aes(y=time1), color="red") + geom_line(aes(y=time2), color="grey") 
labs(x="band",y="reflectance")

band <- c(1,2,3)
time1 <- c(218,17,35)
time1p2 <- c(224,10,34)
time2 <- c(198,162,150)
time2p2 <- c(171,170,150)
spectralst <- data.frame(band, time1, time1p2, time2, time2p2)

ggplot(spectrals, aes(x=band)) + geom_line(aes(y=time1), color="red", linetype="dotted") + geom_line(aes(y=time1p2), color="red", linetype="dotted")+ geom_line(aes(y=time2), color="grey", linetype="dotted") + geom_line(aes(y=time2p2), color="grey", linetype="dotted")
labs(x="band",y="reflectance")

# carichiamo l'immagine scaricata dall'earth observatory 
# Funzione brick per importare i dati, anche qui utilizziamo le virgolette perchè peschiamo i dati al di fuori di R
fuji <- brick("fuji_oli_2021001.jpg")
#funzione plot
plotRGB(fuji, r=1, g=2, b=3, stretch="hist")

click(fuji, id=T, xy=T, cell=T, type="p", pch=16, cex=4, col="yellow")

# outputs
# x     y  cell fuji_oli_2021001.1 fuji_oli_2021001.2 fuji_oli_2021001.3
# 1 425.5 359.5 86826                 15                 16                  2
#      x     y  cell fuji_oli_2021001.1 fuji_oli_2021001.2 fuji_oli_2021001.3
# 1 386.5 353.5 91107                 14                 15                  0
#      x     y  cell fuji_oli_2021001.1 fuji_oli_2021001.2 fuji_oli_2021001.3
# 1 85.5 351.5 92246                 51                 61                 27

band <- c(1,2,3)
land1 <- c(15,16,2)
land2 <- c(14,15,0)
land3 <- c(51,61,27)
spectralsf <- data.frame(band, land1, land2, land3)

# band land1 land2 land3
# 1    1    15    14    51
# 2    2    16    15    61
# 3    3     2     0    27

ggplot(spectralsf, aes(x=band)) + geom_line(aes(y=land1), color="red") + geom_line(aes(y=land2), color="green")+ geom_line(aes(y=land3), color="blue") 
labs(x="band",y="reflectance")













































































