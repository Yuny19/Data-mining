library(readr)
ujiku <- read_delim("sayuktab.csv", ";", escape_double = FALSE, 
                    trim_ws = TRUE)
View(ujiku)
library(arules)
library(arulesViz)
qq=as.matrix(ujiku)
qq=as(qq,"transactions")
rules=apriori(qq,parameter = list(supp=0.03,conf=0.4,minlen=2))
rules.sort=sort(rules,by="conf")
inspect(rules.sort)




