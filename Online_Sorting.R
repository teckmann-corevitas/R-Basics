library(dslabs)
data(murders)
sort(murders$total)

x <- c(31, 4, 15, 92, 65)
x
sort(x)    # puts elements in order

index <- order(x)    # returns index that will put x in order
x[index]    # rearranging by this index puts elements in order
order(x)

murders$state[1:10]
murders$abb[1:10]

index <- order(murders$total)
murders$abb[index]    # order abbreviations by total murders

max(murders$total)    # highest number of total murders
i_max <- which.max(murders$total)    # index with highest number of murders
murders$state[i_max]    # state name with highest number of total murders

#min and max

x <- c(31, 4, 15, 92, 65)
x
rank(x)    # returns ranks (smallest to largest)




library(dslabs)
data(murders)

# Generate a variable `states` to contain the names of the states of the
# murders data set
states <- murders$state

# Generate a `ranks` variable to determine the ranks
# of population sizes
ranks <- rank(murders$population)

# Generate a variable `ind` to hold the indices needed for sorting
# the population values with the order command.
ind <- order(murders$population)

# Generate a data frame `my_df` with the name of the state and its ordered rank
# from the smallest population to the largest population
my_df <- data.frame(
  state = states[ind],
  rank = ranks[ind]
)

my_df


# Notice what we can do with the `!` operator
x <- c(1, 2, 3)
ind <- c(FALSE, TRUE, FALSE)
x[!ind]

# Generate the ind vector for 'na_example'
library(dslabs)
data(na_example)
ind <- is.na(na_example)

# When we try to calculate the average, we get `NA` as the answer
mean(na_example)

# Calculate the average of `na_example` after removing the
# input `NA` by using the `!` operator in `ind`
ind <- mean(na_example[!ind])
ind
























