library(ggplot2)

data("iris")

iris

ggplot(data = iris,
       mapping = aes(x = Sepal.Length,
                     y = Sepal.Width,
                     color = Species)) +
  geom_point() +
  #geom_smooth()
  geom_smooth(method = 'lm')

#ejemplo2
ggplot(data = iris[iris$Species == 'setosa',],
       mapping = aes(x = 1:50,
                     y = Petal.Width)) +
  geom_line()

#ejemplo3
ggplot(data = iris,
       mapping = aes(x = rep(1:50,3),
                     y = Petal.Width,
                     color = Species)) +
  geom_line()

#ejemplo4
ggplot(data = iris,
       mapping = aes(x = Species, 
                     y = Petal.Width,
                     fill = Species)) +
  geom_boxplot() +
  geom_jitter()
