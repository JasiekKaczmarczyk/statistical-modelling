library(sp)
library(tidyverse)

#1
gleby <- data.frame(readRDS("gleby.rds"))
colnames(gleby)
gleby_pH <- gleby[,3]

summary(gleby_pH)
var(gleby_pH, na.rm=TRUE)
sd(gleby_pH,na.rm=TRUE)

#2
ggplot(gleby, aes(pH))+
  geom_histogram()

#3
ggplot(gleby, aes(pH))+
  geom_density()

#4
qplot(sample=gleby_pH)

#5
ggplot(gleby, aes(pH)) + stat_ecdf()

#6 hipoteza odrzucona
shapiro.test(gleby_pH)
6.04e-09 < 0.05

#7
ks.test(gleby_pH, "pnorm")
# p-value < 2.2e-16