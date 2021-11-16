library(sp)
library(tidyverse)
library(ggplot2)

df <- data.frame(readRDS("gleby.rds"))
colnames(df)

#1
min(df$pH, na.rm = TRUE)
max(df$pH, na.rm = TRUE)
var(df$pH, na.rm=TRUE)
sd(df$pH,na.rm=TRUE)
quantile(df$pH, prob=c(0.25,0.5,0.75), na.rm = TRUE)

#2
ggplot(df, aes(pH)) + geom_histogram()

#3
ggplot(df, aes(pH)) + geom_density()

#4
ggplot(df, aes(sample = pH)) + stat_qq() + stat_qq_line(col="red")

#5
ggplot(df, aes(pH)) + stat_ecdf()

#6
shapiro.test(df$pH)
# p-value = 6.04e-09 < 0.05 <- hipoteza odrzucona

#7
ks.test(df$pH, "pnorm")
# D = 0.99995, p-value < 2.2e-16