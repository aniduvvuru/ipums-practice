library(carData)
library(data.table)
library(dplyr)

rm(list = ls())
math_phds = as.data.table(AMSsurvey)
math_phds

# PhD mean counts by sex-citizen combinations
## Hybrid method - data.table + dplyr
math_phds %>%
  .[, sex_citizen := paste0(sex,"_",citizen)] %>%
  .[, .(count = mean(count, na.rm=TRUE),
        count11 = mean(count11, na.rm=TRUE)), by = sex_citizen] %>%
  as_tibble()

## Pure method - data.table only
math_phds[, sex_citizen:=paste0(sex,"_",citizen)
          ][,.(count = mean(count, na.rm=TRUE),
               count11 = mean(count11, na.rm=TRUE)), by = sex_citizen]

# PhD totals by gender
## Hybrid method - data.table + dplyr
math_phds %>%
  .[,.(count = sum(count),
       count11 = sum(count11)), by=sex] %>%
  as_tibble()

## Pure method - data.table only
math_phds[,.(count = sum(count),
             count11 = sum(count11)), by=sex]

# Year to year growth by type of student
## Hybrid method - data.table + dplyr
math_phds %>%
  .[, student := paste0("Year_",type)] %>%
  .[,.(count = sum(count),
       count11 = sum(count11)),  by = student] %>%
  as_tibble()

## Pure method - data.table only
math_phds[, student := paste0("Year_",type)
          ][,.(count = sum(count),
               count11 = sum(count11)), by=student]