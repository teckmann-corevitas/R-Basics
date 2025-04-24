
library(tidyverse)
library(dslabs)

test <- co2

co2_wide <- data.frame(matrix(co2, ncol = 12, byrow = TRUE)) %>%
  setNames(1:12) %>%
  mutate(year = as.character(1959:1997))

co2_wide

co2_tidy <- pivot_longer(co2_wide, -year, names_to = "month", values_to = "co2")

co2_tidy %>% ggplot(aes(as.numeric(month), co2, color = year)) + geom_line()


library(dslabs)
data(admissions)
dat <- admissions %>% select(-applicants)

dat_tidy <- pivot_wider(dat, names_from = gender, values_from = admitted)


tmp <- admissions %>%
  pivot_longer(cols = c(admitted, applicants), names_to = "key", values_to = "value")
tmp

tmp2 <- unite(tmp, column_name, c(key, gender))


install.packages("Lahman")
library(Lahman)
top <- Batting %>%
  filter(yearID == 2016) %>%
  arrange(desc(HR)) %>%    # arrange by descending HR count
  slice(1:10)    # take entries 1-10
top %>% as_tibble()

People %>% as_tibble()


head(AwardsPlayers)
unique_players <- AwardsPlayers %>%
  distinct(playerID)

awards <- AwardsPlayers %>%
  filter(yearID==2016)

awards_play <- AwardsPlayers %>%
  filter(yearID==2016) %>% distinct(playerID)


top_10_hr <- top %>% distinct(playerID)

# top 10 home run hitters with one award
award_winning_top_hr <- intersect(top_10_hr$playerID, awards$playerID)
num_award_winning_top_hr <- length(award_winning_top_hr)
head(num_award_winning_top_hr)



library(rvest)
url <- "https://web.archive.org/web/20181024132313/http://www.stevetheump.com/Payrolls.htm"
h <- read_html(url)


nodes <- html_nodes(h, "table")

html_text(nodes[[8]])

html_table(nodes[[8]])

# Inspect the first 4 tables
tables <- sapply(nodes[1:4], html_table, fill = TRUE)

# Print them
for (i in 1:4) {
  cat("\n--- Table", i, "---\n")
  print(head(tables[[i]]))
}


library(rvest)
library(dplyr)

# Extract tables 10 and 19
tab_1 <- html_table(nodes[[10]], fill = TRUE)
tab_2 <- html_table(nodes[[19]], fill = TRUE)

# Remove extra first column from tab_1 (No.)
tab_1 <- tab_1[, -1]

# Remove first row (which contains the column names in both tables)
tab_1 <- tab_1[-1, ]
tab_2 <- tab_2[-1, ]

# Rename columns
colnames(tab_1) <- c("Team", "Payroll", "Average")
colnames(tab_2) <- c("Team", "Payroll", "Average")

# Join by "Team"
joined <- full_join(tab_1, tab_2, by = "Team")

# Output number of rows
nrow(joined)




library(rvest)
library(tidyverse)
url <- "https://en.wikipedia.org/w/index.php?title=Opinion_polling_for_the_United_Kingdom_European_Union_membership_referendum&oldid=896735054"

# Read the HTML page
page <- read_html(url)

# Extract all nodes with "table" tag
tab <- html_nodes(page, "table")

# Count the number of tables
length(tab)


# Loop through each table and check for 9 columns + first column name
for (i in seq_along(tab)) {
  tbl <- html_table(tab[[i]], fill = TRUE)
  if (ncol(tbl) == 9 && names(tbl)[1] == "Date(s) conducted") {
    cat("✅ Table", i, "is the first one with 9 columns and 'Date(s) conducted' as the first column.\n")
    break
  }
}


library(rvest)
library(tidyverse)
library(stringr)
url <- "https://en.wikipedia.org/w/index.php?title=Opinion_polling_for_the_United_Kingdom_European_Union_membership_referendum&oldid=896735054"
tab <- read_html(url) %>% html_nodes("table")
polls <- tab[[6]] %>% html_table(fill = TRUE)

head(polls)



polls_clean <- polls %>%
  rename(
    dates = `Date(s) conducted`,
    remain = Remain,
    leave = Leave,
    undecided = Undecided,
    lead = Lead,
    samplesize = Sample,
    pollster = `Conducted by`,
    poll_type = `Polling type`
  ) %>%
  filter(str_detect(remain, "%"))














