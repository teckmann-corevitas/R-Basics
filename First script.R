library(tibble)
install.packages("dslabs")
library(dslabs)


coef_a <- 1
coef_b <- 1
coef_c <- -1

coef_a
print(coef_a)

ls()

(-coef_b + sqrt(coef_b^2 - 4*coef_a*coef_c))/(2*coef_a)
#> [1] 0.618
(-coef_b - sqrt(coef_b^2 - 4*coef_a*coef_c))/(2*coef_a)
#> [1] -1.62

log(8)
#> [1] 2.08
log(coef_a)
#> [1] 0

help("log")

?log

args(log)

log(8, base = 2)


log(x = 8, base = 2)

log(8, 2)
log(base = 2, x = 8)


r_1 <- (-coef_b + sqrt(coef_b^2 - 4*coef_a*coef_c))/(2*coef_a)
r_2 <- (-coef_b - sqrt(coef_b^2 - 4*coef_a*coef_c))/(2*coef_a)


coef_a <- 3
coef_b <- 2
coef_c <- -1
(-coef_b + sqrt(coef_b^2 - 4*coef_a*coef_c))/(2*coef_a)
(-coef_b - sqrt(coef_b^2 - 4*coef_a*coef_c))/(2*coef_a)


library(dslabs)
class(murders)

# structures of an object
str(murders)

names(murders)
murders$population

# vectors
pop <- murders$population
length(pop)


# factors, default alphabetical
levels(murders$region)

# reorder vector/factor
region <- murders$region
value <- murders$total
region <- reorder(region, value, FUN = sum)
levels(region)


# lists
record <- list(name = "John Doe",
               student_id = 1234,
               grades = c(95, 82, 91, 97, 93),
               final_grade = "A")
record$student_id
record[["student_id"]]


# matrices
mat <- matrix(1:12, 4, 3)
mat
mat[2, 3]
mat[2, ]
mat[, 3]
mat[, 2:3]
mat[1:2, 2:3]
as.data.frame(mat)


# vectors
codes <- c(380, 124, 818)
codes
country <- c("italy", "canada", "egypt")

codes <- c(italy = 380, canada = 124, egypt = 818)
codes
class(codes)
names(codes)

codes <- c(380, 124, 818)
country <- c("italy","canada","egypt")
names(codes) <- country
codes


# sequences
seq(1, 10)
seq(1, 10, 2)
class(1:10)
class(seq(1, 10, 0.5))


# subsets
codes[2]
codes[c(1,3)]
codes[1:2]
codes["canada"]
codes[c("egypt","italy")]


# NAs
x <- c("1", "b", "3")
as.numeric(x)


# sorting
library(dslabs)
sort(murders$total)

ind <- order(murders$total)
murders$abb[ind]

x <- c(31, 4, 15, 92, 65)
sort(x)
index <- order(x)
print(x)
print(index)
x <- c(31, 4, 15, 92, 65)
rank(x)

i_max <- which.max(murders$total)
murders$state[i_max]

library(dslabs)
murders$state[which.max(murders$population)]

murder_rate <- murders$total / murders$population * 100000
murders$abb[order(murder_rate)]

#indexing with vectors
ind <- murder_rate < 0.71
murders$state[ind]
#total/count
sum(ind)

west <- murders$region == "West"
safe <- murder_rate <= 1

ind <- safe & west
murders$state[ind]

ind <- which(murders$state == "California")
murder_rate[ind]

ind <- match(c("New York", "Florida", "Texas"), murders$state)
ind
murder_rate[ind]


match(c("New York", "Florida", "Texas"), murders$state)
#> [1] 33 10 44
which(murders$state %in% c("New York", "Florida", "Texas"))


# plots
x <- murders$population / 10^6
y <- murders$total
plot(x, y)
with(murders, plot(population, total))

# histogram
x <- with(murders, total / population * 100000)
hist(x)

# boxplot
murders$rate <- with(murders, total / population * 100000)
boxplot(rate~region, data = murders)



















