# Here is an example of a function that adds the numbers from 1 to n
example_func <- function(n){
  sum(1:n)
}

# Here is the sum of the first 100 numbers
example_func(100)

# Create a function `compute_s_n` with a a parameter `n`
# that for any value of `n` calculates the sum of
# 1 + 2^2 + ...+ n^2
compute_s_n <- function(n){
  sum(1:n^2)
}

# Calculate the value of the sum when n=10
compute_s_n(10)


#quiz 3

library(dslabs)
data(heights)


result <- ifelse(heights$sex == "Female", 1, 2)

# Calculate the sum of the resulting vector
sum(result)


h <- ifelse(heights$height>72,heights$height,0)
mean(h)

inches_to_ft <- function(x){
  x/12
}
inches_to_ft(144)

sum(heights$height <60)



any(TRUE, TRUE, TRUE)
any(TRUE, TRUE, FALSE)
any(TRUE, FALSE, FALSE)
#any(FALSE, FALSE, FALSE)
all(TRUE, TRUE, TRUE)
#all(TRUE, TRUE, FALSE)
#all(TRUE, FALSE, FALSE)
#all(FALSE, FALSE, FALSE)





# define a vector of length m
m <- 10
f_n <- vector(length = m)

# make a vector of factorials
for(n in 1:m){
  f_n[n] <- factorial(n)
}

# inspect f_n
f_n

x <- 25
s <- 5

test <- function(x){
  s <- 1/x
  s
}

test(x)




test <- vector(length = 5)
for (i in 1:5){
  test[i] <- i^2
}
