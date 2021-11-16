#1
h_disease <- read.delim("choroby_serca.txt")
head(h_disease)

#2
cor(h_disease$rower, h_disease$palenie)
# wspolczynnik korelacji 0.015, czyli zmienne praktycznie nie sa ze soba skorelowane

hist(h_disease$choroby)
#histogram przybiera ksztalt dzwonu - jest to rozklad normalny

plot(h_disease$rower, h_disease$choroby)
plot(h_disease$palenie, h_disease$choroby)
#punkty na wykresie tworza ksztalt linii prostej - zmienne sa zalezne od siebie liniowo

#3
rower_model <- lm(choroby~rower+palenie, data=h_disease)

#4
summary(rower_model)

#a) Tak, mozna odrzucic, p-value < 2.2e-16
#   jazda na rowerze oraz palenie maja wplyw na wystepowanie chorob serca 

#b) Wraz z procentowym wzrostem liczby osob jezdzacych na rowerze, 
#   zachorowalnosc na choroby serca spada o 0.2 procenta
#   Wraz z procentowym wzrostem liczby osob palacych,
#   zachorowalnosc na choroby serca wzrasta o 0.17 procenta

#c)
RSS <- deviance(rower_model)
RSE <- sqrt(RSS/df.residual(rower_model))
fi2 <- RSS/sum((h_disease$choroby - mean(h_disease$choroby))^2)
R2 <- 1- fi2

# RSE = 0.654
# RSS = 211.74
# R2 = 0.98

#5
plot(rower_model,3)
# Tak, spelnia

#6
install.packages("ggiraphExtra")
library(ggiraphExtra)
ggPredict(fit = rower_model)
