library(ggplot2)
library(gapminder)
library(dplyr)

#1
A = c(1,2,3)
B = c(4,5,6)
C = A + B
sumaA = sum(A)
sumaB = sum(B)

#2
hotdogs = read.delim("hotdogs.txt", header = FALSE)
summary(hotdogs)

#3
weather = readRDS("weather.rds")
class(weather)
dim(weather)
colnames(weather)

#4
mg = read.delim("mg.txt", header = TRUE, dec=",")
ggplot(mg, aes(x, dT)) + geom_point(col="orange", size=2) + ggtitle("Anomalia magnetyczna") + xlab("x [m]") + ylab("dT [nT]")

#5
gapminder %>%
  filter(year==1957)
gapminder %>%
  filter(year==2002, country=="China")

#6
gapminder %>%
  arrange(desc(lifeExp))

#7
gapminder %>%
  filter(year==1957) %>%
  arrange(desc(pop))

#8
gapminder %>%
  filter(year==1952) %>%
  ggplot(aes(pop, lifeExp, col=continent)) + geom_point() + scale_x_log10()

#9
gapminder %>%
  filter(year==2007) %>%
  ggplot(aes(continent, gdpPercap)) + geom_boxplot()
