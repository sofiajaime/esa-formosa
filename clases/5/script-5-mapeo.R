#############################################
# Curso ESA
# Script clase 5: Mapeo de clases sociales
# Septiembre 2021
#############################################

#USAREMOS LA BASE CONSTRUIDA EN LA SESIÓN ANTERIOR. EJECUTAR PRIMERO EL SCRIPT DE CONDICIONES DE VIDA.

library(sf)
library(ggthemes)

# 1) Construimos un objeto tabla cruzando la variable clase6_factor y region_f
tabla_provincias <- eph_hog %>%
  filter(!is.na(clase6_factor)) %>%
  group_by(PROVINCIA, clase6_factor) %>%
  tally(wt = PONDERA) %>%
  group_by(PROVINCIA) %>%
  mutate(percent = round((n/sum(n)) * 100, digits = 2))

names(tabla_provincias)[1] <- "codpcia"

# 2) Cargamos el archivo .shp y lo guardamos en el objetivo espacial 'argentina'
argentina <- st_read("cartografia/argentina_n.shp")

# 3) Filtramos al territorio antártico ya que no contamos con información en la EPH y se dificulta la visualización del mapa
argentina <- argentina %>%
  filter(!link %in% c("94028"))

# 4) Definimos dentro del objeto geográfico 'argentina' a la columna link como carácter y a la columna codpcia como numérica
argentina$link <- as.character(argentina$link)
argentina$codpcia <- as.numeric(argentina$codpcia)

# 5) Unimos el objeto 'argentina' con la tabla larga que contiene los porcentajes por clase y provincia, tomando como variable identificadora REGION
mapa <- merge(argentina, tabla_provincias, by = "codpcia", all.x = TRUE)

# 6) Construimos el mapa con ggplot y lo personalizamos

ggplot() +
  geom_sf(data = mapa, aes(group = codpcia, fill = percent), color = NA) +
  theme_map() +
  labs(fill = "% Clase social",
       title = "Distribución de las clases sociales por provincia",
       subtitle = "Hogares. Argentina urbana 2018.",
       caption = "Fuente: Elaboración propia en base a EPH total urbana 2018.") +
  theme(legend.title = element_text(size = 10, face = "bold"),
        legend.text = element_text(size = 9),
        legend.key.width = unit(1.5, "cm"),
        legend.position = "bottom",
        legend.justification = "center",
        plot.title = element_text(size = 12, face = "bold"),
        plot.subtitle = element_text(size = 11),
        plot.caption = element_text(size = 10, hjust = 1),
        strip.text = element_text(face = "bold", size = 10)) +
  scale_fill_viridis_c(direction = -1) +
  facet_wrap(~clase6_factor, ncol = 7, labeller = labeller(clase6_factor = label_wrap_gen(15)))

ggsave(filename = "clases/5/mapa_clases.png", dpi = 300, type = "cairo", width = 8, height = 6)
