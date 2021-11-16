#1
#zaladowanie pakietu MASS oraz danych
library(MASS)
srv <- survey
summary(srv)
str(srv)
#usuniecie wierszy dla ktorych wystepuja wartosci na
srv <- na.omit(srv)
summary(srv)

meanAge <- mean(srv$Age)
sdAge <- sd(srv$Age)

#2
conf_int <- round(meanAge+c(-1,1)*sdAge/sqrt(168)*qnorm(.975),2)
# srednia: 20.43358 
# przedzial: (19.51, 21.36)

#3
sd_pop <- 7
#??????????????????????????????

#4
#?????????????????????????????

#5
library(ggplot2)
meanTab_5 <- c(1:1000)
for( i in seq(0,1000)){
  x <- c(mvrnorm(n=5, mu=10, Sigma=sqrt(3)))
  meanTab_5[i] <- mean(x)  
}
ggplot() + 
  aes(meanTab_5)+ 
  geom_histogram(binwidth=0.1, colour="black", fill="white")+
  xlim(7,12)+
  ylim(0,80)

#6
meanTab_100 <- c(1:1000)
for( i in seq(0,1000)){
  x <- c(mvrnorm(n=5, mu=10, Sigma=sqrt(3)))
  meanTab_100[i] <- mean(x)  
}
meanTab_100
ggplot() + 
  aes(meanTab_100)+ 
  geom_histogram(binwidth=0.1, colour="black", fill="white")+
  xlim(7,12)+
  ylim(0,80)

#7
