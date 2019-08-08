library(carData)
library(data.table)

rm(list = ls())
math_phds = as.data.table(AMSsurvey)
summary(math_phds)
math_phds = math_phds[,-1]
math_phds
