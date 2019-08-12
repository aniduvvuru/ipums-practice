library(carData)
library(data.table)

rm(list = ls())
math_phds = as.data.table(AMSsurvey)
summary(math_phds)
math_phds = math_phds[,-1]

# PHD totals by gender

Y2018 = math_phds[,.(count.sum=sum(count)), by=sex]
Y2019 = math_phds[,.(count11.sum=sum(count11)), by=sex]
math_by_sex = merge(Y2018, Y2019)
math_by_sex

# Y2y PHD growth by gender

gen_lm = lm(count11 ~ count, data=math_phds)
male_math = math_phds[sex=="Male"]
male_lm =lm(count11 ~ count, data=male_math)
fem_math = math_phds[sex=="Female"]
fem_lm =lm(count11 ~ count, data=fem_math)

gen_lm
male_lm
fem_lm