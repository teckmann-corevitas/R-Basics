
library(dslabs)
murder_rate <- murders$total / murders$population*100000

# if else statement

a <- 0

if (a != 0) {
  print(1/a)
} else{
  print("No reciprocal for 0.")
}
#> [1] "No reciprocal for 0."



ind <- which.min(murder_rate)

if (murder_rate[ind] < 0.5) {
  print(murders$state[ind])
} else{
  print("No state has murder rate that low")
}
#> [1] "Vermont"

if (murder_rate[ind] < 0.25) {
  print(murders$state[ind])
} else{
  print("No state has a murder rate that low.")
}
#> [1] "No state has a murder rate that low."


a <- 0
ifelse(a > 0, 1/a, NA)
#> [1] NA


a <- c(0, 1, 2, -4, 5)
result <- ifelse(a > 0, 1/a, NA)


no_nas <- ifelse(is.na(na_example), 0, na_example)
sum(is.na(no_nas))
#> [1] 0


# any and all
z <- c(TRUE, TRUE, FALSE)
any(z)
#> [1] TRUE
all(z)
#> [1] FALSE


# compute mean
avg <- function(x){
  s <- sum(x)
  n <- length(x)
  s/n
}

# mean
x <- 1:100
identical(mean(x), avg(x))
#> [1] TRUE


s <- 3
avg(1:10)
#> [1] 5.5
s
#> [1] 3

# general form of function
my_function <- function(VARIABLE_NAME){
  perform operations on VARIABLE_NAME and calculate VALUE
  VALUE
}

avg <- function(x, arithmetic = TRUE){
  n <- length(x)
  ifelse(arithmetic, sum(x)/n, prod(x)^(1/n))
}


search()
# specify packages with colon
#stats::filter
#dplyr::filter

compute_s_n <- function(n) {
  sum(1:n)
}

# for loops
for (i in 1:5) {
  print(i)
}
#> [1] 1
#> [1] 2
#> [1] 3
#> [1] 4
#> [1] 5

m <- 25
s_n <- vector(length = m) # create an empty vector
for (n in 1:m) {
  s_n[n] <- compute_s_n(n)
}

n <- 1:m
plot(n, s_n)


# vectors
x <- 1:10
sqrt(x)
#>  [1] 1.00 1.41 1.73 2.00 2.24 2.45 2.65 2.83 3.00 3.16
y <- 1:10
x*y
#>  [1]   1   4   9  16  25  36  49  64  81 100

n <- 1:25
compute_s_n(n)

x <- 1:10
sapply(x, sqrt)
#>  [1] 1.00 1.41 1.73 2.00 2.24 2.45 2.65 2.83 3.00 3.16

n <- 1:25
s_n <- sapply(n, compute_s_n)












