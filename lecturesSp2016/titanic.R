# Based on https://github.com/wehrley/wehrley.github.io/blob/master/SOUPTONUTS.md

# default give two significant digits for calculations
options(digits=4)
# Define a helper function to read in the csv files
readData <- function(path.name, file.name, column.types, missing.types) {
  read.csv( paste(path.name, file.name, sep="") , 
            colClasses=column.types,
            na.strings=missing.types )
}
# Specify file location and data
# Note that data has already been split between train and test data
# and that the training data includes survival information

Titanic.path <- "./resources/"
train.data.file <- "train.csv"
test.data.file <- "test.csv"
missing.types <- c("NA", "")
train.column.types <- c('integer',   # PassengerId
                        'factor',    # Survived 
                        'factor',    # Pclass
                        'character', # Name
                        'factor',    # Sex
                        'numeric',   # Age
                        'integer',   # SibSp
                        'integer',   # Parch
                        'character', # Ticket
                        'numeric',   # Fare
                        'character', # Cabin
                        'factor'     # Embarked
)
test.column.types <- train.column.types[-2]  

# Read in the data
train.raw <- readData(Titanic.path, train.data.file, 
                      train.column.types, missing.types)
df.train <- train.raw
test.raw <- readData(Titanic.path, test.data.file, 
                     test.column.types, missing.types)
df.infer <- test.raw 

#Look at some of the data
# Install Amelia first
require(Amelia)
missmap(df.train, main="Titanic Training Data - Missings Map", 
        col=c("yellow", "black"), legend=FALSE)

# note that Age and cabin are often missing

# Some more plots to see how each data element is divided
# You are interested in which variables can divide up the data set

barplot(table(df.train$Survived),
        names.arg = c("Perished", "Survived"),
        main="Survived (passenger fate)", col="black")
barplot(table(df.train$Pclass), 
        names.arg = c("first", "second", "third"),
        main="Pclass (passenger traveling class)", col="firebrick")
barplot(table(df.train$Sex), main="Sex (gender)", col="darkviolet")
hist(df.train$Age, main="Age", xlab = NULL, col="brown")
barplot(table(df.train$SibSp), main="SibSp (siblings + spouse aboard)", 
        col="darkblue")
barplot(table(df.train$Parch), main="Parch (parents + kids aboard)", 
        col="gray50")
hist(df.train$Fare, main="Fare (fee paid for ticket[s])", xlab = NULL, 
     col="darkgreen")
barplot(table(df.train$Embarked), 
        names.arg = c("Cherbourg", "Queenstown", "Southampton"),
        main="Embarked (port of embarkation)", col="sienna")

# may need vcd package (imported by VIM)
# look at survival by class using mosaicplot
require(vcd)
mosaicplot(df.train$Pclass ~ df.train$Survived, 
           main="Passenger Fate by Traveling Class", shade=FALSE, 
           color=TRUE, xlab="Pclass", ylab="Survived")
# look at survival by gender using mosaicplot
mosaicplot(df.train$Sex ~ df.train$Survived, 
           main="Passenger Fate by Gender", shade=FALSE, color=TRUE, 
           xlab="Sex", ylab="Survived")

# by port of embarkation does not seem so useful
mosaicplot(df.train$Embarked ~ df.train$Survived, 
           main="Passenger Fate by Port of Embarkation",
           shade=FALSE, color=TRUE, xlab="Embarked", ylab="Survived")

# Now lets look at all correlations
require(corrgram)
require(plyr)     # for the revalue function 
corrgram.data <- df.train
## change features of factor type to numeric type for inclusion on correlogram
corrgram.data$Survived <- as.numeric(corrgram.data$Survived)
corrgram.data$Pclass <- as.numeric(corrgram.data$Pclass)
corrgram.data$Embarked <- revalue(corrgram.data$Embarked, 
                                  c("C" = 1, "Q" = 2, "S" = 3))
## generate correlogram
corrgram.vars <- c("Survived", "Pclass", "Sex", "Age", 
                   "SibSp", "Parch", "Fare", "Embarked")
corrgram(corrgram.data[,corrgram.vars], order=FALSE, 
         lower.panel=panel.ellipse, upper.panel=panel.pie, 
         text.panel=panel.txt, main="Titanic Training Data")

# DATA MUNGING

require(plyr)
# MISSING DATA
# Given that there is a lot of missing data on Age, is there any way we can guess age?
# Look at the Age data we have

summary(df.train$Age)
length(df.train$Age)

# Let's look at Age compared to some other feature.  Pclass, Name
boxplot(df.train$Age ~ df.train$Pclass, 
           main="Passenger Age by Traveling Class", shade=FALSE, 
           color=TRUE, xlab="Pclass", ylab="Age")

tail(df.train$Name, n=40L)

#  Can we use the honorific to help guess age?
getTitle <- function(data) {
  title.dot.start <- regexpr("\\,[A-Z ]{1,20}\\.", data$Name, TRUE)
  title.comma.end <- title.dot.start+ attr(title.dot.start, "match.length")-1
  Title <- substr(data$Name, title.dot.start+2, title.comma.end-1)
  return (Title)
}  
Title <- getTitle(df.train)
unique(Title) 

df.train$Title <- Title
# See what we got
unique(df.train$Title)

# Let's look at the ages based on title, focus on if a field was missing
require(Hmisc)
bystats(df.train$Age, df.train$Title, 
        fun=function(x)c(Mean=mean(x),Median=median(x), SD = sd(x)))


# The person's title seems to be a differentiating factor for age, so let's use age to 


## list of titles with missing Age value(s) requiring imputation 
titles.na.train <- c("Dr", "Master", "Mrs", "Miss", "Mr")

# Median is less sensitive to outliers than mean for making a best guess,
# so use the median to fill in the missing value

imputeMedian <- function(impute.var, filter.var, var.levels) {
  for (v in var.levels) {
    impute.var[ which( filter.var == v)] <- impute(impute.var[ 
      which( filter.var == v)])
  }
  return (impute.var)
}

# Look at one title
df.train$Age[which(df.train$Title=="Dr")]

df.train$Age <- imputeMedian(df.train$Age, df.train$Title, 
                             titles.na.train)
df.train$Age[which(df.train$Title=="Dr")]

bystats(df.train$Age, df.train$Title, 
        fun=function(x)c(Mean=mean(x),Median=median(x), SD = sd(x)))

# notice that all missing values are filled in. Now, lets look at correlation again
corrgram(corrgram.data[,corrgram.vars], order=FALSE, 
         lower.panel=panel.ellipse, upper.panel=panel.pie, 
         text.panel=panel.txt, main="Titanic Training Data")

# DATA ERRORS

# Look at fare
summary(df.train$Fare)

# There is a really wide spread. Odd that there are some 0's
subset(df.train, Fare < 7)[order(subset(df.train, Fare < 7)$Fare, 
                                 subset(df.train, Fare < 7)$Pclass), 
                           c("Age", "Title", "Pclass", "Fare")]

# Discontinuity in fares suggest errors. Try filling in using median of Pclass

## impute missings on Fare feature with median fare by Pclass
df.train$Fare[ which( df.train$Fare == 0 )] <- NA
df.train$Fare <- imputeMedian(df.train$Fare, df.train$Pclass, 
                              as.numeric(levels(df.train$Pclass)))

# FEATURE ENGINEERING

# Look at the titles
unique(df.train$Title)

# can we group them somehow? Try to group titles of nobility.
# Also, note that there are french titles here along with English counterparts

## function for assigning a new title value to old title(s) 
changeTitles <- function(data, old.titles, new.title) {
  for (honorific in old.titles) {
    data$Title[ which( data$Title == honorific)] <- new.title
  }
  return (data$Title)
}
## Title consolidation
df.train$Title <- changeTitles(df.train, 
                               c("the Countess", "Capt", "Col", "Don", "Dr", 
                                 "Jonkheer", "Lady", "Major", 
                                 "Rev", "Sir"),
                               "Noble")
df.train$Title <- changeTitles(df.train, c("Ms"), 
                               "Mrs")
df.train$Title <- changeTitles(df.train, c("Mlle", "Mme"), "Miss")
df.train$Title <- as.factor(df.train$Title)
unique(df.train$Title)

require(stringr)  # for the str_sub function
# Lets investigate if the policy of "women and children first" was followed
# Hypothesis - leads to higher survival rate of women and children because
# they got the first seats in a lifeboat

# Need to operationalized the policy. We'll call it 'dibs' and do some other things
# like combine the family data, recode survivors, passenger class, and
# calculate fare per person (dividing fare paid by family size)

## function to add features to training or test data frames
featureEngrg <- function(data) {
  ## Using Fate ILO Survived because term is shorter and just sounds good
  data$Fate <- data$Survived
  ## Revaluing Fate factor to ease assessment of confusion matrices later
  data$Fate <- revalue(data$Fate, c("1" = "Survived", "0" = "Perished"))
  ## Boat.dibs attempts to capture the "women and children first"
  ## policy in one feature.  Assuming all females plus males under 15
  ## got "dibs' on access to a lifeboat
  data$Boat.dibs <- "No"
  data$Boat.dibs[which(data$Sex == "female" | data$Age < 15)] <- "Yes"
  data$Boat.dibs <- as.factor(data$Boat.dibs)
  ## Family consolidates siblings and spouses (SibSp) plus
  ## parents and children (Parch) into one feature
  data$Family <- data$SibSp + data$Parch
  ## Fare.pp attempts to adjust group purchases by size of family
  ## Note the +1 to include the individual whose record is being examined
  data$Fare.pp <- data$Fare/(data$Family + 1)
  ## Giving the traveling class feature a new look
  data$Class <- data$Pclass
  data$Class <- revalue(data$Class, 
                        c("1"="First", "2"="Second", "3"="Third"))
  return (data)
}

## add remaining features to training data frame
df.train <- featureEngrg(df.train)
train.keeps <- c("Fate", "Sex", "Boat.dibs", "Age", "Title", 
                 "Class", "Fare", "Fare.pp", 
                 "Embarked", "Family")
df.train.munged <- df.train[train.keeps]
#  MODELING

# Now that feature engineering is done, we can build a model 
# Note how much work we have already done!
require(caret)
# take the training data and split it between a test and training set
set.seed(23)
training.rows <- createDataPartition(df.train.munged$Fate, 
                                     p = 0.8, list = FALSE)
train.batch <- df.train.munged[training.rows, ]
test.batch <- df.train.munged[-training.rows, ]

# Let's try a logistic regression first (logit model)

Titanic.logit.1 <- glm(Fate ~ Sex + Class + Age + Family + Embarked + Fare, 
                       data = train.batch, family=binomial("logit"))
Titanic.logit.1

# Look at Null deviance compared to residual deviance to see the strength of the model and model
# and also the degrees of freedom used by the model.

# Use chisquared test to determine signifance
1-pchisq((949-631), df=(712-704))

# Lets look at an analysis of variance to 
# close to zero, so significant (within 2 significant digits)
anova(Titanic.logit.1, test="Chisq")

# Fare did not do so well, try fare per person - Fare.pp
Titanic.logit.2 <- glm(Fate ~ Sex + Class + Age + Family + Embarked + Fare.pp, 
                       data = train.batch, family=binomial("logit"))
Titanic.logit.2
anova(Titanic.logit.2, test="Chisq")

# Not really (the benefit to Fare may already be in passenger class)
Titanic.logit.3 <- glm(Fate ~ Sex + Class + Age + Family + Embarked, 
                       data = train.batch, family=binomial("logit"))
Titanic.logit.3
anova(Titanic.logit.3, test="Chisq")
