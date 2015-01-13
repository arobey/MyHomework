# Complete all of the items below
# Use comments where you're having trouble or questions

# 1. Read your data set into R

CUdata <- read.csv("C:/Users/Alison/Desktop/Jan R Course/CUdata.csv")

# 2. Peek at the top few rows

head(CUdata)

# 3. Peek at the top few rows for only a few columns

CUdata[1:5, c(3,10,21)]


# 4. How many rows does your data have?

tail(CUdata)
#my data has 56 rows

nrow(CUdata) ####CORRECTION: THIS IS The BEST OPTION

# 5. Get a summary for every column

summary(CUdata)

# 6. Get a summary for one column

summary(CUdata$ExactAge.Calc)


# 7. Are any of the columns giving you unexpected values?
#    - missing values? (NA)

Several columns are giving me missing values, but they not unexpected. Some of the times were not recorded so
those values are missing, not all participate have notes, not all filled out the demographic information, and recollection
& familiarity have not been calculated yet


# 8. Select a few key columns, make a vector of the column names

KeyVariables <- c("Condition", "Age", "Source.Correct", "EncodingTime", "RetrievalTime" )
#I wasn't entirely sure what this question was asking, were we suppsed to extract just titles from the data?

# 9. Create a new data.frame with just that subset of columns
#    from #8
#    - do this in at least TWO different ways

KeyVariablesDF <- CUdata[ , c(3, 10, 21, 15, 17)]

KeyVariablesDF2 <- data.frame(Condition = CUdata$Condition, Age = CUdata$Age, Source.Correct = CUdata$Source.Correct, EncodingTime = CUdata$EncodingTime, RetrievalTime = CUdata$RetrievalTime)

# 10. Create a new data.frame that is just the first 10 rows
#     and the last 10 rows of the data from #8

KeyVariablesDF3 <- CUdata[c(1:10, 47:56) , c(3, 10, 21, 15, 17)]

# 11. Create a new data.frame that is a random sample of half of the rows.

KeyVariablesDF4 <- KeyVariablesDF2[sample(nrow(KeyVariablesDF2), 28), ]


# 12. Find a comparison in your data that is interesting to make
#     (comparing two sets of numbers)
#     - run a t.test for that comparison
#     - decide whether you need a non-default test
#       (e.g., Student's, paired)
#     - run the t.test with BOTH the formula and "vector"
#       formats, if possible
#     - if one is NOT possible, say why you can't do it

#is there a difference in Accuracy between the 2 age groups, default t-test is fine
AgeDiff1 <- t.test(CUdata$Accuracy[CUdata$Age ==6],CUdata$Accuracy[CUdata$Age == 8])
AgeDiff2 <- t.test(Accuracy~Age, data=CUdata)



# 13. Repeat #12 for TWO more comparisons
#     - ALTERNATIVELY, if correlations are more interesting,
#       do those instead of t-tests (and try both Spearman and
#       Pearson correlations)

Is there a difference in accuracy between conditions?
CondDiff1 <- t.test(Accuracy~Condition, data=CUdata)
CondDiff2 <- t.test(CUdata$Accuracy[CUdata$Condition == "Unitized"],CUdata$Accuracy[CUdata$Condition == "Non-Unitized"])


Is there a correlation between Encoding Time and Accuracy?
TimeCor1<- cor.test(CUdata$Accuracy, CUdata$EncodingTime, method = "pearson")
TimeCor2<- cor.test(CUdata$Accuracy, CUdata$EncodingTime, method = "spearman", exact = FALSE)

# 14. Save all results from #12 and #13 in an .RData file

save(AgeDiff1, AgeDiff2, CondDiff1, CondDiff2, TimeCor1, TimeCor2, file = "RobeyDay2Homework.RData")

# 15. Email me your version of this script, PLUS the .RData
#     file from #14
