# ============================================
# PARTE 1: Gráfico base con plot()
# ============================================

# Vector con los años (como texto/character, del '10' al '18')
year <- c('2010','2011','2012','2013','2014','2015','2016','2017','2018')

# Vector con la cantidad de películas de Disney estrenadas cada año
disney <- c(11, 13, 11, 8, 12, 11, 12, 8, 10)

# Gráfico simple de dispersión con la función base plot()
# Sin personalización: R usa valores por defecto para ejes, título y puntos
plot(x = year,
     y = disney)

# Mismo gráfico, pero personalizado
plot(x = year,
     y = disney,
     main = 'Gráfico de películas de Disney por año',          
     xlab = 'year',                 
     ylab = 'no. de películas',                 
     col = 'cornflowerblue',    
     pch = 16,                  
     panel.first = grid())      

# ============================================
# PARTE 2: Mismo gráfico con ggplot2
# ============================================

# Cargamos la librería ggplot2 para gráficos más flexibles y estéticos
library(ggplot2)

# Convertimos los vectores en un data frame
# ggplot2 requiere que los datos estén en formato data frame (no vectores sueltos)
peliculas <- data.frame(year, disney)

# Construcción del gráfico con la gramática de capas de ggplot2
ggplot(data = peliculas, 
       mapping = aes(x = year,      
                     y = disney)) + 
  geom_point() +                    
  labs(title = 'Gráfico de películas de Disney por año')           
