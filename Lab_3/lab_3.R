install.packages(c("ggplot2", "ggthemes", "scales", "dplyr", "mice", "randomForest"))
setwd("/Users/hartigan/college/dad/Data-Application-Development-Labs/Lab_3")

titanicData = read.csv("titanic.csv", header=T, na.strings=c(""), stringsAsFactors = T)
titanicData

titanicData$Survived = as.factor(titanicData$Survived)
titanicData$Pclass = as.factor(titanicData$Pclass)
anyNA(titanicData, recursive = TRUE)
sapply(titanicData, function(x) sum(is.na(x)))

install.packages("Amelia")
library(Amelia)

missmap(titanicData, main = "Missing Values vs. Observed")
#titanicData = titanicData[!is.na(titanicData$Embarked),]
paste("PassengerId: ", titanicData[is.na(titanicData$Embarked), 1], "This needs to be fixed")
library(dplyr)

embarked = titanicData %>%
  filter(PassengerId != 62 & PassengerId != 830)

embarkedNAs = titanicData %>%
  filter(PassengerId == 62 | PassengerId == 830)
print(embarkedNAs[, c(3, 10, 4)])

library(ggplot2)
library(ggthemes)
library(scales)

ggplot(embarked, aes(x=Embarked, y=Fare, fill=factor(Pclass))) + 
  geom_boxplot() +
  geom_hline(aes(yintercept=80), 
             colour='red', linetype='dashed', lwd=2) +
  scale_y_continuous(labels=dollar_format()) +
  theme_few()

titanicData$Embarked[c(62, 830)] = 'C'
sum(is.na(titanicData$Embarked))


ImputerAgeMean = titanicData$Age
ImputerAgeMean[is.na(ImputerAgeMean)] = mean(ImputerAgeMean, na.rm = TRUE)

par(mfrow=c(1,2))
hist(titanicData$Age)
hist(ImputerAgeMean)

idx_na = is.na(titanicData$Age)
age_train = titanicData[-idx_na, ]
age_test = titanicData[idx_na, ]
ageMode = lm(Age~Pclass + Survived + SibSp, data = age_train)
age_test$Age = predict(ageMode, newdata = age_test)
ImputedAgeLM = titanicData
ImputedAgeLM[ImputedAgeLM$PassengerId %in% age_test$PassengerId, "Age"] = age_test$Age

ImputerAgeMean[is.na(ImputerAgeMean)] = mean(ImputerAgeMean, na.rm = T)

par(mfrow=c(2,2))
hist(titanicData$Age, freq=F, main="Age: Original", col='red', ylim=c(0,0.4))
hist(ImputerAgeMean, freq=F, main="Age: Imputed Age Mean", col='blue', ylim=c(0,0.4))
hist(ImputedAgeLM$Age, freq=F, main="Age: Impputed Age LM", col='green', ylim=c(0,0.4))

library(mice)
mice_mod = mice(titanicData[, !names(titanicData) %in%
                              c('PassengerId', "Name", "Cabin", "Survived")], method = 'rf')
mice_output = complete(mice_mod)  

par(mfrow=c(2,2))
hist(titanicData$Age, freq=F, main='Age: Original', col='red', ylim=c(0,0.04))
hist(ImputedAgeMean, freq=F, main='Age: Imputed Age Mean', col='blue', ylim=c(0,0.04))
hist(ImputedAgeLM$Age, freq=F, main='Age: Imputed Age LM', col='green', ylim=c(0,0.04))
hist(mice_output$Age, freq=F, main='Age: MICE Output', col='orange', ylim=c(0,0.04))

titanicData = titanicData[, -11]
