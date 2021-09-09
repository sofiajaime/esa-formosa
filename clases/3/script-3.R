#############################################
# Curso ESA
# Script clase 3: EPH: Variables Socio-ocupacionales
# Agosto 2021
#############################################

###### PASO 1: PREPARAR LA BASE #############
# Paquetes que vamos a utilizar en la clase --------------------------
install.packages(c("tidyverse", "eph", "foreign")) # Descargar paquetes

library(tidyverse) # Abrir librerías
library(eph)
library(foreign)

# BASE 1: Descargamos la base individual:
eph_ind_215 <- eph::get_microdata(year = 2015, trimester = 2, type = "individual")

head(eph_ind_215)

glimpse(eph_ind_215)

# Descargamos CIUO:
# https://www.indec.gob.ar/indec/web/Institucional-Indec-BasesDeDatos

# BASE 2: Abrimos la base del 2do trimestre de 2015:
eph_ciuo_215 <- read.dbf("bases/eph_ciuo_215.dbf")

# BASE 2: Seleccionamos las variables:
# identificador de vivienda y del hogar;
# identificador de miembro del hogar; código CIUO
eph_ciuo_215 <- eph_ciuo_215 %>%
  select(CODUSU, NRO_HOGAR, COMPONENTE, PP04D_CIUO)

# BASE 2 A BASE 1: Pego la variable CIUO a la base eph_ind_215
eph_ind_215 <- eph_ind_215 %>%
  left_join(eph_ciuo_215, by = c("CODUSU", "NRO_HOGAR", "COMPONENTE"))

# Podemos etiquetar la base:
eph_ind_215 <- organize_labels(eph_ind_215, type = "individual") # Cambia formato de variables

# Convertimos a "character" para futuras operaciones:
eph_ind_215$CODUSU <- as.character(eph_ind_215$CODUSU)

###### PASO 2: EXPLORAR LA BASE #############
### Condición de actividad
table(eph_ind_215$ESTADO)

# Seleccionar únicamente a la población económicamente activa
eph_2015_PEA <- eph_ind_215 %>%
  filter(ESTADO == 1 | ESTADO == 2)

nrow(eph_2015_PEA) # Observamos la selección

### Ocupación
table(eph_ind_215$PP04D_COD)

# Ver componentes del CNO: carácter, jerarquía, tecnología y calificación ocupacional
eph_ind_215 <- organize_cno(base = eph_ind_215)

table(eph_ind_215$CALIFICACION)

# En variable PP04D_CIUO encontraremos a la ocupación codificada según el CIUO
table(eph_ind_215$PP04D_CIUO)

# Ver la ocupación más repetida: calculamos la moda
modeest::mfv(eph_ind_215$PP04D_CIUO, na.rm = TRUE)

### Rama de actividad
# Vemos la distribución de la población ocupada según la rama de actividad.
table(eph_ind_215$PP04B_CAES)

# 'organize_CAES' muestra: versión de la CAES, código de sección y división,
# etiqueta de sección y división y clasificación de ramas de actividad agregadas
eph_ind_215$PP04B_COD <- as.character(eph_ind_215$PP04B_COD) # corregir un error
eph_ind_215 <- organize_caes(base = eph_ind_215)

table(eph_ind_215$caes_eph_label) # vemos la distribución

### Categoría de ocupación
table(eph_ind_215$CAT_OCUP)

### Sector de actividad
table(eph_ind_215$PP04A)

### Tamaño del establecimiento
table(eph_ind_215$PP04C, eph_ind_215$PP04C99)

### Supervisión
eph_ind_215$cno_jerarquia <- str_sub(eph_ind_215$PP04D_COD, start = 3, end = 3)

# Filtramos jefes y supervisores:
eph_ind_215 %>%
  filter(cno_jerarquia == 2) %>%
  nrow()

# Borramos el objeto de nuestra base de datos
rm(eph_ciuo_215)

# Para ver más: Sub-Capítulo 5.3 del "libro ESA" ---------------------
