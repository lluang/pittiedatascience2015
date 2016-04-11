################################################################################
### R code from Applied Predictive Modeling (2013) by Kuhn and Johnson.
### Copyright 2013 Kuhn and Johnson
### Web Page: http://www.appliedpredictivemodeling.com
### Contact: Max Kuhn (mxkuhn@gmail.com) 
###
### Chapter 14 Classification Trees and Rule Based Models
###
### Required packages: AppliedPredictiveModeling, C50, caret, doMC (optional),
###                    gbm, lattice, partykit, pROC, randomForest, reshape2,
###                    rpart, RWeka
###
### Data used: The grant application data. See the file 'CreateGrantData.R'
###
### Notes: 
### 1) This code is provided without warranty.
###
### 2) This code should help the user reproduce the results in the
### text. There will be differences between this code and what is is
### the computing section. For example, the computing sections show
### how the source functions work (e.g. randomForest() or plsr()),
### which were not directly used when creating the book. Also, there may be 
### syntax differences that occur over time as packages evolve. These files 
### will reflect those changes.
###
### 3) In some cases, the calculations in the book were run in 
### parallel. The sub-processes may reset the random number seed.
### Your results may slightly vary.
###
################################################################################

### NOTE: Many of the models here are computationally expensive. If
### this script is run as-is, the memory requirements will accumulate
### until it exceeds 32gb. 

################################################################################
### Section 14.1 Basic Classification Trees

library(caret)
library(pROC)

load("grantData.RData")
set.seed(100)
numpre2008 = length(pre2008)
trainingrows = sort(sample(nrow(training), size=1000, replace=FALSE))

training = training[trainingrows,]
pre2008 = pre2008[trainingrows[trainingrows<=numpre2008]]
ctrl <- trainControl(method = "LGOCV",
                     summaryFunction = twoClassSummary,
                     classProbs = TRUE,
                     index = list(TrainSet = pre2008),
                     savePredictions = TRUE)

 set.seed(476)
 rpartFit <- train(x = training[,fullSet], 
                   y = training$Class,
                   method = "rpart",
                   tuneLength = 30,
                   metric = "ROC",
                   trControl = ctrl)
rpartFit

library(partykit)
plot(as.party(rpartFit$finalModel))

rpart2008 <- merge(rpartFit$pred,  rpartFit$bestTune)
rpartCM <- confusionMatrix(rpartFit, norm = "none")
rpartCM$table
rpartRoc <- roc(response = rpartFit$pred$obs,
                predictor = rpartFit$pred$successful,
                levels = rev(levels(rpartFit$pred$obs)))

set.seed(476)
rpartFactorFit <- train(x = training[,factorPredictors], 
                        y = training$Class,
                        method = "rpart",
                        tuneLength = 30,
                        metric = "ROC",
                        trControl = ctrl)
rpartFactorFit 
plot(as.party(rpartFactorFit$finalModel))

rpartFactor2008 <- merge(rpartFactorFit$pred,  rpartFactorFit$bestTune)
rpartFactorCM <- confusionMatrix(rpartFactorFit, norm = "none")
rpartFactorCM$table

rpartFactorRoc <- roc(response = rpartFactorFit$pred$obs,
                      predictor = rpartFactorFit$pred$successful,
                      levels = rev(levels(rpartFactorFit$pred$obs)))

plot(rpartRoc, type = "s", print.thres = c(.5),
     print.thres.pch = 3,
     print.thres.pattern = "",
     print.thres.cex = 1.2,
     col = "red", legacy.axes = TRUE,
     print.thres.col = "red")
plot(rpartFactorRoc,
     type = "s",
     add = TRUE,
     print.thres = c(.5),
     print.thres.pch = 16, legacy.axes = TRUE,
     print.thres.pattern = "",
     print.thres.cex = 1.2)
legend(.75, .2,
       c("Grouped Categories", "Independent Categories"),
       lwd = c(1, 1),
       col = c("black", "red"),
       pch = c(16, 3))

set.seed(476)
j48FactorFit <- train(x = training[,factorPredictors], 
                      y = training$Class,
                      method = "J48",
                      metric = "ROC",
                      trControl = ctrl)
j48FactorFit

j48Factor2008 <- merge(j48FactorFit$pred,  j48FactorFit$bestTune)
j48FactorCM <- confusionMatrix(j48FactorFit, norm = "none")
j48FactorCM

j48FactorRoc <- roc(response = j48FactorFit$pred$obs,
                    predictor = j48FactorFit$pred$successful,
                    levels = rev(levels(j48FactorFit$pred$obs)))

set.seed(476)
j48Fit <- train(x = training[,fullSet], 
                y = training$Class,
                method = "J48",
                metric = "ROC",
                trControl = ctrl)

j482008 <- merge(j48Fit$pred,  j48Fit$bestTune)
j48CM <- confusionMatrix(j48Fit, norm = "none")
j48CM

j48Roc <- roc(response = j48Fit$pred$obs,
              predictor = j48Fit$pred$successful,
              levels = rev(levels(j48Fit$pred$obs)))


plot(j48FactorRoc, type = "s", print.thres = c(.5), 
     print.thres.pch = 16, print.thres.pattern = "", 
     print.thres.cex = 1.2, legacy.axes = TRUE)
plot(j48Roc, type = "s", print.thres = c(.5), 
     print.thres.pch = 3, print.thres.pattern = "", 
     print.thres.cex = 1.2, legacy.axes = TRUE,
     add = TRUE, col = "red", print.thres.col = "red")
legend(.75, .2,
       c("Grouped Categories", "Independent Categories"),
       lwd = c(1, 1),
       col = c("black", "red"),
       pch = c(16, 3))

#plot(rpartFactorRoc, type = "s", add = TRUE, 
#     col = rgb(.2, .2, .2, .2), legacy.axes = TRUE)

################################################################################
### Section 14.2 Rule-Based Models

set.seed(476)
partFit <- train(x = training[,fullSet], 
                 y = training$Class,
                 method = "PART",
                 metric = "ROC",
                 trControl = ctrl)
partFit

part2008 <- merge(partFit$pred,  partFit$bestTune)
partCM <- confusionMatrix(partFit, norm = "none")
partCM

partRoc <- roc(response = partFit$pred$obs,
               predictor = partFit$pred$successful,
               levels = rev(levels(partFit$pred$obs)))
partRoc

set.seed(476)
partFactorFit <- train(training[,factorPredictors], training$Class,
                       method = "PART",
                       metric = "ROC",
                       trControl = ctrl)
partFactorFit

partFactor2008 <- merge(partFactorFit$pred,  partFactorFit$bestTune)
partFactorCM <- confusionMatrix(partFactorFit, norm = "none")
partFactorCM

partFactorRoc <- roc(response = partFactorFit$pred$obs,
                     predictor = partFactorFit$pred$successful,
                     levels = rev(levels(partFactorFit$pred$obs)))
partFactorRoc

################################################################################
### Section 14.3 Bagged Trees

set.seed(476)
treebagFit <- train(x = training[,fullSet], 
                    y = training$Class,
                    method = "treebag",
                    nbagg = 50,
                    metric = "ROC",
                    trControl = ctrl)
treebagFit

treebag2008 <- merge(treebagFit$pred,  treebagFit$bestTune)
treebagCM <- confusionMatrix(treebagFit, norm = "none")
treebagCM

treebagRoc <- roc(response = treebagFit$pred$obs,
                  predictor = treebagFit$pred$successful,
                  levels = rev(levels(treebagFit$pred$obs)))
set.seed(476)
treebagFactorFit <- train(x = training[,factorPredictors], 
                          y = training$Class,
                          method = "treebag",
                          nbagg = 50,
                          metric = "ROC",
                          trControl = ctrl)
treebagFactorFit

treebagFactor2008 <- merge(treebagFactorFit$pred,  treebagFactorFit$bestTune)
treebagFactorCM <- confusionMatrix(treebagFactorFit, norm = "none")
treebagFactorCM
treebagFactorRoc <- roc(response = treebagFactorFit$pred$obs,
                        predictor = treebagFactorFit$pred$successful,
                        levels = rev(levels(treebagFactorFit$pred$obs)))


plot(rpartRoc, type = "s", col = rgb(.2, .2, .2, .2), legacy.axes = TRUE)
plot(j48FactorRoc, type = "s", add = TRUE, col = rgb(.2, .2, .2, .2), 
     legacy.axes = TRUE)
plot(treebagRoc, type = "s", add = TRUE, print.thres = c(.5), 
     print.thres.pch = 3, legacy.axes = TRUE, print.thres.pattern = "", 
     print.thres.cex = 1.2,
     col = "red", print.thres.col = "red")
plot(treebagFactorRoc, type = "s", add = TRUE, print.thres = c(.5), 
     print.thres.pch = 16, print.thres.pattern = "", legacy.axes = TRUE, 
     print.thres.cex = 1.2)
legend(.75, .2,
       c("Grouped Categories", "Independent Categories"),
       lwd = c(1, 1),
       col = c("black", "red"),
       pch = c(16, 3))



