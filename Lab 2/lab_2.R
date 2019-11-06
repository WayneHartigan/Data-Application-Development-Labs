x <- c(1:3, 7, 8:10)
attributes(x)
class(x)

z <- 0:9
class(z)

digits = as.character(z)
class(digits)

d = as.integer(digits)
class(d)

name = c("Amy", "Bill", "Carl")
DAD = c(80, 65, 50)
BDA = c(70, 50, 80)

gender = as.factor(c("F", "M", "M"))
nationality = as.factor(c("IRL", "UK", "IRL"))
age = c(20, 21, 22)

student.df = data.frame(name, age, gender, nationality, DAD, BDA)
attributes(student.df)

print(student.df)
str(student.df)
summary(student.df)

student.df['gender']
student.df$gender
student.df$gender[2]

mean(student.df$BDA)

student.df$average = (student.df$BDA + student.df$DAD)/2
student.df
str(student.df)

student.df$name = as.character(student.df$name)
student.df = rbind(student.df, c("Dennis", 23, "M", "UK", 55, 70))

student.df$nationality = as.character(student.df$nationality)

student.df = rbind(student.df, c("Jack", 24, "F", "FRA", 44, 65))
student.df = rbind(student.df, c("Jackson", 26, "M", "DUB", 14, 64))
student.df = rbind(student.df, c("Sandra", 24, "F", "MAD", 44, 65))
student.df = rbind(student.df, c("Goose", 24, "M", "ENG", 44, 65))
student.df = rbind(student.df, c("Michael", 150, "F", "COG", 34, 55))

student.df$nationality = as.factor(student.df$nationality)

levels(student.df$nationality)
student.df$DAD = as.numeric(student.df$DAD)
student.df$BDA = as.numeric(student.df$BDA)

?tapply
averages <- tapply(student.df$BDA, student.df$gender, mean)
averages

table(student.df$nationality)

barplot(table(student.df$nationality), xlab="Nationality", ylab="Count")

mins = c(min(student.df$BDA), min(student.df$DAD))
means = c(mean(student.df$BDA), mean(student.df$DAD))
maxs = c(max(student.df$BDA), max(student.df$DAD))
sds = c(sd(student.df$BDA), sd(student.df$DAD))

results = data.frame(mins, means, maxs, sds)
results

##############################################

data(mtcars)
str(mtcars)
summary(mtcars)
?mtcars
mtcars$cyl = as.factor(mtcars$cyl)
mtcars$am = factor(mtcars$am, labels=c("Automatic", "Manual"), levels=c(0,1))
str(mtcars)
summary(mtcars)

hist(mtcars$mpg, breaks=10)
boxplot(mtcars$hp)
barplot(table(mtcars$cyl))
coplot(mpg ~ hp | cyl, data = mtcars, panel = panel.smooth, rows = 1)

##############################################
#Excercises

table(mtcars$am)
maxWeight = max(mtcars$wt)
maxWeight
(mtcars[mtcars$wt>=maxWeight, ])

minQsec = min(mtcars$qsec)
(mtcars[mtcars$qsec==minQsec, ])

(meanMPG = tapply(mtcars$mpg, mtcars$am, mean))

meanHp = mean(mtcars$hp)
aboveMeanHP = mtcars[mtcars$hp > meanHp, ]
dim(aboveMeanHP)

moreThanSix = aboveMeanHP[aboveMeanHP$cyl == 6, ]
dim(moreThanSix)

automatics = moreThanSix[moreThanSix$am == 'Automatic', ]
dim(automatics)
boxplot(mpg ~ cyl, data=mtcars)

mysample = mtcars[sample(1:nrow(mtcars), nrow(mtcars)/2, replace=FALSE), ]
automatic = mtcars[mtcars$am == "Automatic",]
manual = mtcars[mtcars$am != "Automatic",]

plot(automatic$hp, automatic$mpgm, main = "MPG vs. HP for Automatics")
plot(manual$hp, manual$mpgm, main = "MPG vs. HP for Manuals")

lmAutomatic = lm(mpg ~ hp, automatic)
plot(automatic$hp, automatic$mpg, main="MPG vs. HP for Automatics")
abline(lmAutomatic)

lmManual = lm(mpg ~ hp, manual)
plot(manual$hp, manual$mpg, main="MPG vs. HP for Manuals")
abline(lmManual)