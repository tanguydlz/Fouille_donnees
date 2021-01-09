#setwd("C:/Users/Axelle/Desktop/M/03_SISE/06_FOUILLE DE DONNEES MASSIVES/PROJET")

#importation des données
datas = read.table("dataproject.txt", sep = ";", header = TRUE)
#target = datas$FlAgImpAye
#features = datas[,-23]
summary(datas)
str(datas)

##########Preprocessing
#Remplacer les "," par des "."
datas$MontAnt = sub(",", ".", datas$MontAnt) 
datas$ScoringFP1 = sub(",", ".", datas$ScoringFP1)
datas$ScoringFP2 = sub(",", ".", datas$ScoringFP2)
datas$ScoringFP3 = sub(",", ".", datas$ScoringFP3)
datas$TAuxImpNb_RB = sub(",", ".", datas$TAuxImpNb_RB)
datas$TAuxImpNB_CPM = sub(",", ".", datas$TAuxImpNB_CPM)
datas$CA3TRetMtt = sub(",", ".", datas$CA3TRetMtt)
datas$DiffDAteTr1 = sub(",", ".", datas$DiffDAteTr1) 
datas$DiffDAteTr2 = sub(",", ".", datas$DiffDAteTr2)
datas$DiffDAteTr3 = sub(",", ".", datas$DiffDAteTr3)
datas$CA3TR = sub(",", ".", datas$CA3TR)
datas$VerifiAnceCPT1 = sub(",", ".", datas$VerifiAnceCPT1)
datas$VerifiAnceCPT2 = sub(",", ".", datas$VerifiAnceCPT2)
datas$VerifiAnceCPT3 = sub(",", ".", datas$VerifiAnceCPT3)

#Transformation en numérique
datas$MontAnt = as.numeric(datas$MontAnt)
datas$ScoringFP1 = as.numeric(datas$ScoringFP1)
datas$ScoringFP2 = as.numeric(datas$ScoringFP2)
datas$ScoringFP3 = as.numeric(datas$ScoringFP3)
datas$TAuxImpNb_RB = as.numeric(datas$TAuxImpNb_RB)
datas$TAuxImpNB_CPM = as.numeric(datas$TAuxImpNB_CPM)
datas$CA3TRetMtt = as.numeric(datas$CA3TRetMtt)
datas$DiffDAteTr1 = as.numeric(datas$DiffDAteTr1) 
datas$DiffDAteTr2 = as.numeric(datas$DiffDAteTr2)
datas$DiffDAteTr3 = as.numeric(datas$DiffDAteTr3)
datas$CA3TR = as.numeric(datas$CA3TR)
datas$VerifiAnceCPT1 = as.numeric(datas$VerifiAnceCPT1)
datas$VerifiAnceCPT2 = as.numeric(datas$VerifiAnceCPT2)
datas$VerifiAnceCPT3 = as.numeric(datas$VerifiAnceCPT3)


#Arrondir à deux décimales
datas$MontAnt = round(datas$MontAnt, 2)
datas$ScoringFP1 = round(datas$ScoringFP1, 2)
datas$ScoringFP2 = round(datas$ScoringFP2, 2)
datas$ScoringFP3 = round(datas$ScoringFP3, 2)
datas$TAuxImpNb_RB = round(datas$TAuxImpNb_RB, 2)
datas$TAuxImpNB_CPM = round(datas$TAuxImpNB_CPM, 2)
datas$CA3TRetMtt = round(datas$CA3TRetMtt, 2)
datas$DiffDAteTr1 = round(datas$DiffDAteTr1, 2) 
datas$DiffDAteTr2 = round(datas$DiffDAteTr2, 2)
datas$DiffDAteTr3 = round(datas$DiffDAteTr3, 2)
datas$CA3TR = round(datas$CA3TR, 2)
datas$VerifiAnceCPT1 = round(datas$VerifiAnceCPT1, 2)
datas$VerifiAnceCPT2 = round(datas$VerifiAnceCPT2, 2)
datas$VerifiAnceCPT3 = round(datas$VerifiAnceCPT3, 2)

#Conversion en facteur
datas$CodeDecision = as.factor(datas$CodeDecision)
datas$FlAgImpAye = as.factor(datas$FlAgImpAye)

