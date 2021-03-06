#Load required packages
library(ggplot2)
library(dplyr)
library(readr)
library(tidyr)


#Data import
train <- read_csv("train.csv", col_names = TRUE, na = c("", "NA"))
test <- read_csv("test.csv", col_names=TRUE, na = c("", "NA"))

#Combine training set and test set into a single data file
passengers <- bind_rows(train, test)

######Exploration######

#Sex and Survivorship
ggplot(passengers, mapping = aes(Sex, Survived)) +
  geom_count(aes(color = Sex, stroke = Sex)) +

ggplot(passengers, aes(Sex, Survived, fill = Sex, ylab("Survivor Count"))) +
  geom_bar(stat = "identity")

#Embarked

passengers$Embarked <- factor(passengers$Embarked, levels = c("S","C","Q"))

ggplot(na.omit(passengers), aes(Embarked, fill = Embarked)) +
  geom_bar()


ggplot(passengers) +
  geom_bar(aes(Survived, fill = Embarked), position = "dodge", width = .75)


#Create data table of survival rate at each factor of passengers$Embarked
mean_surv <- aggregate(
  Survived ~ Embarked, 
  data = passengers, 
  FUN = function(passengers) c(mean=mean(passengers), 
  count = length(passengers)
  )
)

aggdata <-aggregate(passengers, by=list(passengers$Embarked), 
                    FUN=mean, na.rm=TRUE)

ggplot(aggdata, aes(Group.1, Survived, fill = Group.1, xlab("Embarked"))) +
  geom_bar(stat = "identity")


#####FEATURE 1: Title and survivability#######
data <- separate(passengers, Name, sep = )
data$title <- 
