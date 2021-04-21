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





