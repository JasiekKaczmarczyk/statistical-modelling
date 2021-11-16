library(tidyverse)
library(ggplot2)
library(mosaic)

df = diamonds

#1
head(df)

#2
str(df)
summary(df)

#3
ggplot(df, aes(price)) + geom_histogram()
mean(df$price)
median(df$price)

#4
count(filter(df, df$price > 10000))

#5
mosaic::mean(price~clarity, data=df)

#6
ggplot(df, aes(color, price/carat, col=color)) + geom_boxplot()

#7
ggplot(df, aes(clarity, price, col=clarity)) + geom_boxplot()

#8
ggplot(df, aes(carat, price)) + geom_point()

#9
ndf = df %>%
  mutate(log_price=log10(price), log_carat=log10(carat))

ggplot(ndf, aes(log_carat, log_price)) + geom_point()

#10
price_carat.mod <- lm(log_price~log_carat, ndf)
summary(price_carat.mod)

#11
price_color.mod <- lm(log_price~color+cut, ndf)
summary(price_color.mod)

