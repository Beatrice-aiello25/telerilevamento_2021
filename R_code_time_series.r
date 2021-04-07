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


