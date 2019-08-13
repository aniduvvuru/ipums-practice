# Lessons
# help(":=") -> new column by reference operator
# help(data.table) -> dt[i,j,by] + other methods explained (.SD and lapply)
# help(unique) -> grabs unique rows on the basis of certain chosen columns
# help(lapply) -> "list apply"; apply a function over a list of vectors
# help(sapply) -> "simplify and apply"; lapply that converts to vector/matrix if possible
#   and a mulit-dim array at request
# help(mapply) -> sapply used on multiple list or vector arguments
# help(rep) -> repeats many items
# help(setdiff) -> order-dependent; return a new set containing only values unique to first set
# help(setequal) -> returns a boolean based on set equivalence

library(data.table)
library(dplyr)

# Summarize unique gears available to each cylinder type
dt = data.table(mtcars)[,.(gear, cyl)]
dt[,gearsL := .(list(unique(gear))), by=cyl]
head(dt)

# Grab list item from column of list values
dt[,gearL1:=lapply(gearsL, `[`, 2)]
dt[,gearS1:=sapply(gearsL, `[`, 2)]
head(dt)
str(head(dt[,gearL1]))
str(head(dt[,gearS1])) # Note: sapply -> vector vs lapply -> list

dt[,other_gear:=mapply(setdiff, gearsL, gear)]
head(dt)

# Suppressing intermediate output

