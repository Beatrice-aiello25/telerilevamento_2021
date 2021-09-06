# R_code_exam_project.r

# Burn Recovery in Yellowstone
# Images from: https://earthobservatory.nasa.gov/world-of-change/Yellowstone


#Library:
library(raster) 
library(rasterVis) # con questa libreria posso utilizzare la funzione levelplot
library(rgdal) # mi permette di analizzare le firme spettrali
library(ggplot2) # mi permette l'uso delle funzioni ggplot
library(RStoolbox)# permette l'uso della Unsupervised Classification
library(gridExtra)   # permette l'uso e creazione di tabelle e grafici
library(grid)

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
clr<-colorRampPalette(c("blue","pink","green","yellow"))(100)
# Nuovo levelplot col cambio di colori, nome e titolo
levelplot(NPY,col.regions=clr, main="Burn Recovery in Yellowstone ", names.attr=c("1987","1989", "1992", "1997", "2014", "2019"))
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

# FIRME SPETTRALI

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


# LAND COVER

yellowstone_1989<- brick("Yellowstone_19890802_lrg.jpg")
# plot dell'immagine importata
plotRGB(yellowstone_1989, r=1, g=2, b=3, stretch="lin")
ggRGB(yellowstone_1989, r=1, g=2, b=3, stretch="lin")

yellowstone_1992<- brick("Yellowstone_19920802_lrg.jpg")
# plot dell'immagine importata
plotRGB(yellowstone_1992, r=1, g=2, b=3, stretch="lin")
ggRGB(yellowstone_1992, r=1, g=2, b=3, stretch="lin")

yellowstone_1997<- brick("Yellowstone_19970715_lrg.jpg")
# plot dell'immagine importata
plotRGB(yellowstone_1997, r=1, g=2, b=3, stretch="lin")
ggRGB(yellowstone_1997, r=1, g=2, b=3, stretch="lin")

yellowstone_2014<- brick("yellowstone_oli_2014291_lrg.jpg")
# plot dell'immagine importata
plotRGB(yellowstone_2014, r=1, g=2, b=3, stretch="lin")
ggRGB(yellowstone_2014, r=1, g=2, b=3, stretch="lin")


yellowstone_2019<- brick("yellowstone_oli_2019193_lrg.jpg")
# plot dell'immagine importata
plotRGB(yellowstone_2019, r=1, g=2, b=3, stretch="lin")
ggRGB(yellowstone_2019, r=1, g=2, b=3, stretch="lin")


# Funzione par
par(mfrow=c(2,3))
plotRGB(yellowstone_1989, r=1, g=2, b=3, stretch="lin")
plotRGB(yellowstone_1992, r=1, g=2, b=3, stretch="lin")
plotRGB(yellowstone_1997, r=1, g=2, b=3, stretch="lin")
plotRGB(yellowstone_2014, r=1, g=2, b=3, stretch="lin")
plotRGB(yellowstone_2019, r=1, g=2, b=3, stretch="lin")

# multiframe con ggplot2 e gridExtra
p1 <- ggRGB(yellowstone_1989, r=1, g=2, b=3, stretch="lin")
p1.1 <- ggRGB(yellowstone_1992, r=1, g=2, b=3, stretch="lin")
p1.3 <- ggRGB(yellowstone_1997, r=1, g=2, b=3, stretch="lin")
p1.2 <- ggRGB(yellowstone_2014, r=1, g=2, b=3, stretch="lin")
p2 <- ggRGB(yellowstone_2019, r=1, g=2, b=3, stretch="lin")
grid.arrange(p1, p1.1,p1.3 ,p1.2,p2, nrow=2, top="Yellowstone 1989-2019")

# classificazione non supervisionata
# la classe 1 rappresenta l'area incendiata, mentre la classe 2 identifica la vegetazione
d1y <- unsuperClass(yellowstone_1989, nClasses=4)
plot(d1y$map)
d1.1y <- unsuperClass(yellowstone_1992, nClasses=4)
plot(d1.1y$map)
d1.3y <- unsuperClass(yellowstone_1997, nClasses=4)
plot(d1.3y$map)
d1.2y <- unsuperClass(yellowstone_2014, nClasses=4)
plot(d1.2y$map)
d2y <- unsuperClass(yellowstone_2019, nClasses=4)
plot(d2y$map)

par(mfrow=c(2,3))
plot(d1y$map, main="Land cover Yellowstone 1989-2019")
plot(d1.1y$map, main="Land cover Yellowstone 1989-2019")
plot(d1.3y$map,main="Land cover Yellowstone 1989-2019")
plot(d1.2y$map,main="Land cover Yellowstone 1989-2019")
plot(d2y$map, main="Land cover Yellowstone 1989-2019")

# calcolo delle frequenze dei pixel
freq(d1y$map)
#  value   count
# [1,]     1 2112978  #area incendiata
# [2,]     2 4685647  #foresta matura
# [3,]     3 3308693  # foresta estiva
# [4,]     4  611758  # acqua

# somma totale dei pixel della prima immagine
s1 <- 2112978 + 4685647 + 3308693 + 611758
# proporzione di pixel delle quattro classi 
prop1 <- freq(d1y$map)/s1
# prop area incendiata: 0.1971231
# prop foresta matura : 0.4371316
# prop foresta estiva: 0.3086733
# prop acqua: 0.0570719

freq(d1.1y$map)
prop1.1 <- freq(d1.1y$map)/s1
# prop area incendiata: 0.25164305
# prop foresta matura : 0.39895220
# prop foresta estiva: 0.29746976
# prop acqua: 0.05193498

freq(d1.3y$map)
prop1.3 <- freq(d1.3y$map)/s1
# prop area incendiata: 0.34191296
# prop foresta matura : 0.38149342
# prop foresta estiva: 0.22575276
# prop acqua: 0.05084086

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
percent_1997 <- c(34.19, 60.71, 5.1)
percent_2014 <- c(25.34, 63.63, 11.01)
percent_2019 <- c(38.37, 53.89, 7.6)

percentages <- data.frame(cover, percent_1989, percent_1992,percent_1997 , percent_2014,percent_2019)
#        cover percent_1989 percent_1992 percent_1997 percent_2014 percent_2019
# 1 Area incendio        19.71        25.16        34.19        25.34        38.37
# 2   Vegetazione        74.57        69.63        60.71        63.63        53.89
# 3         Acqua         5.70         5.20         5.10        11.01         7.60


# utilizziamo ggplot2 per creare un grafico con il dataframe appena realizzato
ggplot(percentages, aes(x=cover, y=percent_1989, color=cover)) + geom_bar(stat="identity", fill="white")
ggplot(percentages, aes(x=cover, y=percent_1992, color=cover)) + geom_bar(stat="identity", fill="white")
ggplot(percentages, aes(x=cover, y=percent_1997, color=cover)) + geom_bar(stat="identity", fill="white")
ggplot(percentages, aes(x=cover, y=percent_2014, color=cover)) + geom_bar(stat="identity", fill="white")
ggplot(percentages, aes(x=cover, y=percent_2019, color=cover)) + geom_bar(stat="identity", fill="white")


lc1<- gggplot(percentages, aes(x=cover, y=percent_1989, fill=cover)) + geom_bar(stat="identity") + theme_minimal()
lc2<- ggplot(percentages, aes(x=cover, y=percent_1992, fill=cover)) + geom_bar(stat="identity") + theme_minimal()
lc3 <-ggplot(percentages, aes(x=cover, y=percent_1997, fill=cover)) + geom_bar(stat="identity") + theme_minimal()
lc4<- ggplot(percentages, aes(x=cover, y=percent_2014, fill=cover)) + geom_bar(stat="identity") + theme_minimal()
lc5<- ggplot(percentages, aes(x=cover, y=percent_2019, fill=cover)) + geom_bar(stat="identity") + theme_minimal()

grid.arrange(p1, p1.1,p1.3 ,p1.2,p2, nrow=2, top="Yellowstone 1989-2019")


p1<- gggplot(percentages, aes(x=cover, y=percent_1989, color=blue)) + geom_bar(aes(fill = drv))
p2<- gggplot(percentages, aes(x=cover, y=percent_1989, color=blue)) + geom_bar(aes(fill = drv))
p3<- gggplot(percentages, aes(x=cover, y=percent_1989, color=blue)) + geom_bar(aes(fill = drv))
p4<- gggplot(percentages, aes(x=cover, y=percent_1989, color=blue)) + geom_bar(aes(fill = drv))


# 2. Principal component analysis

# PCA of Yellowstone in 1987
yellowstone_1987<-brick("Yellowstone_19870805_lrg.jpg")
yellowstone_1987_pca <- rasterPCA(yellowstone_1987)
summary(yellowstone_1987_pca$model)
# Importance of components:
#                           Comp.1      Comp.2     Comp.3
# Standard deviation     80.6695408 23.73591028 17.2899836
# Proportion of Variance  0.8829922  0.07644507  0.0405627
# Cumulative Proportion   0.8829922  0.95943730  1.0000000
plotRGB(yellowstone_1987_pca$map,r=1,g=2,b=3, stretch="Hist")
plot(yellowstone_1987_pca$model) #For see the graphic

# PCA of Yellowstone in 1989
yellowstone_1989_pca <- rasterPCA(yellowstone_1989)
summary(yellowstone_1989_pca$model)
# Importance of components:
#                           Comp.1     Comp.2      Comp.3
# Standard deviation     54.3967013 38.8648794 10.55508959
# Proportion of Variance  0.6459446  0.3297348  0.02432058
# Cumulative Proportion   0.6459446  0.9756794  1.00000000
plotRGB(yellowstone_1989_pca$map,r=1,g=2,b=3, stretch="Hist")
plot(yellowstone_1989_pca$model) #For see the graphic

# PCA of Yellowstone in 1992
yellowstone_1992<-brick("Yellowstone_19920802_lrg.jpg")
yellowstone_1992_pca <- rasterPCA(yellowstone_1992)
summary(yellowstone_1992_pca$model)
# Importance of components:
#                           Comp.1     Comp.2      Comp.3
# Standard deviation     55.4420561 30.4443849 13.62554231
# Proportion of Variance  0.7342508  0.2214013  0.04434793
# Cumulative Proportion   0.7342508  0.9556521  1.00000000
plotRGB(yellowstone_1992_pca$map,r=1,g=2,b=3, stretch="Hist")
plot(yellowstone_1992_pca$model) #For see the graphic

# PCA of Yellowstone in 1997
yellowstone_1997<-brick("Yellowstone_19970715_lrg.jpg")
yellowstone_1997_pca <- rasterPCA(yellowstone_1997)
summary(yellowstone_1997_pca$model)
# Importance of components:
#                            Comp.1     Comp.2      Comp.3
# Standard deviation     53.1663418 32.1895934 15.83727534
# Proportion of Variance  0.6871417  0.2518858  0.06097246
# Cumulative Proportion   0.6871417  0.9390275  1.00000000
plotRGB(yellowstone_1997_pca$map,r=1,g=2,b=3, stretch="Hist")
plot(yellowstone_1997_pca$model) #For see the graphic

# PCA of Yellowstone in 2014
yellowstone_2014<-brick("yellowstone_oli_2014291_lrg.jpg")
yellowstone_2014_pca <- rasterPCA(yellowstone_2014)
summary(yellowstone_2014_pca$model)
# Importance of components:
#                           Comp.1     Comp.2     Comp.3
# Standard deviation     58.8659496 22.6160285 8.62257494
# Proportion of Variance  0.8553866  0.1262603 0.01835304
# Cumulative Proportion   0.8553866  0.9816470 1.00000000
plotRGB(yellowstone_2014_pca$map,r=1,g=2,b=3, stretch="Hist")
plot(yellowstone_2014_pca$model) #For see the graphic

# PCA of Yellowstone in 2019
yellowstone_2019_pca <- rasterPCA(yellowstone_2019)
summary(yellowstone_2019_pca$model)
# Importance of components:
#                           Comp.1     Comp.2      Comp.3
# Standard deviation     61.9790086 23.6047379 13.93105627
# Proportion of Variance  0.8364219  0.1213206  0.04225754
# Cumulative Proportion   0.8364219  0.9577425  1.00000000
plotRGB(yellowstone_2019_pca$map,r=1,g=2,b=3, stretch="Hist")
plot(yellowstone_2019_pca$model) #For see the graphic

# Comparison PCA 2019 and PCA 2021 
par(mfrow=c(2,3))
plotRGB(yellowstone_1987_pca$map,r=1,g=2,b=3, stretch="Hist")
plotRGB(yellowstone_1989_pca$map,r=1,g=2,b=3, stretch="Hist")
plotRGB(yellowstone_1992_pca$map,r=1,g=2,b=3, stretch="Hist")
plotRGB(yellowstone_1997_pca$map,r=1,g=2,b=3, stretch="Hist")
plotRGB(yellowstone_2014_pca$map,r=1,g=2,b=3, stretch="Hist")
plotRGB(yellowstone_2019_pca$map,r=1,g=2,b=3, stretch="Hist")

# Multiframe with ggplot
by_1987 <- ggRGB(yellowstone_1987_pca$map,r=1,g=2,b=3, stretch="Hist")
by_1989 <- ggRGB(yellowstone_1989_pca$map,r=1,g=2,b=3, stretch="Hist")
by_1992 <- ggRGB(yellowstone_1992_pca$map,r=1,g=2,b=3, stretch="Hist")
by_1997 <- ggRGB(yellowstone_1997_pca$map,r=1,g=2,b=3, stretch="Hist")
by_2014 <- ggRGB(yellowstone_2014_pca$map,r=1,g=2,b=3, stretch="Hist")
by_2019 <- ggRGB(yellowstone_2019_pca$map,r=1,g=2,b=3, stretch="Hist")

grid.arrange(by_1987, by_1989, by_1992,by_1997, by_2014,by_2019,   nrow=2, main="PCA of Yellowstone 1987-2019")
grid.arrange(by_1987, by_1989, by_1992,by_1997, by_2014,by_2019,   nrow=2, top = textGrob("Area sottoposta ad incendio Yellowstone 1987-2019"))


..............................................................................................

