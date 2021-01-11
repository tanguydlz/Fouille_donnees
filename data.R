setwd("D:/Téléchargements/M2/fouille de données")

library(e1071)
library(dplyr)
library(caTools)

set.seed(123)

load(file = "Xtrain.Rdata")
load(file = "ytrain.Rdata")
load(file = "Xtest.Rdata")
load(file = "ytest.Rdata")

ech = sort(sample(nrow(Xtrain), nrow(Xtrain)*.01))
ech2 = sort(sample(nrow(Xtest), nrow(Xtest)*.1))
Xtrain=Xtrain[ech,]
ytrain = ytrain[ech]

Xtest = Xtest[ech2,]
ytest = ytest[ech2]

library(ROSE)

Xytrain = cbind(Xtrain,ytrain)
table(Xytrain$ytrain)

#métohde over et under sampling
Xytrain2 <- ovun.sample(ytrain ~ ., data = Xytrain, method = "both", p=0.5, seed=1)$data
table(Xytrain2$ytrain)

Xtrain2 = Xytrain2[,1:17]
ytrain2 = Xytrain2[,18]

model2 <- svm(Xtrain2, ytrain2, scale=T, type= "C-classification",kernel='linear')
summary(model2)

#Prédiction sur les données test
pred2 = predict(model2, newdata = Xtest)
#Matrice de confusion
cm = table(pred2, ytest); cm
#Taux d'erreur
err2 = (cm[1,2] + cm[2,1])/sum(cm); err2

roc.curve(ytest, pred2)

#méthode ROSE
#Les données générées par le suréchantillonnage ont prévu une quantité d'observations répétées. 
#Les données générées par le sous-échantillonnage sont privées d'informations importantes par rapport aux données d'origine. 
#Ce qui entraîne des inexactitudes dans les performances résultantes. Pour faire face à ces problèmes, ROSE nous aide à générer des données de manière synthétique également. 
#Les données générées par ROSE sont considérées comme fournissant une meilleure estimation des données originales.


Xytrain3 <- ROSE(ytrain ~ ., data = Xytrain, seed = 1)$data
table(Xytrain3$ytrain)

#Cet ensemble nous fournit également des méthodes pour vérifier l'exactitude du modèle en utilisant la méthode de bagging et holdout.
#Cela nous permet de nous assurer que nos prévisions résultantes ne souffrent pas d'une variance élevée.
ROSE.holdout <- ROSE.eval(ytrain ~ ., data = Xytrain3, learner = svm, method.assess = "holdout", extr.pred = function(obj)obj, seed = 1)
ROSE.holdout

#Nous constatons que notre précision se maintient à ~ 0,89 et montre que nos prévisions ne souffrent pas d'une variance élevée.

#leave-K-out cross validation trop long
# ROSE.cv <- ROSE.eval(ytrain ~ ., data = Xytrain3, learner = svm, method.assess = "LKOCV", extr.pred = function(obj)obj, seed = 1)
# ROSE.cv

Xtrain = Xytrain3[,1:17]
ytrain = Xytrain3[,18]

model <- svm(Xtrain, ytrain, scale=T, type= "C-classification",kernel='linear')
summary(model)

#Prédiction sur les données test
pred = predict(model, newdata = Xtest)
#Matrice de confusion
cm = table(pred, ytest); cm
#Taux d'erreur
err = (cm[1,2] + cm[2,1])/sum(cm); err

roc.curve(ytest, pred)

#bien meilleur avec méthode rose que Combined under/over


