library(mice)
library(dplyr)



#load data
train_data <- read.table("rawdata.txt",row.names = NULL, check.names = F, header = T, stringsAsFactors = F)

#imput data
ex_imputedData <- mice(ex_total_df, m=1,maxit=20, method=method,seed=500) #method:norm;logreg;polyreg
ex_completeData<- complete(ex_imputedData)

sapply(ex_completeData, function(x) sum(is.na(x)))# check whether all na are filled
write.csv(ex_completeData, "data-imput.txt",row.names = T, quote = F,sep = "\t") )