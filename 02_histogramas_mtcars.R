# ============================================
# PARTE 1: Histogramas con la función base hist()
# ============================================

# Cargamos el dataset mtcars (datos de características de automóviles)
data("mtcars")

# Histograma simple de la variable hp (caballos de fuerza)
# Sin personalización: R decide automáticamente el número de barras (breaks)
hist(mtcars$hp)

# Histograma personalizado
hist(mtcars$hp,
     # breaks = 50,             # Alternativa: pedir ~50 cortes (R ajusta automáticamente)
     breaks = seq(50, 350, 50), # Cortes definidos manualmente: de 50 a 350, cada 50 unidades
     # Esto crea barras de ancho fijo (50, 100, 150, ..., 350)
     col = 'darkgray',          # Color de relleno de las barras
     border = 'gray10',         # Color del borde de las barras
     main = 'Histograma: caballos de fuerza', # Título del gráfico
     xlab = 'x',                # Etiqueta eje X
     ylab = 'conteo')           # Etiqueta eje Y (frecuencia/conteo)

# ============================================
# PARTE 2: Histogramas con ggplot2
# ============================================

# Cargamos ggplot2 para gráficos más flexibles
library(ggplot2)

# Histograma simple de hp usando geom_histogram()
# bins = 20 define el número de barras (a diferencia de 'breaks' en hist(), 
# aquí se especifica la CANTIDAD de intervalos, no los límites exactos)
ggplot(data = mtcars,
       mapping = aes(x = hp)) +
  geom_histogram(bins = 20)

# Histograma comparando la distribución de hp según el tipo de motor (vs)
# vs es una variable numérica (0/1), por eso se convierte con factor()
# para que ggplot la trate como categoría y no como número continuo
ggplot(data = mtcars,
       mapping = aes(x = hp,
                     fill = factor(vs))) +   # Relleno de color según tipo de motor (0 = V-shaped, 1 = recto)
  geom_histogram(bins = 9,
                 position = 'identity',      # Las barras se superponen en su posición real
                 # (en vez de apilarse una encima de otra)
                 alpha = 0.8) +               # Transparencia de las barras (0 = invisible, 1 = opaco)
  # Necesario para poder ver ambas distribuciones superpuestas
  labs(title = 'Distribución de caballos de fuerza (hp) según tipo de motor',  # Título principal: describe qué se compara
       subtitle = 'Datos del dataset mtcars',                                  # Subtítulo: indica el origen de los datos
       x = 'Caballos de fuerza (hp)',                                          # Etiqueta eje X: variable y unidad
       y = 'Frecuencia (conteo de autos)',                                     # Etiqueta eje Y: qué representa la altura de las barras
       fill = 'Tipo de motor',                                                 # Título de la leyenda: aclara qué representan los colores
       caption = 'Fuente: dataset mtcars (R base)')    
