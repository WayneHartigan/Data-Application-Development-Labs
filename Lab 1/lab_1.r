help.start()
?rnorm
x <- rnorm(50)
y <- rnorm(x)
#Setting variables

plot(x, y)
#plotting data

boxplot(x)
hist(x)
#Boxplot = boxplot
#hist = histogram

x <- NULL
rm(y)
print(X)
#removing or setting data as NULL

x <- c(10.4, 5.6, 3.1, 6.4, 21.7)
#creating arrays (lists / vector)

1/x
#variables nad lists can be divided to divide each item in list

y<- 1/x
#variables can be set as division of other vairables

temp <- x > 13
print(temp)
#Using operators such as > < <= etc can be used to return true or false

values <- x[x > 3 & x < 7]
print(values)
#expansion on operators

m <- mean(x)
g <- x[x > m]
print(g)
#X greater than mean, listing (not returning boolean)

s <- sd(x)
gr <- x[x < (m - s) | x > (m + s)]
print(gr)
#X more than 1 Standard Deviation

c("Hello", "World")
#Creating vectors using strings

paste(c("X", "Y"), 1:10, sep="")
#Paste fuction, concatenates list

z <- c(1:3, NA)
is.na(z)
#Returns boolean of if list values are NA

#z == NA
#Sets values to NA dont use

0/0
#retruns NaN (Not a Number) also known as NA

Inf - Inf
#Also returns NaN

x <- c(-5:-1, NA, NA, 1:3)
print (x)
is.nan(x)
y <- x[!is.na(x)]
print(y)
#prints all values that are not NA

y <- x[(!is.na(x)) & x > 0]
print(y)
#more parameters for printing

y <- x[1:5]
print (y)
#prints first 5 values in list

y <- x[-(1:5)]
print (y)
#prints everything except first 5 values

money <- c(10, 100000, -10, NA, 15)
strangeAnswers <- money[(is.na(x)) & money<0]
normalPeople <- money[(!is.na(x)) & money>=0 & money < 200]
toffs <- money[money > 10000]

fruit <- c(5, 10, 1, 20)
names(fruit) <- c("orange", "banana", "apple", "peach")
lunch <- fruit[c("apple", "orange")]
print(lunch)

prices <- c(10, 15, 25)
names(prices) <- c("chipper", "chinese", "Pizza")
dinner <- prices[c("chinese")]
print(dinner)

x[is.na(x)] <- 0
#replaces all na with 0

x[is.na(x)] <- mean(x, na.rm=TRUE)
print(x)
