#############################################
# Curso ESA
# Script clase 1: Breve introducción a R
# Agosto 2021
#############################################

#Ayuda -----------
?mean

?median

help(solve)

getRversion()

?help


#Funciones y comandos elementales ---------------------------------------------------------------

### verificar los objetos disponibles en el espacio de trabajo
ls()

### borrar un objeto
rm(cosa)

### retirar los objetos existentes en el área de trabajo
rm(list = ls ())

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
getwd()

### si el comando es una expresión, R devuelve el resultado
12 > 10

1+2+3

2+3*4

3/2 + 1

2 + (3 * 4)

(2 + 3) * 4

4 * 3^3

## Funciones matemáticas
### raíz cuadrada
sqrt(2)

sqrt(sin(45 * pi/180))

### valor absoluto
abs(-2)

### funciones trigonométricas
sin(3.14159)

sin(pi)

cos(8)

tan(92)

### funciones trigonométricas inversas
asin(42)

acos(64)

atan(95)

### exponenciales y logaritmos naturales
exp(643)

log(9232)


#Asignaciones-----------------------------------------------------------------------------
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

class(tf) # El comando class() nos sirve para saber qué tipo de objeto es

#Valores y vectores --------------------------------------------------------------

mi_valor <- 30 # número
un_valor <- "vaca" # caracteres
el_valor <- FALSE # booleano

### crear un vector
c() # Comando para crear un vector

x <- c(2, 3, 5, 7, 11)
x

mi_vector1 <- c(6,12,80,120)
mi_vector2 <- c("María","Esteban","Juan")

### si el vector contiene muchos elementos
x <- scan() # Los valores deben escribirse en la consola y presionar "enter" entre cada valor
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

a <- c(rep(2, 3), 4, 5, rep(1, 5))
a

## operaciones aritméticas y lógicas básicas que se aplican a los escalares se pueden aplicar a los vectores.
x <- 1:10
x*2

### los elementos de un vector se pueden extraer
xx[7]

### extraer varios elementos al mismo tiempo
xx[c(2, 3, 5, 7, 11)]

xx[85:91]

### guardar en nuevos vectores
yy <- xx[c(1, 2, 4, 8, 16, 32, 64)]
yy

### eliminar elementos correspondientes del vector
x <- c(1, 2, 4, 8, 16, 32)

x <- x[-4]


### obtener el número de elementos en un vector o en una lista de objetos:

length(xx)


#Matrices y listas --------------------------------------------------------------------------

x <- matrix(c(2, 3, 5, 7, 11, 13), nrow = 3)
x

y <- matrix(c(2, 3, 5, 7, 11, 13), ncol = 2)
x

z <- matrix(1:16, ncol = 4)
z

## matrices "multidimensionales"

w <- 1:20
ay <- array(w, dim = c(5, 2, 2))


### la función dim() devuelve el tamaño (número de filas y número de columnas) de la matriz indicada como argumento.

dim(x)

### extraer una fila o columna completa
x[, 1] #Extraigo primera columna
x[3, ] #Extraigo tercera fila


### Creo una lista
lista1 <- list(x,y,z)

### acceder a la información de una lista
lista1[[1]]
lista1[[2]]
lista1[[3]]


#Filtrado(Subsetting)----------------------------------------------------------------------------------
mi_vector <- 1:10
mi_vector[3:5] # extraer elementos
mi_vector[c(1,2,9)] # extraer valores específicos

nuevo_vector <- mi_vector[3:5] # asignar elementos a vector nuevo, funciona como filtro

### diferencia entre [[]] y [] en las listas
nueva_lista <- lista1[1] # Devuelve la lista

nuevo_valor <-  lista1[[1]] # Devuelve un objeto que estaba en la lista

### usar [] para el subset de una lista:
nueva_lista <- lista1[1:2]


# Cargar datos en R ------------------------------------------------------------------------------
## Data Frames------------------
numero_estudiante <- c(1:10)

notas <- c("A","B","C","A","C","F","D","B","B","A")

clase <- c(rep(0,times = 5),rep(1,times = 5))

comida_gratis <- rep(TRUE,times = 10)

### unir los vectores que hemos creado antes en un data frame
mis_datos <- data.frame(numero_estudiante,
                            notas,
                            clase,
                            comida_gratis,
                            stringsAsFactors = FALSE)

### asignar el nombre de las columnas:
colnames(mis_datos) <- c("numero_estudiante", "notas","clase","comida_gratis")
mis_datos #revisamos el data frame

### indexación funciona de la misma manera para las matrices
mis_datos[,1]
mis_datos[2,4]
mis_datos$numero_estudiante # $ Indexación de columnas
mis_datos$notas[3] # Indexación de columnas como vectores


## Subsetting inteligente para data frames

which(mis_datos$notas == "A")

### crear un dataset con ciertas características
A_estudiantes <- which(mis_datos$notas == "A")
B_estudiantes <- which(mis_datos$notas == "B")
estudiantes_dataset_reducido <- c(A_estudiantes, B_estudiantes)

### seleccionar el vector para indexar únicamente algunas fila
seleccion_data <- mis_datos[estudiantes_dataset_reducido,]

### Otra manera sencilla es utilizar el comando subset()
seleccion_data2 <- subset(mis_datos, notas == "A" | notas == "B")


## Listas ----------------------------------------------------------------------------------
## Hacer una lista de estructuras de datos
mi_lista <- vector(mode = "list", length = 10)

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
mi_lista <- append(mi_lista, list(list(27,14,"perro")))

### observar el contenido de la lista:
print(mi_lista)

## Importar datos-----------------------------------------------------------
### Importar datos desde Excel
install.packages("readxl") ## instalar paquete en la consola

library(readxl) ## abrir librería del paquete

## asignar nombre a datos, pegar nombre del directorio
estaciones <- read_excel("bases/estaciones_tren.xls")

### comprobar que el trabajo se haya realizado bien
estaciones ## aparecerán nuestros datos en la consola misma.
View(estaciones) ## los datos se visualizarán en una nueva pestaña
