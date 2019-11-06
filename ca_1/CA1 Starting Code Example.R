 ##########################################
 #                                        #
###            DAD CA 1 2017             ###
 #                                        #
 ##########################################

# The key to success in any organization is attracting and retaining top talent. 
# You are an HR analyst at my company, and one of my tasks is to determine which factors 
# keep employees at my company and which prompt others to leave. We need to know what 
# factors we can change to prevent the loss of good people. 
 
# You have data about past and current employees in a spreadsheet. It has various data 
# points on our employees, but we're' most interested in whether they’re still with the 
# company or whether they’ve gone to work somewhere else. And we want to understand how 
# this relates to workforce attrition. 

#Attributes:
 # Age: in years
 # Attrition: Y/N the dependent variable -- have they left the company?
 # BusinessTravel: Non-Travel; Traval_Frequently, Travel_Rarely
 # DailyRate: Consultancy Charge per Day
 # Department: Human Resources; Research & Development; Sales
 # DistanceFromHome: How far the employe lives from work
 # Education: 1 'Below College'; 2 'College'; 3 'Bachelor'; 4 'Master'; 5 'Doctor'
 # EducationField: Human Resources; Life Sciences; Marketing; Medical; Other; Technical Degree
 # EmployeeCount: No of employes in this record	
 # EmployeeNumber: Employee ID
 # EnvironmentSatisfaction: 4 point Likert scale: 1 'Low'; 2 'Medium'; 3 'High'; 4 'Very High'	
 # Gender: Male / Female
 # HourlyRate: Consultancy Charge per Hour
 # JobInvolvement: 4 point Likert scale: 1 'Low'; 2 'Medium'; 3 'High'; 4 'Very High'
 # JobLevel	Metadata not available -- make an assumption 
 # JobRole: Healthcare Representative;  Human Resources; Laboratory Technician; Manager; Manufacturing Director; Research Director; Research Scientist; Sales Executive; Sales Representative 
 # JobSatisfaction: 4 point Likert scale: 1 'Low'; 2 'Medium'; 3 'High'; 4 'Very High'
 # MaritalStatus: Divorced; Married; Single
 # MonthlyIncome: monthly salary
 # MonthlyRate: Consultancy Charge per Day
 # NumCompaniesWorked: No. of previous employeers
 # Over18: Y/N
 # OverTime: Yes/No
 # PercentSalaryHike: Last Years Increment	
 # PerformanceRating:  4 point Likert scale: 1 'Low'; 2 'Good'; 3 'Excellent'; 4 'Outstanding'
 # RelationshipSatisfaction:  4 point Likert scale: 1 'Low'; 2 'Medium'; 3 'High'; 4 'Very High'
 # StandardHours: Contract hours	
 # StockOptionLevel: No available metadata -- make an assumption :)	
 # TotalWorkingYears: Career Age
 # TrainingTimesLastYear: No. of training courses attended last year
 # WorkLifeBalance: 4 Point Likert Scale: 1 'Bad'; 2 'Good'; 3 'Better'; 4 'Best'
 # YearsAtCompany: Time spent with company
 # YearsInCurrentRole: Time in current role
 # YearsSinceLastPromotion: No. of years since last promoted
 # YearsWithCurrManager: Year spent with current manager
 
 setwd("/.../DAD/CA1") #change this to where you downloaded the .csv
 hrdata <- read.csv("CA1 Data.csv", stringsAsFactors = T) #will autoencode the text attributes to factors
 
 #ok, now we need to make a dataset unique to you
 set.seed(1337) # <-- put your student number here WITHOUT the x!! Leave off a starting zero if you have one
 #e.g.: set.seed(62345678)
 
 index <- sample(1:nrow(hrdata), 400, replace=FALSE)
 my_ca_dataset <- hrdata[index, ] # here we're subsetting your part of the dataset
 
 #Unfortunately, due to a technical error, 15 columns of the data were lost :(
 #HR blamed IT, IT blamed HR, your manager will blame you, so let's just hope those columns weren't important!
 index2 <- sample(1:(ncol(my_ca_dataset)-3), 15, replace=FALSE)
 index2 <- index2 + 3 #the minus and then plus 3 protects the first 3 columns of the dataset
 
 print(paste("I lost:", names(my_ca_dataset)[index2]))
 
 my_ca_dataset <- my_ca_dataset[, -index2]
 
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
 rm(hrdata)
 rm(index)
 rm(index2)
 rm(i)
 rm(nadex)
 
 ###### Backup your data set
 
 #In case anything goes wrong, we'll store a copy in memory
 my_ca_backup <- my_ca_dataset
 
 write.csv(file="my_ca_dataset.csv", my_ca_dataset, row.names = F)
 # If you mess up uncomment and run to restore the original dataset:
 # my_ca_dataset <- my_ca_backup
 
 #Now please begin, and good luck!
 
 ##########################################
 # Begin Foundations
 str(my_ca_dataset)
 
 
 