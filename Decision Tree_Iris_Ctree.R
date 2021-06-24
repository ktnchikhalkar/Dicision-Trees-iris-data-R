#Installing the necessary packages
install.packages("multcomp")
library(multcomp)
install.packages("party")
No
library(party)

#Loading dataset
str(iris)

#Setting the seed to maintain the same results
set.seed(134) 

#Splitting the dataset for training and testing
df <- createDataPartition(iris$Species,p=0.7,list=F)
training <- iris[df,]
testing <- iris[df,]

#Building the model
model <- ctree(Species~.,data=training)

#Generate the summary for the model
summary(model)

#Predicting for the testing dataset
pred <- predict(model,testing[-5])

#Checking the accuracy of the model
a <- table(testing$Species,pred)
sum(diag(a))/sum(a)

#Visualizing the model
plot(model)