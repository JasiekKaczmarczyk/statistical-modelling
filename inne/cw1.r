library(tidyverse)

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
pmag = read.delim("mg.txt", header = TRUE, dec=",")
ggplot(pmag, aes(x,dT))+
  geom_point(col = "orange", shape = 18, size = 2)+
  ggtitle("Anomalia magnetyczna")+
  labs(x = "x [m]", y="dt [nT]")

#5
gpm <- gapminder::gapminder
head(gpm)
table(gpm$country)
a<-filter(gpm, gpm$year=="1957")
b<-filter(gpm, gpm$country=="China" & gpm$year=="2002")

#6
arrange(gpm, desc(gpm$lifeExp))

#7
gpm_1957 <- filter(gpm, gpm$year=="1957")
arrange(gpm_1957, desc(gpm_1957$pop))                  

#8
gpm_1952 <- filter(gpm, gpm$year=="1952")
ggplot(gpm_1952, aes(log(pop), lifeExp, colour = continent))+
  geom_point()+
  labs(x="pop", y="lifeExp")

#9
gpm_2007 <- filter(gpm, gpm$year=="2007")
ggplot(gpm_2007, aes(gdpPercap, continent, colour=continent))+
  geom_boxplot()+
  theme(legend.position = "none")
