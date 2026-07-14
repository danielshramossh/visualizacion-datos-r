# ============================================
# PARTE 1: Gráficos de barras con la función base barplot()
# ============================================

# Cargamos el dataset mtcars
data("mtcars")
mtcars

# Tabla de frecuencias: cuántos autos hay para cada número de cilindros (4, 6, 8)
table(mtcars$cyl)

# Gráfico de barras simple a partir de la tabla de frecuencias
# Sin personalización: R usa colores y etiquetas por defecto
barplot(table(mtcars$cyl))

# Gráfico de barras personalizado
barplot(table(mtcars$cyl),
        col = 'green',              # Color de relleno de las barras
        border = 'red',             # Color del borde de las barras
        main = 'Cantidad de autos según número de cilindros',  # Título principal
        sub = 'Dataset mtcars',     # Subtítulo (nota debajo del gráfico)
        xlab = 'Número de cilindros',  # Etiqueta eje X
        ylab = 'Cantidad de autos')    # Etiqueta eje Y

# ============================================
# PARTE 2: Gráficos de barras con ggplot2
# ============================================

library(ggplot2)

# Gráfico de barras básico: cantidad de autos por número de cilindros
# factor(cyl) convierte la variable numérica en categórica, ya que cyl 
# representa grupos (4, 6, 8 cilindros) y no una escala continua
ggplot(data = mtcars,
       mapping = aes(x = factor(cyl))) +
  geom_bar() +
  coord_flip() +                          # Invierte los ejes (barras horizontales)
  labs(title = 'Cantidad de autos según número de cilindros',
       x = 'Número de cilindros',
       y = 'Cantidad de autos')

# Objeto base reutilizable: guardamos el mapeo de datos y estética
# para no repetirlo en cada gráfico siguiente
# fill = factor(gear) colorea las barras según el número de marchas (cajas de cambio)
p <- ggplot(data = mtcars,
            mapping = aes(x = factor(cyl),
                          fill = factor(gear))) 

# --- Gráfico apilado (stacked) ---
# Cada barra de cilindros se divide por color según cantidad de marchas,
# y los segmentos se apilan uno sobre otro (total = altura completa)
p + geom_bar(position = 'stack', stat = 'count') +
  labs(title = 'Autos por cilindros, apilados según número de marchas',
       x = 'Número de cilindros',
       y = 'Cantidad de autos',
       fill = 'Marchas (gear)')

# --- Gráfico agrupado (dodge) ---
# En vez de apilarse, las barras de cada grupo (marchas) se colocan
# una al lado de la otra, facilitando la comparación directa
p + geom_bar(position = 'dodge', stat = 'count') +
  labs(title = 'Autos por cilindros, comparados según número de marchas',
       x = 'Número de cilindros',
       y = 'Cantidad de autos',
       fill = 'Marchas (gear)')

# --- Gráfico apilado en porcentaje (stacked %) ---
# Similar al 'stack', pero todas las barras tienen la misma altura (100%)
# Útil para comparar proporciones en vez de cantidades absolutas
p + geom_bar(position = 'fill', stat = 'count') +
  labs(title = 'Proporción de marchas según número de cilindros',
       x = 'Número de cilindros',
       y = 'Proporción',
       fill = 'Marchas (gear)')
