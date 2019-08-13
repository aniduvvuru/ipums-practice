# ipums-practice

Written in the terminal from Rstudio.

LESSONS
help(":=") -> new column by reference operator
help(data.table) -> dt[i,j,by] + other methods explained (.SD)
help(unique) -> grabs unique rows on the basis of certain chosen columns
help(lapply) -> "list apply"; apply a function over a list of vectors
help(sapply) -> "simplify and apply"; lapply that simplifies result to vector/matrix if possible
help(mapply) -> sapply used on multiple list or vector arguments
help(rep) -> repeats many items 
help(setdiff) -> order-dependent; return a new set containing only values unique to first set 
help(setequal) -> returns a boolean based on set equivalence 
help(`%>%`)
	x %>% f(y) places x in the leftmost arugment position -> f(x,y)
    	Position can be chosen with dot replacement -> x %>% f(y,.) -> f(y,x)
    	Nested functions include x at each scope -> x %>% g(f(y,.)) -> g(x, f(y,x))
    	Nesting can be overriden with {} enclosure -> x %>% {g(f(y,.))} -> g(f(y,x))
    	Function-producing RHS can be forced to evaluate before piping w/ () enclosure

SHORTCUTS
ctrl + D = delete line
alt + shift + left/right = select rest of line in that direction
ctrl + shift + A  = format all code
ctrl + shift + M = Magrittr's Pipe
