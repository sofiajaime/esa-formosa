#############################################
# Curso ESA
# Script clase 1: Comandos iniciales
# Agosto 2021
#############################################

## Pedir ayuda
?mean

?median

## Tips

### Para pedir ayuda en R
help(solve)

?solve

help("[[")

getRversion()

?help

## Funciones y comandos elementales

### verificar los objetos disponibles en el espacio de trabajo
ls()

### borrar un objeto
rm(cosa)

### retirar los objetos existentes en el área de trabajo
rm (lista = ls ())

### almacenar el espacio de trabajo
save.image ()

### restaurar el espacio de trabajo
load(".RData")
### si el archivo tiene un nombre diferente
load("ilmiofile.Rdata")

### guardar en formato ASCII y recargar en R el historial
savehistory()

loadhistory()

### cambiar los libros de trabajo
setwd()

### ver el directorio de trabajo actual
getwd ()

### si el comando es una expresión, R devuelve el resultado
12 > 10

1+2+3

2+3*4

3/2 + 1

2 + (3 * 4)

(2 + 3) * 4

4 * 3^3

## Funciones matemáticas:
### raíz cuadrada
sqrt(2)

sqrt(sin(45 * pi/180))

### valor absoluto
abs
### funciones trigonométricas
sin(3.14159)

sin(pi)

cos

tan
### funciones trigonométricas inversas
asin

acos

atan
### exponenciales y logaritmos naturales
exp

log

## Asignaciones
## guarda el resultado en un objeto con un nombre
x <- sqrt(2)

### llamar al nuevo objeto
x

### operar con el objeto
x^3

y <- x^3

x <- 10
x > 10

x <= 10

tf <- x > 10
tf

## Valores y vectores

mi_valor <- 30 # número
un_valor <- "vaca" # caracteres
el_valor <- FALSE # booleano

### crear un vector
c()

x <- c(2, 3, 5, 7, 11)
x

mi_vector <- c(6,12,80,120)
mi_vector <- c("María","Esteban","Juan")

### si el vector contiene muchos elementos
scan()

### ejemplo 1
x <- scan()
1: 1
2: 6
3: 3
4: 4
5:

x

### ejemplo 2
x <- scan()

1: 23; 34; 32
4: 33; 88; 44
7:

x

## crear una secuencia de números de a a b
### ejemplo 1
xx <- 1:10

xx
### ejemplo 2
xx <- 100:1

xx

### crear vectores que contienen elementos repetidos
rep(2, times = 3)

a = c(rep(2, 3), 4, 5, rep(1, 5))
a


## operaciones aritméticas y lógicas básicas que se aplican a los escalares se pueden aplicar a los vectores.

x <- 1:10
x*2

### elementos de un vector se pueden extraer

xx[7]

### extraer varios elementos al mismo tiempo

xx[c(2, 3, 5, 7, 11)]

xx[85:91]

### guardar en nuevos vectores:

yy <- xx[c(1, 2, 4, 8, 16, 32, 64)]
yy

### eliminar elementos correspondientes del vector

x <- c(1, 2, 4, 8, 16, 32)
x

x[-4]
### obtener todos los números en un rango

mi_vector <- 1:20

### repetir un valor específico

repeated_values <- rep(23, times = 50)


### indexar elementos de un vector

mi_vector[5]

### obtener el número de lementos en un vector o en una lista de objetos:

length(mi_vector)

## Matrices

x <- matrix(c(2, 3, 5, 7, 11, 13), nrow = 3)
x



x <- matrix(c(2, 3, 5, 7, 11, 13), ncol = 2)
x


### array: matrices "multidimensionales"


x <- 1:20
ax <- array(x, dim = c(5, 2, 2)) > ax


## las matrices se forman insertando distintos elementos por columna

1,24,32,36,33
2,16,44,34,33
3,20,31,43,32
4,23,35,37,35
5,27,40,40,31
6,19,43,32,37
```

### l contenido del archivo se puede adquirir y asignar a una matriz de 6 × 5 con los comandos:

x2 <- scan("matdata", sep = ",")

mx <- matrix(x2, ncol = 5, byrow = TRUE)
mx

### argumento byrow = TRUE especifica que el contenido debe adquirirse por fila y no por columna

### función dim () devuelve el tamaño (número de filas y número de columnas) de la matriz indicada como argumento.

dim (mx)

### extraer una fila o columna completa
x[, 1]

x[3, ]

### extraer subconjuntos de filas y / o columnas.
x <- matrix(1:16, ncol = 4)
x

### acceder a la información de una lista
lista1[[1]]
[1] 1 2 3


lista1[[2]]
[1] "A" "B" "C"

### asignar un nombre a cada uno de los componentes de una lista
lista2 <- list(comp1 = x1, comp2 = x2)
lista2

$comp1
[1] 1 2 3

$comp2
[1] "A" "B" "C"

lista2$comp2
[1] "A" "B" "C"

lista2$comp2[3]

[1] "C"

## Subsetting
mi_vector <- 1:10
mi_vector[3:5] # extraer elementos
nuevo_vector <- mi_vector[3:5] # asignar elementos a vector nuevo

mi_vector[c(1,2,9)] # extraer

### usar la función c() para quitar algunos subsets
mi_matriz[c(1:3,5),c(2,4)]

### diferencia entre [[]] y [] en las listas:
nueva_lista <- mi_lista[1] # Devuelve la lista

nuevo_valor <-  mi_lista[[1]] # Devuelve un objeto que estaba en la lista

### usar [] para el subset de una lista:

nueva_lista <- mi_lista[1:2]

## Subsetting inteligente
which(mis_datos$Notas == "A")

### crear un dataset con ciertas características
A_estudiantes <- which(mis_datos$notas == "A")
B_estudiantes <- which(mis_datos$notas == "B")
estudiantes_dataset_reducido <- c(A_estudiantes, B_estudiantes)

### seleccionar el vector para indexar únicamente algunas fila
seleccion_data <- mis_datos[estudiantes_for_reduced_dataset,]

## Cargar datos en R
### Data Frames
numero_estudiante <- c(1:10)

notas <- c("A","B","C","A","C","F","D","B","B","A")

clase <- c(rep(0,times = 5),rep(1,times = 5))

comida_gratis <- rep(TRUE,times = 10)

### unir los vectores que hemos creado antes
mis_datos <- data.frame(numero_estudiante,
                            notas,
                            clase,
                            comida_gratis,
                            stringsAsFactors = FALSE)

### esignar el nombre de las columnas:
nombrecol(mis_datos) <- c("numero_estudiante", "notas","clase","comida_gratis")

### darle nombre a las filas:
nombrefila(mis_datos) <- LETTERS[11:20]

### indexación funciona de la misma manera para las matrices
mis_datos[,1]
mis_datos[2,4]
mis_datos$numero_estudiante # $ Indexación de columnas
mis_datos$notas[3] # Tratar $ Indexación de columnas como vectores

## Hacer una lista de estructuras de datos
mi_lista <- vector(mode = "lista", length = 10)

### crear una lista a partir de objetos
mi_lista <- list(num = 10,
                animal = "vaca",
                vec = c(1:10),
                dat = mis_datos)
## crear una lista vacía y luego llenarla
mi_lista <- list()

mi_lista$num = 10
mi_lista$dat = mis_datos
mi_lista$cancion_favo = "Malamente"

### pegar listas al final de otras listas
mi_lista <- append(mi_list, list(list(27,14,"perro")))

### observar el contenido de la lista:
print(my_list)

## Importar datos
### Importar datos desde Excel
install.packages("readxl") ## instalar paquete en la consola

library(readxl) ## abrir librería del paquete

## asignar nombre a datos, pegar nombre del directorio
encuesta <- read_excel("/Users/sofiajaime/Documents/rprojects/primer_proyecto/datos/encuesta1.xlsx")

### este directorio es sólo un EJEMPLO.

### comprobar que el trabajo se haya realizado bien
encuesta ## aparecerán nuestros datos en la consola misma.
