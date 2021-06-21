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
# funzione click per seleionare le firme spettrali
click(defor1, id=T, xy=T, cell=T, type="p", pch=16, cex=4, col="yellow")







