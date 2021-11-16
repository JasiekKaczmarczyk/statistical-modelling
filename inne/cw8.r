#1
weather <- read.csv2(file = "weather.csv", stringsAsFactors = FALSE)
head(weather)

#2
summary(weather)
str(weather)

#3
#federalstate
#stationname
#dwd_id
#id
#period

#4,5
library(tidyverse)
count(weather)

weather <- filter(weather, complete.cases(weather))
count(weather)
weather <- weather[c(5:7,9:22)]
str(weather)

#6
install.packages("caTools")
library(caTools)
result = sample.split(weather$MEAN.ANNUAL.RAINFALL, SplitRatio = 0.8)

train = weather[result==TRUE,]
str(train)
test = weather[result==FALSE,]
str(test)

#7
rain_test <- test[11]
rain_train <- train[11]

m_train <- train[c(1:10,12:17)]
m_test <- test[c(1:10,12:17)]

#8
install.packages("GGally")
library(GGally)
ggpairs(m_train)
ggpairs(m_test)

#9
corr <- cor(m_train)
str(corr)
head(corr)

#10
library(corrplot)
corrplot(corr, method = "number", type = "lower")

#11
