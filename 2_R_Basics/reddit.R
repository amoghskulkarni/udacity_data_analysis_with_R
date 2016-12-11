# Set working directory to the directory containing the csv file
setwd('E:/Work/MOOCs/Udacity/Intro to R')

# Read the reddit data
reddit <- read.csv('reddit.csv')

# To have a look into data
str(reddit)

# To get the dimensions of the data
dim(reddit)

# Some columns contain the variabels which are factor types - i.e. variables which can have different levels (discrete values, like enum)
# Like the variable, 'employment' which is a factor variable in the dataset

# To get a summary of the dataset -
summary(reddit)

# To get the data in a tabular format
View(reddit)

# Factor variables have 'levels' and we can look at them as -
levels(reddit$age.range)

# We can get a table saying how many entries are of which levels
table(reddit$age.range)

# Let's plot the factor 'age.range' using ggplot2's function qplot()
install.packages("ggplot2")
library(ggplot2)
qplot(data = reddit, x = age.range)

# Notice that column for 'under 18' is after all the columns, which is a bit non-intuitive. We can have it ordered with the help of "ordered factors". 

# Before that we can decide how many other variables (factor ones) need to be ordered factors -
qplot(data = reddit, x = gender)
qplot(data = reddit, x = military.service)
qplot(data = reddit, x = children)
qplot(data = reddit, x = country)
qplot(data = reddit, x = state)
qplot(data = reddit, x = income.range)

# Only 'income.range' needs to be ordered and it is non-intuitive if we don't make them ordered
is.factor(reddit$age.range)         # Returns "TRUE"
is.ordered(reddit$age.range)        # Returns "FALSE"

# create a variable using ordered() function and give 'levels' as the levels in the order which you want them to be 
reddit_factored_age_range <- ordered(reddit$age.range, levels=c("Under 18", "18-24", "25-34", "35-44", "45-54", "55-64", "65 or Above"))
qplot(data = reddit, x = reddit_factored_age_range)

# Alternate solution using factor() function
reddit_factored_age_range_2 <- factor(reddit$age.range, levels=c("Under 18", "18-24", "25-34", "35-44", "45-54", "55-64", "65 or Above"), ordered = TRUE)
qplot(data = reddit, x = reddit_factored_age_range_2)

# Doing the same thing with 'income.range' variable
reddit_factored_income_range <- ordered(reddit$income.range, levels=c("Under $20,000", 
                                                                      "$20,000 - $29,999", 
                                                                      "$30,000 - $39,999", 
                                                                      "$40,000 - $49,999",
                                                                      "$50,000 - $69,999",
                                                                      "$70,000 - $99,999",
                                                                      "$100,000 - $149,999", 
                                                                      "$150,000 or more"))

# Observe the difference between the plots is visible in the below example
qplot(data = reddit, x = income.range)
qplot(data = reddit, x = reddit_factored_income_range)
