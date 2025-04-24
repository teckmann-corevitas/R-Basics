library(tidyverse)

# add columns, data in first argument
murders <- mutate(murders, rate = total/population*100000)
head(murders)

# filter, dataframe in first arugument
filter(murders, rate <= 0.71)
#>           state abb        region population total  rate
#> 1        Hawaii  HI          West    1360301     7 0.515
#> 2          Iowa  IA North Central    3046355    21 0.689
#> 3 New Hampshire  NH     Northeast    1316470     5 0.380
#> 4  North Dakota  ND North Central     672591     4 0.595
#> 5       Vermont  VT     Northeast     625741     2 0.320



# subbesetting by columns
new_dataframe <- select(murders, state, region, rate)
filter(new_dataframe, rate <= 0.71)
#>           state        region  rate
#> 1        Hawaii          West 0.515
#> 2          Iowa North Central 0.689
#> 3 New Hampshire     Northeast 0.380
#> 4  North Dakota North Central 0.595
#> 5       Vermont     Northeast 0.320



# keeping only numeric columns
new_dataframe <- select(murders, where(is.numeric))
names(new_dataframe)
#> [1] "population" "total"      "rate"


# keeping columns that start with 'r'
new_dataframe <- select(murders, starts_with("r"))
names(new_dataframe)
#> [1] "region" "rate"


# transforming variables
mutate(murders, population = log10(population))
mutate(murders, across(c(population, total), log10))
mutate(murders, across(where(is.numeric), log10))
mutate(murders, across(where(is.character), tolower))


#### THe Pipe %>% or |>

murders |> select(state, region, rate) |> filter(rate <= 0.71)

16 |> sqrt()

16 |> sqrt() |> log2()

murders |> select(state, region, rate) |> filter(rate <= 0.71)edsfsdf


library(dplyr)
library(dslabs)
# summarizing data

s <- heights |>
  filter(sex == "Female") |>
  summarize(average = mean(height), standard_deviation = sd(height))
s
s$average
s$standard_deviation

murders <- murders |> mutate(rate = total/population*100000)
murders |>
  summarize(rate = mean(rate))

us_murder_rate <- murders |>
  summarize(rate = sum(total)/sum(population)*100000)
us_murder_rate

heights |> summarize(median = median(height), min = min(height), max = max(height))

heights |> reframe(quantiles = quantile(height, c(0.5, 0, 1)))

median_min_max <- function(x){
  qs <- quantile(x, c(0.5, 0, 1))
  data.frame(median = qs[1], min = qs[2], max = qs[3])
}
heights |> summarize(median_min_max(height))

# grouping
heights |> group_by(sex)

heights |>
  group_by(sex) |>
  summarize(average = mean(height), standard_deviation = sd(height))

murders |>
  group_by(region) |>
  summarize(median_min_max(rate))

class(us_murder_rate)
us_murder_rate <- murders |>
  summarize(rate = sum(total)/sum(population)*100000) |>
  pull(rate)

us_murder_rate
class(us_murder_rate)

# sorting

murders |> arrange(population) |> head()
murders |> arrange(desc(rate))

murders |>
  arrange(region, rate) |>
  head()

# showing a specific number instead of using head
murders |> top_n(8, rate)

## Tibbles

murders |> group_by(region)

murders |> group_by(region) |> class()
#> [1] "grouped_df" "tbl_df"     "tbl"        "data.frame"

class(murders[,4])
#> [1] "numeric"

class(as_tibble(murders)[,4])
#> [1] "tbl_df"     "tbl"        "data.frame"

class(as_tibble(murders)$population)
#> [1] "numeric"

tibble(id = c(1, 2, 3), func = c(mean, median, sd))
#> # A tibble: 3 × 2
#>      id func
#>   <dbl> <list>
#> 1     1 <fn>
#> 2     2 <fn>
#> 3     3 <fn>

as_tibble(grades) |> class()
#> [1] "tbl_df"     "tbl"        "data.frame"
#>


# place holder

#equivalent
log(8, base = 2)
2 |> log(8, base = _)
2 %>% log(8, base = .)

compute_s_n <- function(n) {
  sum(1:n)
}
n <- 1:25
s_n <- sapply(n, compute_s_n)


library(purrr)
s_n <- map(n, compute_s_n)
class(s_n)
#> [1] "list", map always returns list

s_n <- map_dbl(n, compute_s_n)
class(s_n)
#> [1] "numeric", map_dbl always returns numeric

s_n <- map_df(n, compute_s_n)


compute_s_n <- function(n) {
  tibble(sum = sum(1:n))
}
s_n <- map_df(n, compute_s_n)


# case_when
x <- c(-2, -1, 0, 1, 2)
case_when(x < 0 ~ "Negative",
          x > 0 ~ "Positive",
          TRUE  ~ "Zero")
#> [1] "Negative" "Negative" "Zero"     "Positive" "Positive"


murders |>
  mutate(group = case_when(
    abb %in% c("ME", "NH", "VT", "MA", "RI", "CT") ~ "New England",
    abb %in% c("WA", "OR", "CA") ~ "West Coast",
    region == "South" ~ "South",
    TRUE ~ "Other")) |>
  group_by(group) |>
  summarize(rate = sum(total)/sum(population)*10^5)
#> # A tibble: 4 × 2
#>   group        rate
#>   <chr>       <dbl>
#> 1 New England  1.72
#> 2 Other        2.71
#> 3 South        3.63
#> 4 West Coast   2.90

# between
x >= a & x <= b

between(x, a, b)


