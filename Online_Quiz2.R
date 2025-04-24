library(dslabs)
library(dplyr)
data(heights)
options(digits = 3)


head(heights)
mean(heights$height,na.rm = TRUE)

heights <- heights %>%
  mutate(ind = ifelse(height > mean(height, na.rm = TRUE), 1, 0))
head(heights)

table(heights$ind, heights$sex)
table(heights$sex)

female_proportion <- mean(heights$sex == "Female", na.rm = TRUE)

# Report the result with 3 significant digits
round(female_proportion, 3)

min(heights$height)

min_height_index <-match(min(heights$height, na.rm = TRUE), heights$height)

heights$sex[min_height_index]


max(heights$height)


x <- min(heights$height, na.rm = TRUE):max(heights$height, na.rm = TRUE)
x

not_heights <- sum(!(x %in% heights$height))
not_heights

heights$height[18]
heights$height[18]*2.54

heights <- mutate(heights,
                  ht_cm = height *2.54
)
head(heights)

mean(heights$ht_cm,na.rm = TRUE)

heights2 <- filter(heights, sex=="Female")
head(heights2)
nrow(heights2)
mean(heights2$ht_cm)


library(dslabs)

head(murders)

#which(murders$state=="Massachusetts") #YES
#match(c("Massachusetts"), murders$state) #YES
#c("Massachusetts") %in% murders$state #NO
#which(murders$state="Massachusetts") #NO

library(dslabs)
filter(murders, region == "Northeast")
murders %>% filter(region == "Northeast")
#murders %>% select(region == "Northeast")
#murders %>% filter(murders, region == "Northeast")
#select(murders, region == "Northeast")

library(dslabs)
#ind %in% murders$state
!ind %in% murders$state
#ind !%in% murders$state
#!match(ind, murders$state)
#match(!ind, murders$state)

