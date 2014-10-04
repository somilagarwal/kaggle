library('caret')
library('kimisc')
library('ggplot2')
library('rpart')
library('randomForest')
passengerTrainingData = read.csv("train.csv",sep=",")
passengerTestData = read.csv("test.csv",sep=",")
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
