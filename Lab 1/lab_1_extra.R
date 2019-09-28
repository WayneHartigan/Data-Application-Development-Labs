getwd()

setwd("C:/Users/harti/OneDrive/College/Year 4/Data Application Development/Lab Week 1")

a = 5
b <- 6
7 -> c
#setting variables

a = b + c
print(typeof(b))
class(a)
print(a)

a = "student"
typeof(a)
class(a)
is.character(a)
is.numeric(a)

d = 4 + 5 * 3^2

e = as.character(d)
typeof(a)
class(a)

?rep
??rep

myVec = c(rep(x = a, times = 10))
paste(myVec, 1:10, sep="")

typeof(myVec)
class(myVec)

#matrcies
myMatrix = cbind(
  paste(myVec, 1:10, sep = ""),
  paste(myVec, 11:20, sep = ""),
  paste(myVec, 21:30, sep = "")
)
print(myMatrix)
myMatrix[1,]
myMatrix[,2]
myMatrix[3,2]

myMatrix[3,2] = 6
typeof(myMatrix[3,2])
myMatrix[3,1] = TRUE
typeof(myMatrix[3,1])
print(myMatrix)

#Data Frames
?data.frame
?colnames
myDF = as.data.frame(myMatrix)
myDF$V1
colnames(myDF) = c("group1", "group2", "group3", "grades")

myDF = cbind(myDF, grades = c(60:69))
length = (c(60:71))
myList = as.list(myDF)
myList = list(students = myDF, college = c("NCI", "DCU"))
myList$students$grades
myList[[1]][,4]

#Conditional repetition statements

number = 3
if (number %% 2 == 0){
  print(paste("The number", number, "is even", sep=" "))
} else{
  print(paste("the number", number, "is odd", sep=" "))
}
for (n in 1:5){
  n #does not print
  print(n) #does print
}
