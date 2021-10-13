# Verify if the package is already installed, if not, install package
if("ggplot2" %in% rownames(installed.packages()) == FALSE) {install.packages("ggplot2")}
if("ggpubr" %in% rownames(installed.packages()) == FALSE) {install.packages("ggpubr")}
if("tidyverse" %in% rownames(installed.packages()) == FALSE) {install.packages("tidyverse")}
if("tidyr" %in% rownames(installed.packages()) == FALSE) {install.packages("tidyr")}
if("gridExtra" %in% rownames(installed.packages()) == FALSE) {install.packages("gridExtra")}
if("gamlss" %in% rownames(installed.packages()) == FALSE) {install.packages("gamlss")}
if("gamlss.add" %in% rownames(installed.packages()) == FALSE) {install.packages("gamlss.add")}
if("gamlss.dist" %in% rownames(installed.packages()) == FALSE) {install.packages("gamlss.dist")}
if("corrplot" %in% rownames(installed.packages()) == FALSE) {install.packages("corrplot")}
if("gamlss.dist" %in% rownames(installed.packages()) == FALSE) {install.packages("gamlss.dist")}
if("Hmisc" %in% rownames(installed.packages()) == FALSE) {install.packages("Hmisc")}

# Loading libraries
library(gamlss)
library(ggpubr)
library(gamlss.add)
library(gamlss.dist)
library(ggplot2)
library(corrplot)
library(cowplot)
library(Hmisc)
library(gridExtra)

set.seed(20)
data(oil)

df = oil[,-2:-15]

attach(df)

# DF dataset cut off the past traded Oil contracts and keep only the lagged variable
idx_DF = sample(dim(df)[1] , 0.70*dim(df)[1] , replace = F)
trainset_DF = df[idx_DF , ]
testset_DF = df[-idx_DF , ]

# OIL dataset keeps all the variables with no changes
idx_OIL = sample(dim(oil)[1] , 0.70*dim(oil)[1] , replace = F)
trainset_OIL = oil[idx_OIL , ]
testset_OIL = oil[-idx_OIL , ]

mod_1 <- gamlss(OILPRICE ~ ., family = BCPE, data = trainset_DF, control = gamlss.control(n.cyc = 20))# Model 1 
# mod_2 <- gamlss(OILPRICE ~ ., family = BCPE, data = trainset_OIL)# model 2

# mod_3 <-
#  gamlss(
#    OILPRICE ~ cs(BDIY_log, df = 2) + cs(SPX_log, df = 2) + cs(DX1_log, df = 2) + cs(GC1_log, df = 2) +
#      cs(USCI_log, df = 2) + cs(GNR_log, df = 2) + cs(SHCOMP_log, df = 2) + cs(FTSE_log, df = 2) + cs(respLAG, df = 2) ,
#    family = BCPE,
#    data = trainset_DF
#  )

# model 4
# mod_4 <-
#  gamlss(
#    OILPRICE ~ cs(CL2_log, df = 2) + cs(CL3_log, df = 2) + cs(CL4_log, df = 2) +
#      cs(CL5_log, df = 2) + cs(CL6_log, df = 2) + cs(CL7_log, df = 2) +
#      cs(CL8_log, df = 2) + cs(CL9_log, df = 2) + cs(CL10_log, df = 2) +
#      cs(CL11_log, df = 2) + cs(CL12_log, df = 2) + cs(CL13_log, df = 2) +
#      cs(CL14_log, df = 2) + cs(CL15_log, df = 2) +
#      cs(BDIY_log, df = 2) + cs(SPX_log, df = 2) + cs(DX1_log, df = 2) + cs(GC1_log, df = 2) +
#      cs(USCI_log, df = 2) + cs(GNR_log, df = 2) + cs(SHCOMP_log, df = 2) + cs(FTSE_log, df = 2) + cs(respLAG, df = 2) ,
#    family = BCPE,
#    data = trainset_OIL
#  )


testset_DF$pred_1 <- predict(mod_1, newdata=testset_DF, type = "response")
# testset_OIL$pred_2 <- predict(mod_2, newdata=testset_OIL, type = "response")
# testset_DF$pred_3 <- predict(mod_3, newdata=testset_DF[,-12], type = "response")
# testset_OIL$pred_4 <- predict(mod_4, newdata=testset_OIL[,-26], type = "response")

testset_DF$pred.deviation_1  <- round(testset_DF$pred_1/testset_DF$OILPRICE,10)
# testset_OIL$pred.deviation_2 <- round(testset_OIL$pred_2/testset_OIL$OILPRICE,10)
# testset_DF$pred.deviation_3  <- round(testset_DF$pred_3/testset_DF$OILPRICE,10)
# testset_OIL$pred.deviation_4 <- round(testset_OIL$pred_4/testset_OIL$OILPRICE,10)





testset_DF$pred.deviation_1  <- testset_DF$pred.deviation_1-1
# testset_OIL$pred.deviation_2 <- testset_OIL$pred.deviation_2-1
# testset_DF$pred.deviation_3  <- testset_DF$pred.deviation_3-1
# testset_OIL$pred.deviation_4 <- testset_OIL$pred.deviation_4-1


test_dev1 <- 100*testset_DF$pred.deviation_1
test_1dev1 <- sum(abs(test_dev1) <= 1)
test_05dev1 <- sum(abs(test_dev1) <= 0.5)
test_size1 <- nrow(testset_DF)

test_in_1dev1 = (test_1dev1 / test_size1)*100
test_in_05dev1 = (test_05dev1 / test_size1)*100

paste0(test_in_1dev1, '% of the predicted values are in a +-1% deviation margin')
paste0(round(test_in_05dev1,2), '% of the predicted values are in a +-0.5% deviation margin')
