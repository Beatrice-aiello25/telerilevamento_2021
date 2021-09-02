## R_code_exam_project.r

# Burn Recovery in Yellowstone
# Images from: https://earthobservatory.nasa.gov/world-of-change/Yellowstone


#Library:
library(raster)


setwd("C:/lab/NPY") #Windows
# Uploud 2 images from Earth of Observatory 
yellowstone1987 <- raster("Yellowstone_19870805_lrg.jpg")


# Funzione list.files crea una lista di file
list.files()

rlist <- list.files(pattern="lrg")
rlist
# Funzione lapply permette di importare la lista di file e applicarvi la funzione raster
import <- lapply(rlist,raster)

# Funzione stack crea un unico pacchetto di file
NPY <- stack(import)

plot(NPY)
plotRGB(NPY, 1, 2, 3, stretch="Lin")
plotRGB(NPY, 2, 3, 4, stretch="Lin")

clb <- colorRampPalette(c("pink","blue", "yellow","red"))(100)
levelplot(NPY, col=clb)
