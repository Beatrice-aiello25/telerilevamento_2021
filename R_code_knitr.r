#R_code_knitr.r

# Indico la cartella da cui estrarre i dati
setwd("C:/lab)

# Funzione library per richiamare il pacchetto knitr
library(knitr)

# Funzione stitch
stitch("r_code_greenland.txt", template=system.file("misc", "knitr-template.Rnw", package="knitr"))













