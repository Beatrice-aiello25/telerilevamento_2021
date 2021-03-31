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
