# Loading Libraries
install.packages(arules)
install.packages(arulesViz)
install.packages(RColorBrewer)

library(arules)
library(arulesViz)
library(RColorBrewer)


data = list(c('A','B','C','D'),c('A','C','D','E','F'),c('A','D','E','M','N'),c('E','F','M','N'),c('A','C','D'),c('A','B','C','D'),c('P','Q','R'),c('A','B','C'),c('A','B','C','P','Q','R'))
x = as(data,'transactions')
itemFrequencyPlot(x,type='absolute')

?apriori
ar = apriori(x,parameter = c(supp=0.3,conf=0.8))
inspect(ar)

# import dataset
data("Groceries")
a=data("Groceries")
summary(a)

itemFrequencyPlot(Groceries,type='absolute',topN=10)
ar = apriori(Groceries,parameter = c(supp=0.001,conf=0.5))
inspect(ar)