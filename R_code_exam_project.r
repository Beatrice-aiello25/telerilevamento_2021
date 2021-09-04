# R_code_exam_project.r

# Burn Recovery in Yellowstone
# Images from: https://earthobservatory.nasa.gov/world-of-change/Yellowstone


#Library:
library(raster)
library(rasterVis)
library(rgdal)
library(ggplot2)

setwd("C:/lab/NPY") #Windows

# Funzione list.files crea una lista di file
list.files()
# Importare i file tutti insieme (invece che singolarmente)
# Funzione list.files: crea lista di file per la funzione lapply 
rlist <- list.files(pattern="lrg")
# Funzione per avere le info sul file
rlist
# Funzione lapply permette di importare la lista di file e applicarvi la funzione raster
import <- lapply(rlist,raster)
# Funzione stack crea un unico pacchetto di file
NPY <- stack(import)
# Funzione plot: del singolo file
plot(NPY)
# Funzione plotRGB: crea plot con immagini sovrapposte
plotRGB(NPY, 1, 2, 3, stretch="Lin")
plotRGB(NPY, 2, 3, 4, stretch="Lin")

# Funzione levelplot: disegna più grafici di colore falso con una singola legenda
levelplot(NPY)
# Cambio di colori a piacimento (colorRampPalette si può usare solo su immagine singole, non su RGB)
clp<-colorRampPalette(c("blue","red","green","pink))(100)
# Nuovo levelplot col cambio di colori, nome e titolo
levelplot(NPY,col.regions=clp, main="Burn Recovery in Yellowstone ", names.attr=c("1987","1989", "1992", "1997", "2014", "2019"))
ggRGB(NPY, r=1, g=2, b=3, stretch="lin")

#............................................................................................................................................................

# ANALISI MULTIVARIATA

# Plot di tutte le correlazioni tra bande di un dataset (matrice di scatterplot di dati, non immagini)
# La tabella riporta in diagonale le bande (sono le variabili), l'indice di correlazione varia da 0(negativo) a 1 (positivo)
pairs(NPY)

# Indice di correlazione: più le bande sono correlate e maggiore sarà la dimensione dei caratteri
# Risultato= 0,49


# Importazione delle singole immagini per effettuare comparazioni
# Funzione: brick, importa i singoli file
yellowstone_1989<- brick("Yellowstone_19890802_lrg.jpg")
yellowstone_2019<- brick("yellowstone_oli_2019193_lrg.jpg")

# SPECTRAL SIGNATURES

# Funzione plotRGB: yellowstone_1989
plotRGB(yellowstone_1989, r=1, g=2, b=3, stretch="lin") # "lin": lineare, amplia i valori
# Bisogna avere la mappa fatta con plotRGB aperta sotto
# Funzione: click, usa immagine plotRGB per creare le firme spettrali 
click(yellowstone_1989, id=T, xy=T, cell=T, type="p", pch=16, cex=4, col="yellow")

#      x     y     cell       Yellowstone_19890802_lrg.1     Yellowstone_19890802_lrg.2      Yellowstone_19890802_lrg.3
# 1 1895.5 563.5   8874436                        103                         28                    49                  # area incendiata      
# 2 1349.5 2502.5  2525604                        176                         88                   78                  # area incendiata 
# 3 2055.5 2413.5  2817696                        131                          53                   53                  # area incendiata 

# Definire le colonne del dataset
bande <- c(1,2,3)
area_incendiata01 <- c(103,28,49)
area_incendiata02 <- c(176,88,78)
area_incendiata03 <- c(131,53,53)    

# Funzione data.frame: crea un dataframe (tabella)
spectrals <- data.frame(bande, area_incendiata01, area_incendiata02, area_incendiata03)
# Funzione per avere le info sul file
spectrals

# bande area_incendiata01 area_incendiata02 area_incendiata03
# 1     1               103               176               131
# 2     2                28                88                53
# 3     3                49                78                53

                   
# Plot delle firme spettrali
# Funzione ggplot: determina l'estetica del grafico
# Funzione geom_line: connette le osservazioni a seconda del dato che è sulla X/Y
# Funzione labs: modifica le etichette degli assi, le legende e il plottaggio
ggplot(spectrals, aes(x=bande)) +
 geom_line(aes(y=area_incendiata01), color="red") +
 geom_line(aes(y=area_incendiata02), color="blue") +
 geom_line(aes(y=area_incendiata03), color="green") +
 labs(x="bande",y="reflectance")

# Funzione plotRGB: yellowstone_2019
plotRGB(yellowstone_2019, r=1, g=2, b=3, stretch="lin") # "lin": lineare, amplia i valori
# Bisogna avere la mappa fatta con plotRGB aperta sotto
# Funzione: click, usa immagine plotRGB per creare le firme spettrali 
click(yellowstone_2019, id=T, xy=T, cell=T, type="p", pch=16, cex=4, col="yellow")

#    x     y      cell       yellowstone_oli_2019193_lrg.1    yellowstone_oli_2019193_lrg.2        yellowstone_oli_2019193_lrg.3
# 1 1900.5 486.5 9126539                          134                        161                       84                    
# 2 1343.5 2514.5 2486310                         178                        167                       103
# 3 2049.5 2396.5 2873348                         182                        179                       108
 
# Definire le colonne del dataset
bande <- c(1,2,3)
area_postincendio01 <- c(134,161,84)
area_postincendio02 <- c(178,167,103)
area_postincendio03 <- c(182,179,108)  

# Funzione data.frame: crea un dataframe (tabella)
spectrals <- data.frame(bande, area_postincendio01, area_postincendio02, area_postincendio03)
# Funzione per avere le info sul file
spectrals

#  bande area_postincendio01 area_postincendio02 area_postincendio03
# 1     1                 134                 178                 182
# 2     2                 161                 167                 179
# 3     3                  84                 103                 108

ggplot(spectrals, aes(x=bande)) +
 geom_line(aes(y=area_postincendio01), color="black") +
 geom_line(aes(y=area_postincendio02), color="orange") +
 geom_line(aes(y=area_postincendio03), color="blue") +
 labs(x="bande",y="reflectance")

# Definire le colonne del dataset
bande <- c(1,2,3)
area_incendiata01_anno1989 <- c(103,28,49)
area_postincendio01_anno2019 <- c(134,161,84)
area_incendiata02_anno1989 <- c(176,88,78)
area_postincendio02_anno2019 <- c(178,167,103)
area_incendiata03_anno1989 <- c(131,53,53)
area_postincendio03_anno2019 <- c(182,179,108)

# Funzione data.frame: crea un dataframe (tabella)
spectralst <- data.frame(bande, area_incendiata01_anno1989, area_postincendio01_anno2019,area_incendiata02_anno1989,area_postincendio02_anno2019,area_incendiata03_anno1989, area_postincendio03_anno2019)
# Funzione per avere le info sul file
spectralst

# bande area_incendiata01_anno1989 area_postincendio01_anno2019 area_incendiata02_anno1989   area_postincendio02_anno2019 area_incendiata03_anno1989 area_postincendio03_anno2019
1                 103                   134                          176                               178                        131                           182
2                  28                   161                          88                                167                         53                           179
3                  49                    84                          78                                103                         53                           108

# Plot delle firme spettrali
# Funzione ggplot: determina l'estetica del grafico
# Funzione geom_line: connette le osservazioni a seconda del dato che è sulla X/Y 
# Funzione labs: modifica le etichette degli assi, le legende e il plottaggio
ggplot(spectralst, aes(x=bande)) +
 geom_line(aes(y=area_incendiata01_anno1989), color="red") +
 geom_line(aes(y=area_postincendio01_anno2019), color="green") +
 geom_line(aes(y=area_incendiata02_anno1989), color="yellow") +
 geom_line(aes(y=area_postincendio02_anno2019), color="black") +
 geom_line(aes(y=area_incendiata03_anno1989), color="blue") +
 geom_line(aes(y=area_postincendio03_anno2019), color="lightblue") +
 labs(x="bande",y="reflectance")


# DVI - NDVI

# 1. DVI - Difference Vegetation Index

# See how the bands of NIR and RED are called 
yellowstone_1989
#B1(NIR)= Yellowstone_19890802_lrg.1,; B2(RED)=Yellowstone_19890802_lrg.2
yellowstone_2019
#B1(NIR)=yellowstone_oli_2019193_lrg.1; B2(RED)=yellowstone_oli_2019193_lrg.2

# First index of Yellowstone 1989: NIR - RED
dvi1 <- yellowstone_1989$Yellowstone_19890802_lrg.1 - yellowstone_1989$Yellowstone_19890802_lrg.2
plot(dvi1)
cld <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
plot(dvi1, col=cld, main="DVI of Yellowstone in 1989 ")

# First index of Yellowstone 1989: NIR - RED
dvi2 <- yellowstone_2019$yellowstone_oli_2019193_lrg.1 - yellowstone_2019$yellowstone_oli_2019193_lrg.2
plot(dvi2)
cld <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
plot(dvi2, col=cld, main="DVI of Yellowstone in 2019 ")

# Comparison togher for the difference
par(mfrow=c(1,2))
plot(dvi1, col=cld, main="DVI of Yellowstone in 1989")
plot(dvi2, col=cld, main="DVI of Yellowstone in 2019")
difdvi <- dvi1 - dvi2
cldd <- colorRampPalette(c('blue','white','red'))(100)
plot(difdvi, col=cldd)

# 2. NDVI - Normalized Difference Vegetation Index

# NDVI= (NIR-RED) / (NIR+RED)
# NDVI of Yellowstone in 1989
ndvi1 <- (dvi1) / (yellowstone_1989$Yellowstone_19890802_lrg.1 + yellowstone_1989$Yellowstone_19890802_lrg.2)
plot(ndvi1, col=cld, main="NDVI of Yellowstone in 1989 ")

# NDVI of Yellowstone in 2019
ndvi2 <- (dvi2) / (yellowstone_2019$yellowstone_oli_2019193_lrg.1 + yellowstone_2019$yellowstone_oli_2019193_lrg.2)
plot(ndvi2, col=cld, main="NDVI of Yellowstone in 2019 ")

# Comparison togher for the difference
par(mfrow=c(1,2))
plot(ndvi1, col=cld, main="NDVI of Yellowstone 1989")
plot(ndvi2, col=cld, main="NDVI of Yellowstone 2019")

# Difference NDVI
difndvi <- ndvi1 - ndvi2
plot(difndvi, col=cldd)

# LAND COVER

# Funzione brick per importare i dati
yellowstone_1989<- brick("Yellowstone_19890802_lrg.jpg")
# plot dell'immagine importata
plotRGB(yellowstone_1989, r=1, g=2, b=3, stretch="lin")
ggRGB(yellowstone_1989, r=1, g=2, b=3, stretch="lin")

yellowstone_1992<- brick("Yellowstone_19920802_lrg.jpg")
# plot dell'immagine importata
plotRGB(yellowstone_1992, r=1, g=2, b=3, stretch="lin")
ggRGB(yellowstone_1992, r=1, g=2, b=3, stretch="lin")

yellowstone_2014<- brick("yellowstone_oli_2014291_lrg.jpg")
# plot dell'immagine importata
plotRGB(yellowstone_2014, r=1, g=2, b=3, stretch="lin")
ggRGB(yellowstone_2014, r=1, g=2, b=3, stretch="lin")


yellowstone_2019<- brick("yellowstone_oli_2019193_lrg.jpg")
# plot dell'immagine importata
plotRGB(yellowstone_2019, r=1, g=2, b=3, stretch="lin")
ggRGB(yellowstone_2019, r=1, g=2, b=3, stretch="lin")


# Funzione par
par(mfrow=c(2,2))
plotRGB(yellowstone_1989, r=1, g=2, b=3, stretch="lin")
plotRGB(yellowstone_1992, r=1, g=2, b=3, stretch="lin")
plotRGB(yellowstone_2014, r=1, g=2, b=3, stretch="lin")
plotRGB(yellowstone_2019, r=1, g=2, b=3, stretch="lin")

# multiframe con ggplot2 e gridExtra
p1 <- ggRGB(yellowstone_1989, r=1, g=2, b=3, stretch="lin")
p1.1 <- ggRGB(yellowstone_1992, r=1, g=2, b=3, stretch="lin")
p1.2 <- ggRGB(yellowstone_2014, r=1, g=2, b=3, stretch="lin")
p2 <- ggRGB(yellowstone_2019, r=1, g=2, b=3, stretch="lin")
grid.arrange(p1, p1.1, p1.2,p2, nrow=2)

# classificazione non supervisionata
# la classe 1 rappresenta l'area incendiata, mentre la classe 2 identifica la vegetazione
d1y <- unsuperClass(yellowstone_1989, nClasses=4)
plot(d1y$map)
d1.1y <- unsuperClass(yellowstone_1992, nClasses=4)
plot(d1.1y$map)
d1.2y <- unsuperClass(yellowstone_2014, nClasses=4)
plot(d1.2y$map)
d2y <- unsuperClass(yellowstone_2019, nClasses=4)
plot(d2y$map)

# calcolo delle frequenze dei pixel
freq(d1y$map)
#  value   count
# [1,]     1 2112978  #area incendiata
# [2,]     2 4685647  #foresta matura
# [3,]     3 3308693  # foresta estiva
# [4,]     4  611758  # acqua

# somma totale dei pixel della prima immagine
s1 <- 2112978 + 4685647 + 3308693 + 611758
# proporzione di pixel delle due classi nella prima immagine
prop1 <- freq(d1y$map)/s1
prop1
# prop area incendiata: 0.1971231
# prop foresta matura : 0.4371316
# prop foresta estiva: 0.3086733
# prop acqua: 0.0570719

freq(d1.1y$map)
# proporzione di pixel delle due classi nella prima immagine
prop1.1 <- freq(d1.1y$map)/s1
# prop area incendiata: 0.25164305
# prop foresta matura : 0.39895220
# prop foresta estiva: 0.29746976
# prop acqua: 0.05193498

freq(d1.2y$map)
prop1.2 <- freq(d1.2y$map)/s1
# prop area incendiata: 0.2534322
# prop foresta matura : 0.4082732
# prop foresta estiva: 0.2281233
# prop acqua: 0.1101713

freq(d2y$map)
prop2 <- freq(d2y$map)/s1
# prop area incendiata: 0.38374838
# prop foresta matura : 0.48993271
# prop foresta estiva: 0.04987781 (nuvole)
# prop acqua: 0.07644110

# Costruiamo un dataframe, mettiamo la c perchè sono due blocchi di una stessa parte
cover <- c("Area incendio", "Vegetazione", "Acqua")
percent_1989 <- c(19.71, 74.57, 5.7)
percent_1992 <- c(25.16, 69.63, 5.2)
percent_2014 <- c(25.34, 63.63, 11.01)
percent_2019 <- c(38.37, 53.89, 7.6)

percentages <- data.frame(cover, percent_1989, percent_1992, percent_2014,percent_2019)
#    cover           percent_1989 percent_1992 percent_2014 percent_2019
#1 Area incendio        19.71        25.16        25.34        38.37
#2   Vegetazione        74.57        69.63        63.63        53.89
#3         Acqua         5.70         5.20        11.01         7.60

# utilizziamo ggplot2 per creare un grafico con il dataframe appena realizzato
ggplot(percentages, aes(x=cover, y=percent_1989, color=cover)) + geom_bar(stat="identity", fill="white")
ggplot(percentages, aes(x=cover, y=percent_1992, color=cover)) + geom_bar(stat="identity", fill="white")
ggplot(percentages, aes(x=cover, y=percent_2014, color=cover)) + geom_bar(stat="identity", fill="white")
ggplot(percentages, aes(x=cover, y=percent_2019, color=cover)) + geom_bar(stat="identity", fill="white")

p1<- gggplot(percentages, aes(x=cover, y=percent_1989, color=blue)) + geom_bar(stat="identity", fill="yellow")
p2<- ggplot(percentages, aes(x=cover, y=percent_1992, color=blue)) + geom_bar(stat="identity", fill="yellow")
p3<- ggplot(percentages, aes(x=cover, y=percent_2014, color=blue)) + geom_bar(stat="identity", fill="yellow")
p4<- ggplot(percentages, aes(x=cover, y=percent_2019, color=blue)) + geom_bar(stat="identity", fill="yellow")

grid.arrange(p1, p2,p3, p4, nrow=2)
