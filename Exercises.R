# exercises
library(dslabs)

# 1. What is the sum of the first 100 positive integers? The formula for the sum of integers 1 through n is
#Define and then use R to compute the sum of 1 through 100 using the formula. What is the sum?

n <- 100
n
n*(n+1)/2

# 2. Now use the same formula to compute the sum of the integers from 1 through 1000.

n <- 1000
n
n*(n+1)/2

# 3. Look at the result of typing the following code into R:
n <- 1000
x <- seq(1, n)
sum(x)

#Based on the result, what do you think the functions seq and sum do? You can use help.

# sum creates a list of numbers and seq adds them up.
### seq creates a list of numbers and sum adds them up.
# seq creates a random list and sum computes the sum of 1 through 1,000.
# sum always returns the same number.

# 4. In math and programming, we say that we evaluate a function when we replace the argument with a given value.
#So if we type sqrt(4), we evaluate the sqrt function. In R, you can evaluate a function inside another function.
#The evaluations happen from the inside out. Use one line of code to compute the log, in base 10, of the square root of 100.

log10(sqrt(100))

# 5. Which of the following will always return the numeric value stored in x? You can try out examples and use the help system if you want.

log(10^x)
log10(x^10) # this one
log(exp(x))
exp(log(x, base = 2))


# 6. Make sure the US murders dataset is loaded.
#Use the function str to examine the structure of the murders object. Which of the following best describes the variables represented in this data frame?
library(dslabs)
head(murders)
#The 51 states.
#The murder rates for all 50 states and DC.
###The state name, the abbreviation of the state name, the state’s region, and the state’s population and total number of murders for 2010.
#str shows no relevant information.

# 7. What are the column names used by the data frame for these five variables
names(murders)

# 8. Use the accessor $ to extract the state abbreviations and assign them to the object a. What is the class of this object?

a <- murders$state
class(a)

# 9. Now use the square brackets to extract the state abbreviations and assign them to the object b. Use the identical function to determine if a and b are the same.
b <- murders[['state']]
class(b)

# 10. We saw that the region column stores a factor. You can corroborate this by typing:
class(murders$region)
#With one line of code, use the functions levels and length to determine the number of regions defined by this dataset.

# 11. The function table takes a vector and returns the frequency of each element.
#You can quickly see how many states are in each region by applying this function.
#Use this function in one line of code to create a table of number of states per region.
levels(murders$region)
table(murders$region)

# 12. Use the function c to create a vector with the average high temperatures in January for Beijing, Lagos, Paris, Rio de Janeiro, San Juan, and Toronto, which are 35, 88, 42, 84, 81, and 30 degrees Fahrenheit. Call the object temp.
city <- c("Beijing", "Lagos", "Paris", "Rio de Janeiro", "San Juan", "Toronto")

temp <- c(35, 88, 42, 84, 81, 30)

# 13. Now create a vector with the city names and call the object city.
# see above

# 14. Use the names function and the objects defined in the previous exercises to associate the temperature data with its corresponding city.
names(temp) <- city

# 15. Use the [ and : operators to access the temperature of the first three cities on the list.
temp[1:3]

# 16. Use the [ operator to access the temperature of Paris and San Juan.
temp[c("Paris", "San Juan")]

# 17. Use the : operator to create a sequence of numbers.
12:73

# 18. Create a vector containing all the positive odd numbers smaller than 100.
odd <- seq(1, 99, by = 2)
odd

# 19. Create a vector of numbers that starts at 6, does not pass 55,
#and adds numbers in increments of 4/7: 6, 6 + 4/7, 6 + 8/7, and so on.
#How many numbers does the list have? Hint: use seq and length?
sequence <- seq(6, 55, by = 4/7)
length(sequence)

# 20. What is the class of the following object a <- seq(1, 10, 0.5)?
a <- seq(1, 10, 0.5)
class(a) #numeric

# 21. What is the class of the following object a <- seq(1, 10)?
a <- seq(1, 10)
class(a) #integer

# 22. The class of class(a<-1) is numeric, not integer.
#R defaults to numeric and to force an integer, you need to add the letter L.
#Confirm that the class of 1L is integer.
class(a<-1)
class(1L)

# 23. Define the following vector:
x <- c("1", "3", "5")
#and coerce it to get integers.
x_int <- as.integer(x)
x_int


# 24. For exercises 24-31 we will use the US murders dataset. Make sure you load it prior to starting.
#Use the $ operator to access the population size data and store it as the object pop.
#Then use the sort function to redefine pop so that it is sorted. Finally, use the [ operator to report the smallest population size.

library(dslabs)
head(murders)

pop <- murders$population
pop
sort(pop)
sorted_pop <- sort(pop)
smallest_value <- sorted_pop[1]
smallest_value

# 25. Now instead of the smallest population size, find the index of the entry with the smallest population size. Hint: use order instead of sort.
ind <- order(pop)[1]
ind

# 26. We can actually perform the same operation as in the previous exercise using the function which.min. Write one line of code that does this.
min(pop)

# 27. Now we know how small the smallest state is and we know which row represents it.
#Which state is it? Define a variable states to be the state names from the murders data frame. Report the name of the state with the smallest population.
small_state <- which.min(murders$population)
murders$state[small_state]

# 28. You can create a data frame using the data.frame function. Here is a quick example:
temp <- c(35, 88, 42, 84, 81, 30)
city <- c("Beijing", "Lagos", "Paris", "Rio de Janeiro",
          "San Juan", "Toronto")
city_temps <- data.frame(name = city, temperature = temp)
#Use the rank function to determine the population rank of each state from smallest population size to biggest.
#Save these ranks in an object called ranks, then create a data frame with the state name and its rank. Call the data frame my_df.

ranks <- rank(murders$population)
ranks
state <- murders$state
my_df <- data.frame(state=state,rank=ranks)
my_df

# 29. Repeat the previous exercise, but this time order my_df so that the states are ordered from least populous to most populous.
#Hint: create an object ind that stores the indexes needed to order the population values.
#Then use the bracket operator [ to re-order each column in the data frame.

ranks <- rank(murders$population)
ranks
pop <- murders$population
my_df <- data.frame(state=state, population=pop, rank=ranks)
my_df

ind <- order(my_df$population)
ind
my_df_ordered <- my_df[ind, ]
print(my_df_ordered)

# 30. The na_example vector represents a series of counts. You can quickly examine the object using:
str(na_example)
#>  int [1:1000] 2 1 3 2 1 3 1 4 3 2 ...
mean(na_example)
#> [1] NA
#The is.na function returns a logical vector that tells us which entries are NA.
#Assign this logical vector to an object called ind and determine how many NAs does na_example have.
ind <-  is.na(na_example)
ind
num_NAs <- sum(ind)
num_NAs

# 31. Now compute the average again, but only for the entries that are not NA.
#Hint: remember the ! operator, which turns FALSE into TRUE and vice versa.
non_na_values <- na_example[!is.na(na_example)]
mean_non_na <- mean(non_na_values)
mean_non_na

# 32. In exercises 28 we created the temp data frame:
temp <- c(35, 88, 42, 84, 81, 30)
city <- c("Beijing", "Lagos", "Paris", "Rio de Janeiro",
          "San Juan", "Toronto")
city_temps <- data.frame(name = city, temperature = temp)
#Remake the data frame using the code above, but add a line that converts the temperature from Fahrenheit to Celsius.
#The conversion is  C= 5/9 *(F-32)
city_temps <- data.frame(name = city, temperature = (temp-32)*5/9)
city_temps

# 33. What is the following sum 1 + (1/2)^2 + (1/3)^2 +... (1/100)^2? Hint: thanks to Euler, we know it should be close to (pi^2)/6
x <- sum((1/(1:100))^2)
x

pi2_6 <- pi^2 / 6
pi2_6

# 34. Compute the per 100,000 murder rate for each state and store it in the object murder_rate.
#Then compute the average murder rate for the US using the function mean. What is the average?
murder_rate <- murders$total / murders$population * 100000
print(mean(murder_rate))
mean(murder_rate)

# 35. For remaining exercises 35-42, start by loading the library and data.
library(dslabs)
#Compute the per 100,000 murder rate for each state and store it in an object called murder_rate.
#Then use logical operators to create a logical vector named low that tells us which entries of murder_rate are lower than 1.
safe <- murder_rate <= 1
murders$state[safe]

# 36. Now use the results from the previous exercise and the function which to determine the indices of murder_rate associated with values lower than 1.
# 37. Use the results from the previous exercise to report the names of the states with murder rates lower than 1.
#see above

# 38. Now extend the code from the exercise to report the states in the Northeast with murder rates lower than 1.
#Hint: use the previously defined logical vector low and the logical operator &.
ne <- murders$region=="Northeast"
safe_ne <- safe & ne
murders$state[safe_ne]

# 39. In a previous exercise we computed the murder rate for each state and the average of these numbers. How many states are below the average?
below_avg <- murder_rate < mean(murder_rate)
murders$state[below_avg]

# 40. Use the match function to identify the states with abbreviations AK, MI, and IA.
#Hint: start by defining an index of the entries of murders$abb that match the three abbreviations, then use the [ operator to extract the states.
match <- match(c("AK","MI","IA"),murders$abb)
murders$state[match]

# 41. Use the %in% operator to create a logical vector that answers the question: which of the following are actual abbreviations: MA, ME, MI, MO, MU?
c("MA", "ME", "MI", "MO", "MU") %in% murders$abb

# 42. Extend the code you used in exercise 7 to report the one entry that is not an actual abbreviation.
#Hint: use the ! operator, which turns FALSE into TRUE and vice versa, then which to obtain an index.
abbs <- c("MA", "ME", "MI", "MO", "MU")
not_state <- abbs[!abbs %in% murders$abb]
not_state

# 43. We made a plot of total murders versus population and noted a strong relationship. Not surprisingly, states with larger populations had more murders.
population_in_millions <- murders$population/10^6
total_gun_murders <- murders$total
plot(population_in_millions, total_gun_murders)
#Keep in mind that many states have populations below 5 million and are bunched up.
#We may gain further insights from making this plot in the log scale. Transform the variables using the log10 transformation and then plot them.
log_pop=log(base = 10,murders$population)
log_murder=log(base = 10,murders$total)
plot(log_pop, log_murder)

# 44. Create a histogram of the state populations.
hist(murders$population)

# 45. Generate boxplots of the state populations by region.
boxplot(population~region, data=murders)




