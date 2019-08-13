library(tidyverse)
library(data.table)
rm(list = ls())

# Summarize unique gears available to each cylinder type
dt = data.table(mtcars)[, .(gear, cyl)]
dt[, gearsL := .(list(unique(gear))), by = cyl]
head(dt)

# Grab list item from column of list values
dt[, gearL1 := lapply(gearsL, `[`, 2)]
dt[, gearS1 := sapply(gearsL, `[`, 2)]
head(dt)
str(head(dt[, gearL1]))
str(head(dt[, gearS1])) # Note: sapply -> vector vs lapply -> list

dt[, other_gear := mapply(setdiff, gearsL, gear)]
head(dt)

# Suppressing intermediate output
dt = data.table(mtcars)
dt[, {
  tmp1 = mean(mpg)
  tmp2 = mean(abs(mpg - tmp1))
  tmp3 = round(tmp2, 2)
}, by = cyl]
dt[, {
  tmp1 = mean(mpg)
  tmp2 = mean(abs(mpg - tmp1))
  tmp3 = round(tmp2, 2)
  list(tmp2 = tmp2, tmp3 = tmp3)
}, by = cyl]

# Faster looping  with set
## Applying function to specific columns
dt2 = dt[, 1:5]
for (j in c(1L, 2L, 3L))
  set(dt2, j = j, value = -dt2[[j]])
for (j in c(1L, 2L, 3L))
  set(dt2, j = j, value = paste0(-dt2[[j]], '!!'))
dt
dt2

# Shift to lead/lag vectors and lists
dt = data.table(mtcars)[, .(mpg, cyl)]
dt[, mpg_lag1 := shift(mpg, 1)]
dt[, mpg_forward1 := shift(mpg, 1, type = 'lead')]
head(dt)

