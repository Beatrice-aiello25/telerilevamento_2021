R_code_classification.r

# setto della working directory, indicando la cartella da cui estrarre i dati
setwd("C:/lab/")

library(raster)

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
















