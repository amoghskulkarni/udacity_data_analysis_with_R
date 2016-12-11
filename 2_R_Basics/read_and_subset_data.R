# This will give the present working directory
getwd()

# To set the present working directory (to refer to downloaded .csv file)
# (Linux style slashes)
setwd("E:/Work/MOOCs/Udacity/Intro to R")

# Like python, read.csv() to read the .csv file
statesInfo <- read.csv('stateData.csv')

# To find a subset of data (subset of datapoints in the dataframe) by giving a criteria on one (or more) feature(s)
subset(statesInfo, state.region == 1)

# Same thing, with different syntax
statesInfo[statesInfo$state.region == 1, ]

# You can, of course, save these subsets
stateSubset <- subset(statesInfo, state.region == 1)
stateSubsetBracket <- statesInfo[statesInfo$state.region == 1, ]

### Playing with the data
# States with illiteracy rates of 0.5%
illiteracy_half_percent <- subset(statesInfo, illiteracy == 0.5)

# States with graduation rates ABOVE 50%
graduation_fifty_percent <- subset(statesInfo, highSchoolGrad > 50.0)
num_graduation_fifty_percent <- dim(graduation_fifty_percent)[1]
