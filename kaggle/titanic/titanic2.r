library('caret')
library('kimisc')
library('ggplot2')
library('rpart')
library('randomForest')
library('e1071')
passengerTrainingData = read.csv("train.csv",sep="\t")
fol <- formula(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked )
model <- rpart(fol, method="class", data= passengerTrainingData)
#model <- randomForest( fol ,data = passengerTrainingData)
#model <- svm(fol,data=passengerTrainingData)
#impurity <- importance(model)
#print(model)
#quit()
#predictions <- predict(model,data=testData,type="class")
passengerTestData = read.csv("test.csv",sep=",")
predictions <- predict(model,passengerTestData,type="class")
anticipations <- as.data.frame(predictions)
passengerTestData$Survived <- anticipations[,1]
prediction <- data.frame(PassengerId = passengerTestData$PassengerId, Survived = passengerTestData$Survived)
write.csv(prediction, file = "prediction2.csv", row.names = FALSE)
quit()
accuracy <- sum(passengerTrainingData$Survived == anticipations[,1])/nrow(passengerTrainingData)
accuracy
quit()
passengerTestData$Survived <- rep(0,418)
passengerTestData$Survived[passengerTestData$Sex == 'female'] <-1
prediction <- data.frame(PassengerId = passengerTestData$PassengerId, Survived = passengerTestData$Survived)
write.csv(prediction, file = "prediction.csv", row.names = FALSE)
#summary(passengerTrainingData)
#hist(passengerTrainingData$Age);
#d <- ggplot(passengerTrainingData, aes(x = Age, y = Survived));
#d <- d + geom_line()
#d
quit()


fol <- formula(Survived ~ )
#model <- rpart(fol, method="class", data=training)
model <- randomForest(fol,data=training)
impurity <- importance(model)
print(impurity)
#predictions <- predict(model,data=testData,type="class")
predictions <- predict(model,data=training,type="class")
anticipations <- as.data.frame(predictions)
accuracy <- sum(testData$pop == anticipations[,1])/nrow(testData)
accuracy
quit()
print(model)
#length(training$pop)
#length(testData$pop)
quit()
predictions

class(fol)
print(fol)
quit()
#d <- ggplot(ocean, aes(x = pe, y = chl_small,colour = pop));

#d <- d + geom_line()

#d
