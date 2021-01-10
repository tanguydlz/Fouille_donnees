setwd("D:/T�l�chargements/M2/fouille de donn�es")

library(e1071)
library(dplyr)
library(caTools)

set.seed(123)

load(file = "Xtrain.Rdata")
load(file = "ytrain.Rdata")
load(file = "Xtest.Rdata")
load(file = "ytest.Rdata")

ech = sort(sample(nrow(Xtrain), nrow(Xtrain)*.1))
Xtrain=Xtrain[ech,]
ytrain = ytrain[ech]

#SVM
model <- svm(model.matrix(~., Xtrain), ytrain, scale=T, kernel="linear")
summary(model)