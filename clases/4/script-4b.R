#############################################
# Curso ESA
# Script clase 4b: Operacionalización automática
# Septiembre 2021
#############################################


# Paquetes que vamos a utilizar en la clase --------------------------
install.packages(c("tidyverse", "scales")) # Descargar paquetes

install.packages("devtools")
devtools::install_github("DiogoFerrari/occupar", dependencies = F)

library(tidyverse)
library(occupar)
library(scales)


# Transformamos la variable CIUO en la escala ISEI -----------------

eph_ind_215$isei <- isco08toISEI08(eph_ind_215$PP04D_CIUO)

# Vemos algunos datos exploratorios ----------------------
summary(eph_ind_215$isei)

eph_ind_215 %>%
  ggplot(aes(x = isei, weight = PONDERA)) +
  geom_histogram() +
  scale_x_continuous(breaks = seq(10, 90, 5)) +
  scale_y_continuous(labels = scales::comma, breaks = seq(0, 1500000, 100000))
