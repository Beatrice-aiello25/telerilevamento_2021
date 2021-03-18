# il mio primo codice in R per il telerilevamento!

# Codice per installazione pacchetti aggiuntivi raster
install.packages("raster")

# Funzione library per richiamare il pacchetto raster
library(raster)

# Indicare la cartella da cui estrarre i dati
setwd(C:/lab/")

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
