
#1
library(tidyverse)
head(diamonds)

#2
str(diamonds)
summary(diamonds)

#3
ggplot(diamonds, aes(price))+
  geom_histogram()
median(diamonds$price)
mean(diamonds$price)

#4
count(filter(diamonds, diamonds$price>10000))

#5
install.packages("mosaic")
library(mosaic)
mean(price~clarity, data=diamonds)

#6
ggplot(diamonds, aes(y=price/carat, x=color, color = color))+
  geom_boxplot()

#7
ggplot(diamonds, aes(clarity, price, group=clarity))+
  geom_boxplot()

#8
ggplot(diamonds, aes(carat, price))+
  geom_point()

#9
log_diamonds <- mutate(diamonds, log_carat=log(carat), log_price=log(price))
str(log_diamonds)

#10
price_carat.mod <- lm(log_price~log_carat, log_diamonds)
summary(price_carat.mod)

#11
price_color.mod <- lm(log_price~color+cut, data=log_diamonds)
summary(price_color.mod)
