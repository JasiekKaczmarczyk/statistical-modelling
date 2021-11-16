library(ggplot2)

#1
dane <- read.delim('dane4.txt')
plot1 <- ggplot(dane, aes(x=X, y=Y))+
  geom_point(colour="blue", pch=20, size=2 )

#2
lm_dane <- lm(Y~X, dane)
summary(lm_dane)

#2a
#79% - dokadnosc, wiec blad 21%
#median = -199.2
#std = -1073.6

#3
plot1 <- plot1 +
  geom_abline(intercept = coef(lm_dane)[1], slope = coef(lm_dane)[2], col="red", size = 2)
plot1  

#4
plot2 <- plot(dane$X,dane$Y, pch=20 )

for( i in seq(2,12)){
  mod <- lm(Y~poly(X, i, raw=TRUE), dane)
  plot(dane$X,dane$Y, pch=20 )
  lines(dane$X, predict(mod), col=i, lwd = 2 )
}

#5
for( i in seq(2,12)){
  mod <- lm(Y~poly(X, i, raw=TRUE), dane)
  summary(mod)
}
#dopasowanie 92%
