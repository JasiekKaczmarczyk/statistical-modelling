library(ggplot2)
library(tidyverse)

#1
dane <- read.delim('dane4.txt')
plot1 <- ggplot(dane, aes(x=X, y=Y))+
  geom_point(colour="blue", pch=20, size=2 )

#2
lm_dane <- lm(Y~X, dane)
summary(lm_dane)
plot1

#79% dokladnosci

#3
plot1 +geom_abline(intercept = coef(lm_dane)[1], slope = coef(lm_dane)[2], col="red", size = 2)

#4
plot2 <- plot(dane$X,dane$Y, pch=20 )

for( i in seq(2,12)){
  mod <- lm(Y~poly(X, i, raw=TRUE), dane)
  plot(dane$X,dane$Y, pch=20 )
  lines(dane$X, predict(mod), col=i, lwd = 2 )
}

#5
rse <- c()
r2 <- c()

for( i in seq(2,12)){
  mod <- lm(Y~poly(X, i, raw=TRUE), dane)
  rse <- append(rse, summary(mod)[6])
  r2 <- append(r2, summary(mod)[8])
}

# 0.9235 dokladnosci - R-squared