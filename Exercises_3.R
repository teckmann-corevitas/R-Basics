
# 1. Examine the built-in dataset co2. Which of the following is true:
head(CO2)
print(CO2)
###co2 is tidy data: it has one year for each row.
#co2 is not tidy: we need at least one column with a character vector.
#co2 is not tidy: it is a matrix instead of a data frame.
#co2 is not tidy: to be tidy we would have to wrangle it to have three columns (year, month and value), then each co2 observation would have a row.


# 2. Examine the built-in dataset ChickWeight. Which of the following is true:
head(ChickWeight)
print(ChickWeight)
#ChickWeight is not tidy: each chick has more than one row.
###ChickWeight is tidy: each observation (a weight) is represented by one row. The chick from which this measurement came is one of the variables.
#ChickWeight is not tidy: we are missing the year column.
#ChickWeight is tidy: it is stored in a data frame.

# 3. Examine the built-in dataset BOD. Which of the following is true:
head(BOD)
print(BOD)
#BOD is not tidy: it only has six rows.
#BOD is not tidy: the first column is just an index.
###BOD is tidy: each row is an observation with two values (time and demand)
#BOD is tidy: all small datasets are tidy by definition.

# 4. Which of the following built-in datasets is tidy (you can pick more than one):
#BJsales
#EuStockMarkets
#DNase
#Formaldehyde
#Orange
#UCBAdmissions
head(BJsales)
print(BJsales) #not a dataframe?

head(EuStockMarkets)
print(EuStockMarkets) #tidy

head(DNase)
print(DNase) # tidy

head(Formaldehyde)
print(Formaldehyde) # tidy

head(Orange)
print(Orange) # tidy

head(UCBAdmissions)
print(UCBAdmissions) #not a dataframe?


# 5. Load the dplyr package and the murders dataset.
library(dplyr)
library(dslabs)
#You can add columns using the dplyr function mutate. This function is aware of the column names and inside the function you can call them unquoted:
murders <- mutate(murders, population_in_millions = population/10^6)
#We can write population rather than murders$population. The function mutate knows we are grabbing columns from murders.
#Use the function mutate to add a murders column named rate with the per 100,000 murder rate as in the example code above.
#Make sure you redefine murders as done in the example code above (murders <- [your code]) so we can keep using this variable.
murders <-  mutate(murders, population_per_10k = population/10^5)
head(murders)

# 6. If rank(x) gives you the ranks of x from lowest to highest, rank(-x) gives you the ranks from highest to lowest.
#Use the function mutate to add a column rank containing the rank of murder rate from highest to lowest.
#Make sure you redefine murders so we can keep using this variable.
murders <- mutate(murders, o_murders=rank(-population_per_10k))
head(murders)

# 7. With dplyr, we can use select to show only certain columns. For example, with this code we would only show the states and population sizes:
select(murders, state, population)
#Use select to show the state names and abbreviations in murders. Do not redefine murders, just show the results.
select(murders, state, abb)

# 8. The dplyr function filter is used to choose specific rows of the data frame to keep.
#Unlike select which is for columns, filter is for rows. For example, you can show just the New York row like this:
filter(murders, state == "New York")
#You can use other logical vectors to filter rows.
#Use filter to show the top 5 states with the highest murder rates.
#From here on, do not change the murders dataset, just show the result. Remember that you can filter based on the rank column.
filter(murders, o_murders<=5)

# 9. We can remove rows using the != operator. For example, to remove Florida, we would do this:
no_florida <- filter(murders, state != "Florida")
#Create a new data frame called no_south that removes states from the South region.
#How many states are in this category? You can use the function nrow for this.
no_south <- filter(murders, region !="South")
head(no_south)

# 10. We can also use %in% to filter with dplyr. You can therefore see the data from New York and Texas like this:
filter(murders, state %in% c("New York", "Texas"))
#Create a new data frame called murders_nw with only the states from the Northeast and the West. How many states are in this category?
murders_nw <- filter(murders, region=='Northeast' | region=='West')
head(murders_nw)

# 11. Suppose you want to live in the Northeast or West and want the murder rate to be less than 1.
#We want to see the data for the states satisfying these options. Note that you can use logical operators like & with filter.
#Here is an example in which we filter to keep only small states in the Northeast region.
filter(murders, population < 5000000 & region == "Northeast")
#Make sure murders has been defined with rate and rank and still has all states.
#Create a table called my_states that contains rows for states satisfying both the conditions:
#it is in the Northeast or West and the murder rate is less than 1. Use select to show only the state name, the rate, and the rank.
my_states <- filter(murders, (region=='Northeast' | region=='West') & rate<1) %>% select(state,rate,o_murders)
head(my_states)



# 12. The pipe |> can be used to perform operations sequentially without having to define intermediate objects.
#Start by redefining murders to include rate and rank.

murders <- mutate(murders, rate =  total/population*100000,rank = rank(-rate))
#In the solution to the previous exercise, we did the following:
my_states <- filter(murders, region %in% c("Northeast", "West") & rate < 1)
select(my_states, state, rate, rank)
#The pipe |> permits us to perform both operations sequentially without having to define an intermediate variable my_states.
#We therefore could have mutated and selected in the same line like this:
mutate(murders, rate =  total/population*100000,
       rank = rank(-rate)) |>
select(state, rate, rank)
#Notice that select no longer has a data frame as the first argument.
#The first argument is assumed to be the result of the operation conducted right before the |>.
#Repeat the previous exercise, but now instead of creating a new object, show the result and only include the state, rate, and rank columns.
#Use a pipe |> to do this in just one line.
#my_states <- murders |>
#  mutate SOMETHING |>
#  filter SOMETHING |>
#  select SOMETHING
my_states <- murders %>%
  mutate(mil= ifelse(population>1000000,1,0)) %>%
  filter(region=="Northeast") %>%
  select(state, abb, region, population,total, rate,mil)
my_states

# 13. For exercises 13-19, we will be using the data from the survey collected by the United States National Center for Health Statistics (NCHS).
#This center has conducted a series of health and nutrition surveys since the 1960’s.
#Starting in 1999, about 5,000 individuals of all ages have been interviewed every year and they complete the health examination component of the survey.
#Part of the data is made available via the NHANES package. Once you install the NHANES package, you can load the data like this:
library(NHANES)
#The NHANES data has many missing values. The mean and sd functions in R will return NA if any of the entries of the input vector is an NA. Here is an example:
library(dslabs)
mean(na_example)
#> [1] NA
sd(na_example)
#> [1] NA
#To ignore the NAs we can use the na.rm argument:
mean(na_example, na.rm = TRUE)
#> [1] 2.3
sd(na_example, na.rm = TRUE)
#> [1] 1.22
#Let’s now explore the NHANES data.
#We will provide some basic facts about blood pressure. First let’s select a group to set the standard.
#We will use 20-to-29-year-old females. AgeDecade is a categorical variable with these ages.
#Note that the category is coded like " 20-29", with a space in front!
#What is the average and standard deviation of systolic blood pressure as saved in the BPSysAve variable? Save it to a variable called ref.
#Hint: Use filter and summarize and use the na.rm = TRUE argument when computing the average and standard deviation. You can also filter the NA values using filter.
head(NHANES)
data <- NHANES %>%
  filter(AgeDecade==" 20-29" & Gender=="female")
head(data)
#ref <- mean(data$BPSysAve, na.rm = TRUE)
#ref_sd <- sd(data$BPSysAve, na.rm = TRUE)

ref <- NHANES %>%
  filter(AgeDecade==" 20-29" & Gender=="female") %>%
  summarize(
    mean_sys=mean(BPSysAve, na.rm = TRUE),
    sd_sys=sd(BPSysAve, na.rm = TRUE),
    max_sys=max(BPSysAve, na.rm = TRUE),
    min_sys=min(BPSysAve, na.rm = TRUE)
  )
head(ref)

# 14. Using a pipe, assign the average to a numeric variable ref_avg. Hint: Use the code from the previous exercise and then pull.
ref_avg <- ref %>% pull(mean_sys)
print(ref_avg)

# 15. Now report the min and max values for the same group.
ref_min <- ref %>% pull(min_sys)
print(ref_avg)
ref_max <- ref %>% pull(max_sys)
print(ref_avg)

# 16. Compute the average and standard deviation for females, but for each age group separately rather than a selected decade as in exercise 13.
#Note that the age groups are defined by AgeDecade. Hint: rather than filtering by age and gender, filter by Gender and then use group_by.
ref <- NHANES %>%
  filter(Gender=="female") %>%
  group_by(AgeDecade) %>%
  summarize(
    mean=mean(BPSysAve, na.rm = TRUE),
    sd=sd(BPSysAve, na.rm = TRUE),
  )
head(ref)

# 17. Repeat exercise 16 for males.
ref <- NHANES %>%
  filter(Gender=="male") %>%
  group_by(AgeDecade) %>%
  summarize(
    mean=mean(BPSysAve, na.rm = TRUE),
    sd=sd(BPSysAve, na.rm = TRUE),
  )
head(ref)

# no 18???

# 19. For males between the ages of 40-49, compare systolic blood pressure across race as reported in the Race1 variable.
#Order the resulting table from lowest to highest average systolic blood pressure.
ref <- NHANES %>%
  filter(AgeDecade==" 40-49" & Gender=="male") %>%
  group_by(Race1) %>%
  arrange(BPSysAve)
head(ref)



# 20. Load the murders dataset. Which of the following is true?
#murders is in tidy format and is stored in a tibble.
###murders is in tidy format and is stored in a data frame.
#murders is not in tidy format and is stored in a tibble.
#murders is not in tidy format and is stored in a data frame.

# 21. Use as_tibble to convert the murders data table into a tibble and save it in an object called murders_tibble.
murders_tibble <- as_tibble(murders)
head(murders_tibble)

# 22. Use the group_by function to convert murders into a tibble that is grouped by region.
murders_t <- murders %>% group_by(region) %>% as_tibble()
head(murders_t)

# 23. Write tidyverse code that is equivalent to this code:
exp(mean(log(murders$population)))
#Write it using the pipe so that each function is called without arguments. Use the dot operator to access the population.
#Hint: The code should start with murders |>.
result <- murders %>%
  pull(population) %>%
  log() %>%
  mean() %>%
  exp()
print(result)

# 24. Use the map_df to create a data frame with three columns named n, s_n, and s_n_2.
#The first column should contain the numbers 1 through 100. The second and third columns should each contain the sum of 1 through with the row number.
library(purrr)
df <- map_df(1:100, function(n) {
  tibble(
    n = n,
    s_n = sum(1:n),
    s_n_2 = sum(1:n)
  )
})
df






































