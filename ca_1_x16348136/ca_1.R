##########################################
#                                        #
#            DAD CA1 (30%) 2019          #
#                                        #
##########################################


# Assume that you work in a financial institution. Banks like other institutions are increasingly turning to data analytics and machine learning to more accurately identify risky loans.

# This dataset contains information on default payments, demographic factors, credit data, history of payment, and bill statements of credit card clients in Taiwan from April 2005 to September 2005.
# What we are most interested in whether the different attributes relates to credit default. 


# Attributes:

#Attribute information:
  
  #Input variables:
  # bank client data:
  # 1 - age (numeric)
  # 2 - job : type of job (categorical: "admin.","blue-collar","entrepreneur","housemaid","management","retired","self-employed","services","student","technician","unemployed","unknown")
  # 3 - marital : marital status (categorical: 1 - "divorced", 2 - "married", 3 - "single", 0 - "unknown"; note: "divorced" means divorced or widowed)
  # 4 - education (categorical: "basic.4y","basic.6y","basic.9y","high.school","illiterate","professional.course","university.degree","unknown")
  # 5 - default: has credit in default? (categorical: 1 - "no", 2 - "yes", 0 - "unknown")
  # 6 - housing: has housing loan? (categorical: 1 - "no", 2 - "yes", 0 - "unknown")
  # 7 - loan: has personal loan? (categorical: 1 - "no", 2 - "yes", 0 - "unknown")
  # related with the last contact of the current campaign:
  # 8 - contact: contact communication type (categorical: "cellular","telephone") 
  # 9 - month: last contact month of year (categorical: "jan", "feb", "mar", ..., "nov", "dec")
#10 - day_of_week: last contact day of the week (categorical: "mon","tue","wed","thu","fri")
#11 - duration: last contact duration, in seconds (numeric). Important note:  this attribute highly affects the output target (e.g., if duration=0 then y="no"). Yet, the duration is not known before a call is performed. Also, after the end of the call y is obviously known. Thus, this input should only be included for benchmark purposes and should be discarded if the intention is to have a realistic predictive model.

# other attributes:
#12 - campaign: number of contacts performed during this campaign and for this client (numeric, includes last contact)
#13 - pdays: number of days that passed by after the client was last contacted from a previous campaign (numeric; 999 means client was not previously contacted)
#14 - previous: number of contacts performed before this campaign and for this client (numeric)
#15 - poutcome: outcome of the previous marketing campaign (categorical: "failure","nonexistent","success")

# social and economic context attributes
#16 - emp.var.rate: employment variation rate - quarterly indicator (numeric)
#17 - cons.price.idx: consumer price index - monthly indicator (numeric)     
#18 - cons.conf.idx: consumer confidence index - monthly indicator (numeric)     
#19 - euribor3m: euribor 3 month rate - daily indicator (numeric)
#20 - nr.employed: number of employees - quarterly indicator (numeric)

#Output variable (desired target):
#21 - deposit - has the client subscribed a term deposit? (binary: "yes","no")

#Missing Attribute Values: There are several missing values in some categorical attributes, all coded with the "unknown" label. These missing values can be treated as a possible class label or using deletion or imputation techniques.




setwd("/Users/hartigan/college/dad/Data-Application-Development-Labs/ca_1_x16348136") #change this to where you downloaded the .csv
creditData <- read.csv("ca1_data.csv") # will autoencode the text attributes to factors

# ok, now we need to make a dataset unique to you
set.seed(16348136) # <-- put your student number here WITHOUT the x!! Leave off a starting zero if you have one
# e.g.: set.seed(62345678)

index <- sample(1:nrow(creditData), 6000, replace=FALSE)
my_ca_dataset <- creditData[index, ] # here we're subsetting your part of the dataset


# Unfortunately, due to a technical error, 7 columns of the data were lost :(
# HR blamed IT, IT blamed HR, your manager will blame you, so let's just hope those columns weren't important!
#index2 <- sample(1:(ncol(my_ca_dataset)-4), 7, replace=FALSE)
#index2 <- index2 + 4 # the minus and then plus 3 protects the first 3 columns of the dataset

#print(paste("I lost:", names(my_ca_dataset)[index2]))

#my_ca_dataset <- my_ca_dataset[, -index2]


# Unfortunately, there was another incident. The intern split their coffee
# on your keyboard and may have deleted data from a number of the remaining columns

v <- round(runif(ncol(my_ca_dataset), min=1, max=6))
v <- cut(v, breaks = c(0,4,max(v)), labels = c("a","b"))
v[2] <- "a"

Pna <- runif(1000, min=0, max=0.18)
Pna <- Pna - .03
Pna[Pna < 0] <- 0

for (i in 1:length(v)) {
  if (v[i] == "b") {
    nadex <- sample(1:nrow(my_ca_dataset), nrow(my_ca_dataset) * Pna[sample(1:length(Pna), 1, replace=FALSE)], replace=FALSE)
    my_ca_dataset[nadex, i] <- NA
    v[i] <- "a"
  }
}


# Clean up
rm(v)
rm(Pna)
rm(creditData)
rm(index)
rm(index2)
rm(i)
rm(nadex)


###### Backup your data set

#In case anything goes wrong, we'll store a copy to disk.
write.csv(my_ca_dataset, file="my_ca_dataset.csv", row.names = F, na = " ")

#To reload it run (you will need to rerun your foundations code again)
#my_ca_dataset <- read.csv("my_ca_dataset.csv", stringsAsFactors = T, na.strings = " ")


#Now please begin, and good luck!



##########################################
# Begin Foundations
str(my_ca_dataset)


# F1 #####################################
my_ca_dataset$marital = factor(my_ca_dataset$marital, levels = c(1:3), labels=c("Divorced", "Married", "Single"))
my_ca_dataset$default = factor(my_ca_dataset$default, levels = c(1:2), labels=c("No", "Yes"))
my_ca_dataset$housing = factor(my_ca_dataset$housing, levels = c(1:2), labels=c("No", "Yes"))
my_ca_dataset$loan = factor(my_ca_dataset$loan, levels = c(1:2), labels=c("No", "Yes"))
my_ca_dataset$duration = as.numeric(my_ca_dataset$duration)
my_ca_dataset$euribor3m = as.numeric(my_ca_dataset$euribor3m)


# F2 #####################################
sapply(my_ca_dataset, function(x) sum(is.na(x)))



# F3 #####################################
Mode = function(x){
  ta = table(x)
  tam = max(ta)
  if (all(ta == tam))
    mod = NA
  else
    if(is.numeric(x))
      mod = as.numeric(names(ta)[ta == tam])
  else
    mod = names(ta)[ta == tam]
  return(mod)
}

my_ca_dataset$marital[is.na(my_ca_dataset$marital)] = Mode(my_ca_dataset$marital)
my_ca_dataset$default[is.na(my_ca_dataset$default)] = Mode(my_ca_dataset$default)
my_ca_dataset$housing[is.na(my_ca_dataset$housing)] = Mode(my_ca_dataset$housing)
my_ca_dataset$loan[is.na(my_ca_dataset$loan)] = Mode(my_ca_dataset$loan)
my_ca_dataset$campaign[is.na(my_ca_dataset$campaign)] = mean(my_ca_dataset$campaign, na.rm=T)
my_ca_dataset$euribor3m[is.na(my_ca_dataset$euribor3m)] = mean(my_ca_dataset$euribor3m, na.rm=T)
sapply(my_ca_dataset, function(x) sum(is.na(x)))




# F4 #####################################
searchForAgeOutliers = boxplot.stats(my_ca_dataset$age)$out
searchForAgeOutliers
boxplot(my_ca_dataset$age)
# End Foundations
##########################################




# A1/A #####################################

coplot( ~ job | deposit, data = my_ca_dataset, panel=panel.smooth, rows=1)

# A1/B #####################################
library(ggplot2)
library(ggthemes)
ggplot(my_ca_dataset, aes(x = duration, fill=deposit)) + 
  geom_bar(stat='count', position='dodge') +
  labs(x = 'Duration') +
  facet_grid(.~marital) + 
  theme_few()


# A2#####################################

library(randomForest)
depositInfluence = randomForest(deposit ~., data = my_ca_dataset)
varImpPlot(depositInfluence)



# A3#####################################

summary(my_ca_dataset$age)
my_ca_dataset$newAge = cut(my_ca_dataset$age, breaks = c(18, 35, 60, 92), labels=c("Young", "Middle-Aged", "OOP"))
plot(my_ca_dataset$newAge, my_ca_dataset$duration)


# Make a backup
# to store a copy of the data.frame to disk:
save(my_ca_dataset, file="my_ca_dataset.RData")

# if at any point, you need to restore your dataset run:
# load("my_ca_dataset.RData")


