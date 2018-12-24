library(readr)
wine <- read_delim("~/wine.csv", ";", escape_double = FALSE, 
                   col_types = cols(alcalinity_ash = col_number(), 
                                    alcohol = col_number(), ash = col_number(), 
                                    color_intensity = col_number(), diluted_wines = col_number(), 
                                    flavanoids = col_number(), hue = col_number(), 
                                    magnesium = col_number(), malic_acid = col_number(), 
                                    nonflavanoid_phenols = col_number(), 
                                    proanthocyanins = col_number(), proline = col_number(), 
                                    total_phenols = col_number(), type = col_number()), 
                   trim_ws = TRUE)
View(wine)
library(party)
ind<-sample(2,nrow(wine),replace = TRUE,prob = c(0.7,0.30))
train<-wine[ind==1,]
test<-wine[ind==2,]
df<-type ~ alcohol+ash+alcalinity_ash+flavanoids+proline
wine_ctree <- ctree(df,data=train)
table(predict(wine_ctree),train$type)
plot(wine_ctree)
testpredik<-predict(wine_ctree,newdata=test)
table(testpredik,test$type)
