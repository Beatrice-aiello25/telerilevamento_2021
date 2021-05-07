### R_code_land_cover_temp.r

library(raster)
library(RStoolbox)
#install.packages("ggplot2") funziona con qualsiasi dataset
library(ggplot2)
# Set della working directory 
setwd("C:/lab/")

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
# la classe 1 rappresenta l'area agricola, mentre la classe 2 identifica la foresta amazzonica
d2c <- unsuperClass(defor2, nClasses=2)
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













