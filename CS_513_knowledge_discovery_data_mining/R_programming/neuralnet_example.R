
#  Course          : Data Mining
#  First Name      : Khasha
#  Last Name       : Dehnad
#  Id              : 12345
#  purpose         : apply ann to square root data

## Step 0 clean up!!!


dev.off()
rm(list=ls())
#Generate 50 random numbers uniformly distributed between 0 and 100
#And store them as a dataframe
traininginput<- runif(50, min=0, max=100)
View(traininginput)
#traininginput <-  as.data.frame(runif(50, min=0, max=100))
trainingoutput <- sqrt(traininginput)

#Column bind the data into one variable
trainingdata <- cbind(traininginput,trainingoutput)
trainingdata[1:20,]

colnames(trainingdata) <- c("Input","Output")
install.packages("neuralnet")
library("neuralnet")
?neuralnet()
#Train the neural network
#Going to have 10 hidden layers
#Threshold is a numeric value specifying the threshold for the partial
#derivatives of the error function as stopping criteria.
net.sqrt <- neuralnet(Output~Input,trainingdata, hidden=10, threshold=0.01) # trial and errors -> hidden and threshhold 
# thumb rule to chose :
print(net.sqrt)

#Plot the neural network
plot(net.sqrt)

#Test the neural network on some training data
testdata <- as.data.frame((1:10)^2) #Generate some squared numbers
net.results <- compute(net.sqrt, testdata) #Run them through the neural network

#Lets see what properties net.sqrt has
str(net.results)
#Lets see the results
print(net.results$net.result)

#Lets display a better version of the results
cleanoutput <- cbind(testdata,sqrt(testdata),
                     as.data.frame(net.results$net.result))
colnames(cleanoutput) <- c("Input","Expected Output","Neural Net Output")
print(cleanoutput)

# perceptron : many hidden layers 
