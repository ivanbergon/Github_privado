


#===============================================================================
# DATASET INFORMATION: https://rdrr.io/cran/gamlss.data/man/oil.html

#===============================================================================
# DATASET DESCRIPTION

# The Oil data: Using model selection to discover what affects the price of oil.
# The data s contains the daily prices of front month WTI (West Texas
# Intermediate) oil price traded by NYMEX (New York Mercantile Exchange).
# The front month WTI oil price is a futures contract with the shortest duration
# that could be purchased in the NYMEX market. The idea is to use other
# financially traded products (e.g., gold price) to discover what might affect
# the daily dynamics of the price of oil.

#===============================================================================
# DATASET FORMAT

# OILPRICE
#the log price of front month WTI oil contract traded by NYMEX - in financial
#terms, this is the CL1. This is the response variable.

# CL_log
#numeric vectors which are the log prices of the 2 to 15 months ahead WTI oil
#contracts traded by NYMEX. For example, for the trading day of 2nd June 2016,
#the CL2 is the WTI oil contract for delivery in August 2016.

# BDIY_log
#the Baltic Dry Index, which is an assessment of the price of moving the major
#raw materials by sea.

# SPX_log
#the S&P 500 index

# DX1_log
#the US Dollar Index

# GC1_log
#The log price of front month gold price contract traded by NYMEX

# HO1_log
#the log price of front month heating oil contract traded by NYMEX

# USCI_log
#the United States Commodity Index

# GNR_log
#the S&P Global Natural Resources Index

# SHCOMP_log
#the Shanghai Stock Exchange Composite Index.

# FTSE_log
#the FTSE 100 Index

# respLAG
#the lag 1 of OILPRICE - lagged version of the response variable.

#===============================================================================
# DATASET SOURCE

# The dataset was downloaded from https://www.quandl.com/.

#===============================================================================
# PACKAGES INSTALLED

# install.packages("ggplot2")
# install.packages("tidyverse")
# install.packages("tidyr")
# install the gamlss package
# install.packages(c("gamlss","gamlss.add","gamlss.dist"))
# install.packages('corrplot')
install.packages('cowplot')

#===============================================================================
# LIBRARIES USED

library(gamlss)
library(gamlss.add)
library(gamlss.dist)
library(ggplot2)
library(corrplot)
library(cowplot)


# extract the oil dataset
data(oil)

#===============================================================================
# EXPLORATORY ANALYSIS

View(oil)
print(paste("Number of records: ", nrow(oil)))
print(paste("Number of features: ", ncol(oil)))
summary(oil)
colnames(oil)

df = oil

p1 <- ggplot(df, aes(SPX_log, OILPRICE)) + geom_point()
p2 <- ggplot(df, aes(DX1_log, OILPRICE)) + geom_point()
p3 <- ggplot(df, aes(BDIY_log, OILPRICE)) +  geom_point()
p4 <- ggplot(df, aes(GC1_log, OILPRICE)) +  geom_point()
p5 <- ggplot(df, aes(HO1_log, OILPRICE)) +  geom_point()
p6 <- ggplot(df, aes(FTSE_log, OILPRICE)) +  geom_point()
p7 <- ggplot(df, aes(USCI_log, OILPRICE)) +  geom_point()
p8 <- ggplot(df, aes(GNR_log, OILPRICE)) +  geom_point()
p9 <- ggplot(df, aes(SHCOMP_log, OILPRICE)) +  geom_point()

plot_grid(p1,
          p2,
          p3,
          p4,
          p5,
          p6,
          p7,
          p8,
          p9,
          labels = c('A', 'B', 'D', 'E', 'F', 'G', 'H', 'I', 'J'))
























