
library(dslabs)
data("murders")

# structure-str
str(murders)

head(murders)

murders$population
#above is a vector

# names of columns
names(murders)

pop <- murders$population
#numeric vector
length(pop)
class(pop)

# factors
class(murders$region)


library(dslabs)
data(murders)

# We can see the class of the region variable using class
class(murders$region)

# Determine the number of regions included in this variable
levels(murders$region)
length(murders$region)

length(levels(murders$region))















































