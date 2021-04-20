#R_code_knitr.r

# Indico la cartella da cui estrarre i dati
setwd("C:/lab)

# Funzione library per richiamare il pacchetto knitr
library(knitr)

# Funzione stitch
stitch("r_code_greenland.r.txt", template=system.file("misc", "knitr-template.Rnw", package="knitr"))
# viene generato un file tex nella cartella lab
R_code_greenland.tex
# apriamo il file con un programma di testo blocco note, codice che verrà poi copiato su overleaf per poter generare un pdf










