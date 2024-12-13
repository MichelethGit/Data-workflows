#Tobias Käcks
#Last updated: 21.08.2024
#Input: TSQ name
#Output: Coordinates of the TSQ local neighborhood (12 neighbors)

rm(list = ls())


Trees##############################

setwd("C://Users//cm61imip//Desktop//PhD notes")

install.packages("readxl")
library(readxl)
data <- read_excel("C://Users//cm61imip//Desktop//PhD notes//Site A TSQ summary2.xlsx")

# Funktion zur Berechnung der 12 Nachbarpunkte eines TSQs mit zyklischen Koordinaten
berechne_nachbarn <- function(tsq_name) {
  x <- as.numeric(substr(tsq_name, 1, 2))
  y <- as.numeric(substr(tsq_name, 3, 4))
  
  zyklisch <- function(wert) {
    if (wert > 19) return(wert - 20)
    if (wert < 0) return(wert + 20)
    return(wert)
  }
  
  nachbarn <- matrix(ncol=2, nrow=12)
  
  nachbarn[1,] <- c(zyklisch(x-1), zyklisch(y-1))  # N1: unten links
  nachbarn[2,] <- c(x, zyklisch(y-1))              # N2: unten Mitte
  nachbarn[3,] <- c(zyklisch(x+1), zyklisch(y-1))  # N3: unten rechts
  nachbarn[4,] <- c(zyklisch(x+2), zyklisch(y-1))  # N4: rechts unten
  nachbarn[5,] <- c(zyklisch(x+2), y)              # N5: rechts Mitte
  nachbarn[6,] <- c(zyklisch(x+2), zyklisch(y+1))  # N6: rechts oben
  nachbarn[7,] <- c(zyklisch(x+2), zyklisch(y+2))  # N7: oben rechts
  nachbarn[8,] <- c(zyklisch(x+1), zyklisch(y+2))  # N8: oben Mitte
  nachbarn[9,] <- c(x, zyklisch(y+2))              # N9: oben links
  nachbarn[10,] <- c(zyklisch(x-1), zyklisch(y+2)) # N10: links oben
  nachbarn[11,] <- c(zyklisch(x-1), zyklisch(y+1)) # N11: links Mitte
  nachbarn[12,] <- c(zyklisch(x-1), y)             # N12: links unten
  
  nachbarn_formatiert <- apply(nachbarn, 1, function(coord) {
    sprintf("%02d%02d", coord[1], coord[2])
  })
  
  ergebnis <- c(tsq_name, nachbarn_formatiert)
  
  return(ergebnis)
}

# Berechnung für jede shrubID in der Tabelle data
resultate <- t(sapply(data$shrubID, berechne_nachbarn))

# Erstelle eine Tabelle mit den Namen der 
spalten_namen <- c("TSQ_ID", paste0("N", 1:12))

neighbor_tab <- as.data.frame(resultate, stringsAsFactors = FALSE)
neighbor_tab$plot <- data$plot
colnames(neighbor_tab) <- spalten_namen

# Füge die ursprünglichen Daten hinzu, wenn nötig
resultat_tabelle <- cbind(data, resultate)

# Ausgabe der Tabelle
print(neighbor_tab)

# Leeres DataFrame mit denselben Spaltennamen wie data
empty_row <- data.frame(matrix(ncol = ncol(neighbor_tab), nrow = 1))
names(empty_row) <- names(neighbor_tab)

# Erzeuge ein leeres DataFrame für das neue Ergebnis
result <- data.frame()

# Füge jede Zeile und eine leere Zeile nacheinander hinzu
for (i in 1:nrow(neighbor_tab)) {
  result <- rbind(result, neighbor_tab[i, ]) # Füge die Originalzeile hinzu
  result <- rbind(result, empty_row) # Füge eine leere Zeile hinzu
}

# Überprüfe das Ergebnis
print(result)

#install.packages("writexl")
library(writexl)
write_xlsx(result, "TSQ_neighborhood_trees.xlsx")

###Shrubs###########################################

rm(list = ls())


library(readxl)
data <- read_excel("C://Users//cm61imip//Desktop//PhD notes//TSQs_TreeDì2023.xlsx")


# Funktion zur Berechnung der 8 Nachbarpunkte eines TSQs mit zyklischen Koordinaten
berechne_8_nachbarn <- function(tsq_name) {
  x <- as.numeric(substr(tsq_name, 1, 2))
  y <- as.numeric(substr(tsq_name, 3, 4))
  
  zyklisch <- function(wert) {
    if (wert > 19) return(wert - 20)
    if (wert < 0) return(wert + 20)
    return(wert)
  }
  
  nachbarn <- matrix(ncol=2, nrow=8)
  
  # Reihenfolge der Nachbarn im Uhrzeigersinn, beginnend mit unten links (S1)
  nachbarn[1,] <- c(zyklisch(x-1), zyklisch(y-1))  # S1: unten links
  nachbarn[2,] <- c(x, zyklisch(y-1))              # S2: unten Mitte
  nachbarn[3,] <- c(zyklisch(x+1), zyklisch(y-1))  # S3: unten rechts
  nachbarn[4,] <- c(zyklisch(x+1), y)              # S4: rechts
  nachbarn[5,] <- c(zyklisch(x+1), zyklisch(y+1))  # S5: oben rechts
  nachbarn[6,] <- c(x, zyklisch(y+1))              # S6: oben Mitte
  nachbarn[7,] <- c(zyklisch(x-1), zyklisch(y+1))  # S7: oben links
  nachbarn[8,] <- c(zyklisch(x-1), y)             # S8: links
  
  # Die Koordinaten als vierstellige Strings formatieren
  nachbarn_formatiert <- apply(nachbarn, 1, function(coord) {
    sprintf("%02d%02d", coord[1], coord[2])
  })
  
  ergebnis <- c(tsq_name, nachbarn_formatiert)
  
  return(ergebnis)
}

# Berechnung für jede shrubID in der Tabelle data
shrub_nachbar <- t(sapply(data$shrubID, berechne_8_nachbarn))

# Erstelle eine Tabelle mit den Namen der Spalten
spalten_namen_nachbarn <- c("Shrub_ID", paste0("S", 1:8))
resultat_tabelle_nachbarn <- as.data.frame(shrub_nachbar, stringsAsFactors = FALSE)
colnames(resultat_tabelle_nachbarn) <- spalten_namen_nachbarn
print(resultat_tabelle_nachbarn)

shrub_neighbor_tab <- resultat_tabelle_nachbarn
shrub_neighbor_tab$plot <- data$plot

# Leeres DataFrame mit denselben Spaltennamen wie data
empty_row <- data.frame(matrix(ncol = ncol(shrub_neighbor_tab), nrow = 1))
names(empty_row) <- names(shrub_neighbor_tab)

# Erzeuge ein leeres DataFrame für das neue Ergebnis
result <- data.frame()

# Füge jede Zeile und eine leere Zeile nacheinander hinzu
for (i in 1:nrow(shrub_neighbor_tab)) {
  result <- rbind(result, shrub_neighbor_tab[i, ]) # Füge die Originalzeile hinzu
  result <- rbind(result, empty_row) # Füge eine leere Zeile hinzu
}

# Überprüfe das Ergebnis
print(result)

#install.packages("writexl")
library(writexl)
write_xlsx(result, "TSQ_neighborhood_shrub.xlsx")
