library(csrplus)
library(tidyverse)
library(ggplot2)

df=quakes

#1
ggplot(df, aes(long, lat)) + geom_point()

#2
ggplot(df, aes(mag, stations)) + geom_point()

#3
ggplot(df, aes(mag, stations))+
  geom_point(pch=20, alpha = 0.3, colour = rgb(0.1, 0.2, 0.8)) +
  geom_jitter(width = 0.5, height = 0.5)

#4
Quake.mod = lm(stations~mag, data=df)
summary(Quake.mod)

#5
ggplot(df, aes(mag, stations))+
  geom_point(pch=20, alpha = 0.3, colour = rgb(0.1, 0.2, 0.8)) +
  geom_jitter(width = 0.5, height = 0.5) + 
  geom_abline(slope=Quake.mod$coefficients[2], intercept=Quake.mod$coefficients[1], color = "red")

#6
QuakeResiduals = Quake.mod$residuals
QuakeFittedValues = Quake.mod$fitted.values


ggplot(df, aes(mag, QuakeResiduals))+
  geom_point(pch=20, alpha = 0.3, colour = rgb(0.1, 0.2, 0.8))+
  geom_hline(yintercept=0, color = "red")+
  ggtitle("Residual Plot")+
  theme(plot.title = element_text(hjust = 0.5))+
  labs(x = "Magnitude", y="Residual")

#7
ggplot(df, aes(QuakeResiduals)) + geom_histogram()

#8
confinterval = confint(Quake.mod, level=0.95)

ggplot(df, aes(mag, stations))+
  geom_point(pch=20, alpha = 0.3, colour = rgb(0.1, 0.2, 0.8))+
  ggtitle("Fiji Earthquakes Magnitude and Reporting")+
  theme(plot.title = element_text(hjust = 0.5))+
  labs(x = "Magnitude", y="Nr of Stations Reporting")+
  geom_abline(slope=Quake.mod$coefficients[2], intercept=Quake.mod$coefficients[1], color = "red")+
  geom_abline(slope=confinterval[2], intercept=confinterval[1], color = "black")+
  geom_abline(slope=confinterval[4], intercept=confinterval[3], color = "black")


#9
RSS = sum((df$stations-Quake.mod$fitted.values)^2)
RSE = sqrt(RSS/(nrow(df)-2))
fi2 = RSS/sum((df$stations-mean(df$stations))^2)
R2 = 1 - fi2

#10
summary(Quake.mod)
# p-value: < 2.2e-16 - mozna odrzucic hipoteze zerowa

