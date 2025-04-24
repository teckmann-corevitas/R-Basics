

# 1. What will this conditional expression return?
x <- c(1,2,-3,4)

if(all(x>0)){
  print("All Postives")
} else{
  print("Not all positives")
}
#not all positives

# 2. Which of the following expressions is always FALSE when at least one entry of a logical vector x is TRUE?

###all(x)
#any(x)
#any(!x)
#all(!x)


# 3. The function nchar tells you how many characters long a character vector is.
#Write a line of code that assigns to the object new_names the state abbreviation when the state name is longer than 8 characters.
new_names <- state.abb[nchar(state.name) > 8]
print(new_names)


# 4. Create a function sum_n that for any given value, say, computes the sum of the integers from 1 to n (inclusive).
#Use the function to determine the sum of integers from 1 to 5,000.
sum_n <- function(n) {
  sum(1:n)
}

sum_n(5000)
sum_n(10)


# 5. Create a function altman_plot that takes two arguments, x and y, and plots the difference against the sum.
altman_plot <- function(x,y) {
  sum <- x + y
  diff <- x - y

  #plot
  plot(sum,diff)
}
x <- c(seq(11,20,2))
y <- c(1:5)
altman_plot(x,y)

# 6. After running the code below, what is the value of x?
x <- 3
my_func <- function(y){
  x <- 5
  y+5
}
#3

#7. Write a function compute_s_n that for any given 'n' computes the sum Sn= 1^2 + 2^2 + 3^2 +n^2
# Report the value of the sum when n=10

compute_s_n <- function(n) {
  sum((1:n)^2)
}
compute_s_n(10)


# 8. Define an empty numerical vector s_n of size 25 using s_n <- vector("numeric", 25) and store in the results of S1,S2,S3...S25 using a for-loop.
s_n <- vector("numeric", 25) # create an empty vector
for (i in 1:25) {
  s_n[i] <- i
}

# 9. Repeat exercise 8, but this time use sapply.
s_n <- function(i){
  return(i)
}
x <- 1:25
sapply(x, s_n)

# 10. Plot sN VS N Use points defined by n=1:25
n <-  1:25

s_n <- function(i){
  return(i)
}
sapply(x, s_n)

plot(n,s_n) #not working NEED TO FIGURE OUT


# 11. Confirm that the formula for this sum is Sn= n(n+1)(2n+1)/6
formula <- function(n){
  return(n*(n+1)(2*n+1)/6)
}
n <- 1:25
# not sure what I'm supposed to do? NEED TO FIGURE OUT





# chatgpt below for # 11

# Function to compute S_n using the formula
formula_sn <- function(n) {
  return(n * (n + 1) * (2 * n + 1) / 6)
}

# Sequence n from 1 to 25
n <- 1:25

# Compute S_n using the formula
sn_formula <- sapply(n, formula_sn)

# Compute the sum of squares directly for comparison
sn_direct <- sapply(n, function(i) sum((1:i)^2))

# Compare the results
all_equal <- all(sn_formula == sn_direct)

# Print the results
data.frame(n = n, Sn_formula = sn_formula, Sn_direct = sn_direct, Equal = sn_formula == sn_direct)

# Print whether all results are equal
cat("Are all results equal?", all_equal, "\n")




# chatgpt below for # 10


# Define the sequence n from 1 to 25
n <- 1:25

# Use sapply to create s_n as in the previous step
s_n <- sapply(n, function(i) i)  # You can replace 'i' with a different function of 'i'

# Plot s_n versus n
plot(n, s_n, type = "p", main = "Plot of s_n vs n", xlab = "n", ylab = "s_n", pch = 19, col = "blue")

# Optionally, add a line connecting the points
lines(n, s_n, col = "blue", lty = 1)



































