# Visualización de Datos en R: Gráficos Base vs. ggplot2

Serie de scripts en R desarrollados como práctica de visualización de datos, comparando la graficación con funciones base de R (`plot()`, `hist()`, `barplot()`) frente al enfoque de gramática de capas de **ggplot2**.

## 🎯 Objetivo

Practicar los principales tipos de gráficos estadísticos en R —dispersión, histogramas, barras y líneas/boxplots— replicando cada uno primero con funciones base y luego con ggplot2, para comparar sintaxis, flexibilidad y personalización entre ambos enfoques.

## 📊 Contenido de los scripts

| Script | Tema | Datos | Gráficos |
|---|---|---|---|
| `01_dispersión_disney.R` | Gráfico de dispersión | Vector propio (películas de Disney por año, 2010-2018) | `plot()` vs `geom_point()` |
| `02_histogramas_mtcars.R` | Histogramas | `mtcars` (caballos de fuerza) | `hist()` vs `geom_histogram()`, incluyendo comparación por tipo de motor |
| `03_barras_mtcars.R` | Gráficos de barras | `mtcars` (cilindros y marchas) | `barplot()` vs `geom_bar()`, con variantes apilada, agrupada (dodge) y apilada en porcentaje |
| `04_iris_lineas_boxplot.R` | Dispersión, líneas y boxplot | `iris` | `geom_point()` + línea de regresión, `geom_line()`, `geom_boxplot()` + `geom_jitter()` |

### Aspectos técnicos cubiertos
- Personalización de ejes, títulos, colores y leyendas en ambos enfoques
- Transformación de variables numéricas a categóricas con `factor()`
- Posiciones de barras: `stack`, `dodge`, `fill` (porcentual)
- Reutilización de objetos ggplot (`p <- ggplot(...)`) para evitar repetición de código
- Superposición de capas: puntos + línea de regresión (`geom_smooth`), boxplot + jitter

## 🛠️ Herramientas utilizadas

- **R** — funciones gráficas base (`plot`, `hist`, `barplot`)
- **ggplot2** — gramática de capas para visualización de datos
- Datasets incluidos en R: `mtcars`, `iris`

## 📂 Contenido del repositorio

| Archivo | Descripción |
|---|---|
| `01_dispersión_disney.R` | Gráfico de dispersión: base vs ggplot2 |
| `02_histogramas_mtcars.R` | Histogramas: base vs ggplot2 |
| `03_barras_mtcars.R` | Gráficos de barras: base vs ggplot2 |
| `04_iris_lineas_boxplot.R` | Dispersión, líneas y boxplot con ggplot2 |

## ▶️ Cómo ejecutarlo

1. Descarga los scripts
2. Ábrelos con **RStudio** (o R base)
3. Instala ggplot2 si no lo tienes:
   ```r
   install.packages("ggplot2")
   ```
4. Ejecuta cada script de forma independiente — todos usan datasets incluidos en R (`mtcars`, `iris`) o vectores definidos en el propio script, sin archivos externos

---
*Proyecto desarrollado como práctica de visualización de datos en R.*
