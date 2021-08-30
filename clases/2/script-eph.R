#############################################
# Curso ESA
# Script clase 2: EPH
# Agosto 2021
#############################################

# Librerias que vamos a utilizar en la clase ------------------------
library(tidyverse)
library(eph)
library(haven)
library(foreign)


# El método tradicional ---------------------
##  Bases 2016-2021 -----------------

eph_ind_319 <- read.csv2("bases/Usu_individual_T319.txt", header = TRUE, sep = ";")

nrow(eph_ind_319) #cantidad de casos que tiene la base
ncol(eph_ind_319) #cantidad de variables que tiene la base

## Bases 2003-2015 ------------------------

eph_hog_414 <- read_sav("bases/Hogar_t414.sav")


## Bases 1974-2002 ---------------------------

eph_ind_74 <- read.dbf("bases/PERSO_US.DBF")


# Utilizando el paquete EPH ----------------------
eph_ind_419 <- get_microdata(year = 2019, trimester = 4, type = "individual")

eph_estado <- get_microdata(year = 2019, trimester = 4, type = "individual", vars = c("CODUSU", "NRO_HOGAR", "ANO4", "ESTADO")) # Selecciono que variables quiero traer

names(eph_estado) # Visualizo los nombres de las variables

eph_ind_419 <- organize_labels(eph_ind_419, type = 'individual') # Con la función "organize_labels" puedo etiquetar automáticamente variables y categorías

attributes(eph_ind_419$ESTADO) # Visualizo la variable ESTADO


## Descargar un pool de datos -------------------------------

eph_estado_1719 <- get_microdata(year = 2017:2019, trimester = 4, type = "individual", vars = c("CODUSU", "NRO_HOGAR", "ANO4", "ESTADO")) #Descargo las bases

eph_estado_1719 <- eph_estado_1719 %>%
  select(microdata) %>%
  unnest(cols = c(microdata)) #Ya que la información descargada se guarda en un objeto de tipo "lista", debemos des-anidar la columna "microdata" en donde están las bases.

rm(list = ls())

# Usando la EPH ------------------
## Pegado de bases ---------------------------
eph_ind_319 <- get_microdata(year = 2019, trimester = 3, type = "individual")
eph_ind_319 <- organize_labels(eph_ind_319, type = "individual")
eph_hog_319 <- get_microdata(year = 2019, trimester = 3, type = "hogar")
eph_hog_319 <- organize_labels(eph_hog_319, type = "hogar")

eph_hog_319 <- eph_hog_319 %>%
  select(!c(PONDERA, PONDIH, ANO4, TRIMESTRE, ITF, IPCF)) # Quito aquellas variables de la base de hogares que están repetidas en la de individuos

eph_319 <- eph_ind_319 %>%
  left_join(eph_hog_319, by = "CODUSU", "NRO_HOGAR") # Uno las bases


## Selección de población -----------------------------
### Selección espacial ------------------------------

attributes(eph_ind_319$AGLOMERADO) # revisamos la variable aglomerado

eph_ind_319_sel <- eph_ind_319 %>%
  filter(AGLOMERADO == 15) # Seleccionamos el aglomerado Formosa

nrow(eph_ind_319_sel) # Cantidad de casos relevados para el aglomerado


### Selección etaria ------------------------

eph_ind_319_sel <- eph_ind_319_sel %>%
  filter(CH06 >= 25)

nrow(eph_ind_319_sel)


### Selección por condición de actividad -----------------------

eph_ind_319_sel <- eph_ind_319_sel %>%
  filter(ESTADO == 1 | ESTADO == 2)

nrow(eph_ind_319_sel)


### Selección por unidad de análisis ------------------

attributes(eph_ind_319$CH03)

eph_ind_319_sel <- eph_ind_319_sel %>%
  filter(CH03 == 1) # Selecciono solo a los/las jefes/as de familia

nrow(eph_ind_319_sel)


## Datos ponderados -----------------------------------

eph_ind_319_sel %>%
  tally(PONDERA)
