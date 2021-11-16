library(MASS)
library(tidyverse)
library(ggplot2)
library(mosaic)

df <- survey
summary(df)
string(df)

#1
meanAge <- mean(df$Age, na.rm = TRUE)
sdAge <- sd(df$Age, na.rm = TRUE)

#2
conf_int1 <- confint(df$Age, level = 0.95)

#3
conf_int2 <- round(meanAge+c(-1,1)*7/sqrt(237)*qnorm(.95),2)

#4
t.test(df$Age,conf.level=0.95)

#5
mean_5 <- c(1:1000)
for( i in seq(0,1000)){
  x <- c(mvrnorm(n=5, mu=10, Sigma=sqrt(3)))
  mean_5[i] <- mean(x)  
}
ggplot() + 
  aes(mean_5)+ 
  geom_histogram(colour="black", fill="white", bins = 20)

#6
mean_100 <- c(1:1000)
for( i in seq(0,1000)){
  x <- c(mvrnorm(n=100, mu=10, Sigma=sqrt(3)))
  mean_100[i] <- mean(x)  
}

ggplot() + 
  aes(mean_100)+ 
  geom_histogram(colour="black", fill="white", bins = 20)


#7
szczury <- read.delim("szczury.txt", header = FALSE)
colnames(szczury) <- "waga"

sample1 <- sample(szczury, size = 1000, replace = TRUE)

#8
mean_1000 <- c(1:1000)
for( i in seq(0,1000)){
  mean_1000[i] <- mean(szczury$waga[i])  
}
head(mean_1000)

#9
ggplot() + 
  aes(mean_100)+ 
  geom_histogram(colour="black", fill="white", bins = 20)
