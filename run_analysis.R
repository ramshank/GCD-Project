
#Loading Activity Lables
activityLabels<-read.table(".\\UCI HAR Dataset\\activity_labels.txt",sep=" ")
names(activityLabels)<- c("activitylabel","activityname")


#Loading features
features<-read.table(".\\UCI HAR Dataset\\features.txt")
names(features)<-c("featurelabel","featurename")



##########################Loading test subjects and data

#Loading subject tests
subjectTest<-read.table(".\\UCI HAR Dataset\\test\\subject_test.txt")
names(subjectTest)<-c("subjectlabel")

#Loading X_test
TestSet<-read.table(".\\UCI HAR Dataset\\test\\X_test.txt")

names(TestSet)<-features$featurename

#Loading Y_Test
TestLabel<-read.table(".\\UCI HAR Dataset\\test\\Y_test.txt")
names(TestLabel)<-c("ActivityLabel")

#Loading Test Body accelereation data
TestbodyAccX<-read.table(".\\UCI HAR Dataset\\test\\Inertial Signals\\body_acc_x_test.txt")
TestbodyAccY<-read.table(".\\UCI HAR Dataset\\test\\Inertial Signals\\body_acc_y_test.txt")
TestbodyAccZ<-read.table(".\\UCI HAR Dataset\\test\\Inertial Signals\\body_acc_z_test.txt")

#Loading Test body gyro data
TestbodyGyroX<-read.table(".\\UCI HAR Dataset\\test\\Inertial Signals\\body_gyro_x_test.txt")
TestbodyGyroY<-read.table(".\\UCI HAR Dataset\\test\\Inertial Signals\\body_gyro_y_test.txt")
TestbodyGyroZ<-read.table(".\\UCI HAR Dataset\\test\\Inertial Signals\\body_gyro_z_test.txt")

#Loading Total Acc data
TesttotalAccX<-read.table(".\\UCI HAR Dataset\\test\\Inertial Signals\\total_acc_x_test.txt")
TesttotalAccY<-read.table(".\\UCI HAR Dataset\\test\\Inertial Signals\\total_acc_y_test.txt")
TesttotalAccZ<-read.table(".\\UCI HAR Dataset\\test\\Inertial Signals\\total_acc_z_test.txt")




#######################Prepare the Test Dataset

#set the column names for the Test Body Accelerator data
names(TestbodyAccX)<-paste("BodyAccX",1:128,sep="")
names(TestbodyAccY)<-paste("BodyAccY",1:128,sep="")
names(TestbodyAccZ)<-paste("BodyAccZ",1:128,sep="")

#Create the mean for each of the observations
TestbodyAccX$BodyAccXMean<-rowMeans(TestbodyAccX)
TestbodyAccY$BodyAccYMean<-rowMeans(TestbodyAccY)
TestbodyAccZ$BodyAccZMean<-rowMeans(TestbodyAccZ)

#create the SD for each of the observations
TestbodyAccX<-transform(TestbodyAccX, BodyAccSdX=apply(TestbodyAccX,1,sd,na.rm=TRUE))
TestbodyAccY<-transform(TestbodyAccY, BodyAccSdY=apply(TestbodyAccY,1,sd,na.rm=TRUE))
TestbodyAccZ<-transform(TestbodyAccZ, BodyAccSdZ=apply(TestbodyAccZ,1,sd,na.rm=TRUE))


#Set the column names of the Test Gyro Accelerator Data
names(TestbodyGyroX)<-paste("BodyGyroX",1:128,sep="")
names(TestbodyGyroY)<-paste("BodyGyroY",1:128,sep="")
names(TestbodyGyroZ)<-paste("BodyGyroZ",1:128,sep="")

#Create the mean for each of the observations
TestbodyGyroX$BodyGyroXMean<-rowMeans(TestbodyGyroX)
TestbodyGyroY$BodyGyroYMean<-rowMeans(TestbodyGyroY)
TestbodyGyroZ$BodyGyroZMean<-rowMeans(TestbodyGyroZ)

#create the SD for each of the observations
TestbodyGyroX<-transform(TestbodyGyroX, BodyGyroSdX=apply(TestbodyGyroX,1,sd,na.rm=TRUE))
TestbodyGyroY<-transform(TestbodyGyroY, BodyGyroSdY=apply(TestbodyGyroY,1,sd,na.rm=TRUE))
TestbodyGyroZ<-transform(TestbodyGyroZ, BodyGyroSdZ=apply(TestbodyGyroZ,1,sd,na.rm=TRUE))




#set the column names for the Test Total Accelerator data
names(TesttotalAccX)<-paste("totalAccX",1:128,sep="")
names(TesttotalAccY)<-paste("totalAccY",1:128,sep="")
names(TesttotalAccZ)<-paste("totalAccZ",1:128,sep="")

#Create the mean for each of the observations
TesttotalAccX$totalAccXMean<-rowMeans(TesttotalAccX)
TesttotalAccY$totalAccYMean<-rowMeans(TesttotalAccY)
TesttotalAccZ$totalAccZMean<-rowMeans(TesttotalAccZ)


#create the SD for each of the observations
TesttotalAccX<-transform(TesttotalAccX, totalAccSdX=apply(TesttotalAccX,1,sd,na.rm=TRUE))
TesttotalAccY<-transform(TesttotalAccY, totalAccSdY=apply(TesttotalAccY,1,sd,na.rm=TRUE))
TesttotalAccZ<-transform(TesttotalAccZ, totalAccSdZ=apply(TesttotalAccZ,1,sd,na.rm=TRUE))




####################Combine the observations into the master Test DF

MergedTestSet<-cbind(TestSet,"ActivityLabel"=TestLabel,subject=subjectTest,TestbodyAccX,TestbodyAccY,TestbodyAccZ,TestbodyGyroX,TestbodyGyroY,TestbodyGyroZ,TesttotalAccX,TesttotalAccY,TesttotalAccZ)








######################Loading Training subjects and data

#Loading subject training
subjectTrain<-read.table(".\\UCI HAR Dataset\\train\\subject_train.txt")
names(subjectTrain)<-c("subjectlabel")

#Loading X_test
TrainSet<-read.table(".\\UCI HAR Dataset\\train\\X_train.txt")

names(TrainSet)<-features$featurename


#Loading Y_Test
TrainLabel<-read.table(".\\UCI HAR Dataset\\train\\Y_train.txt")
names(TrainLabel)<-c("ActivityLabel")

#Loading Test Body accelereation data
TrainbodyAccX<-read.table(".\\UCI HAR Dataset\\train\\Inertial Signals\\body_acc_x_train.txt")
TrainbodyAccY<-read.table(".\\UCI HAR Dataset\\train\\Inertial Signals\\body_acc_y_train.txt")
TrainbodyAccZ<-read.table(".\\UCI HAR Dataset\\train\\Inertial Signals\\body_acc_z_train.txt")

#Loading Test body gyro data
TrainbodyGyroX<-read.table(".\\UCI HAR Dataset\\train\\Inertial Signals\\body_gyro_x_train.txt")
TrainbodyGyroY<-read.table(".\\UCI HAR Dataset\\train\\Inertial Signals\\body_gyro_y_train.txt")
TrainbodyGyroZ<-read.table(".\\UCI HAR Dataset\\train\\Inertial Signals\\body_gyro_z_train.txt")

#Loading Total Acc data
TraintotalAccX<-read.table(".\\UCI HAR Dataset\\train\\Inertial Signals\\total_acc_x_train.txt")
TraintotalAccY<-read.table(".\\UCI HAR Dataset\\train\\Inertial Signals\\total_acc_y_train.txt")
TraintotalAccZ<-read.table(".\\UCI HAR Dataset\\train\\Inertial Signals\\total_acc_z_train.txt")





#######################Prepare the Training Dataset

#set the column names for the Test Body Accelerator data
names(TrainbodyAccX)<-paste("BodyAccX",1:128,sep="")
names(TrainbodyAccY)<-paste("BodyAccY",1:128,sep="")
names(TrainbodyAccZ)<-paste("BodyAccZ",1:128,sep="")

#Create the mean for each of the observations
TrainbodyAccX$BodyAccXMean<-rowMeans(TrainbodyAccX)
TrainbodyAccY$BodyAccYMean<-rowMeans(TrainbodyAccY)
TrainbodyAccZ$BodyAccZMean<-rowMeans(TrainbodyAccZ)

#create the SD for each of the observations
TrainbodyAccX<-transform(TrainbodyAccX, BodyAccSdX=apply(TrainbodyAccX,1,sd,na.rm=TRUE))
TrainbodyAccY<-transform(TrainbodyAccY, BodyAccSdY=apply(TrainbodyAccY,1,sd,na.rm=TRUE))
TrainbodyAccZ<-transform(TrainbodyAccZ, BodyAccSdZ=apply(TrainbodyAccZ,1,sd,na.rm=TRUE))


#Set the column names of the Test Gyro Accelerator Data
names(TrainbodyGyroX)<-paste("BodyGyroX",1:128,sep="")
names(TrainbodyGyroY)<-paste("BodyGyroY",1:128,sep="")
names(TrainbodyGyroZ)<-paste("BodyGyroZ",1:128,sep="")

#Create the mean for each of the observations
TrainbodyGyroX$BodyGyroXMean<-rowMeans(TrainbodyGyroX)
TrainbodyGyroY$BodyGyroYMean<-rowMeans(TrainbodyGyroY)
TrainbodyGyroZ$BodyGyroZMean<-rowMeans(TrainbodyGyroZ)



#create the SD for each of the observations
TrainbodyGyroX<-transform(TrainbodyGyroX, BodyGyroSdX=apply(TrainbodyGyroX,1,sd,na.rm=TRUE))
TrainbodyGyroY<-transform(TrainbodyGyroY, BodyGyroSdY=apply(TrainbodyGyroY,1,sd,na.rm=TRUE))
TrainbodyGyroZ<-transform(TrainbodyGyroZ, BodyGyroSdZ=apply(TrainbodyGyroZ,1,sd,na.rm=TRUE))




#set the column names for the Test Total Accelerator data
names(TraintotalAccX)<-paste("totalAccX",1:128,sep="")
names(TraintotalAccY)<-paste("totalAccY",1:128,sep="")
names(TraintotalAccZ)<-paste("totalAccZ",1:128,sep="")

#Create the mean for each of the observations
TraintotalAccX$totalAccXMean<-rowMeans(TraintotalAccX)
TraintotalAccY$totalAccYMean<-rowMeans(TraintotalAccX)
TraintotalAccZ$totalAccZMean<-rowMeans(TraintotalAccZ)



#create the SD for each of the observations
TraintotalAccX<-transform(TraintotalAccX, totalAccSdX=apply(TraintotalAccX,1,sd,na.rm=TRUE))
TraintotalAccY<-transform(TraintotalAccY, totalAccSdY=apply(TraintotalAccY,1,sd,na.rm=TRUE))
TraintotalAccZ<-transform(TraintotalAccZ, totalAccSdZ=apply(TraintotalAccZ,1,sd,na.rm=TRUE))




####################Combine the observations into the master Test DF

MergedTrainSet<-cbind(TrainSet,"ActivityLabel"=TrainLabel,subject=subjectTrain,TrainbodyAccX,TrainbodyAccY,TrainbodyAccZ,TrainbodyGyroX,TrainbodyGyroY,TrainbodyGyroZ,TraintotalAccX,TraintotalAccY,TraintotalAccZ)


################# Combine the Test and training dataset

MergedData <- rbind(MergedTestSet,MergedTrainSet)

#joining with the activity table to get the descriptive name of the activity
MergedData<-merge(MergedData,activityLabels,by.x="ActivityLabel", by.y="activitylabel")


#extracting only the mean and SD
ActSummData<-MergedData[c(1,1734,563,692,693,822,823,952,953,1082,1083,1212,1213,1342,1343,1472,1473,1602,1603,1732,1733)]

#use split apply logic to summarize the data for  the average of each variable for each activity and each subject
pieces<-split(ActSummData,list(ActSummData$activityname,ActSummData$subjectlabel))
tidyData<-sapply(pieces,function(x) colMeans(x[,c(-1,-2,-3)]))

print(tidyData)

#write the tidy data into a csv file
write.table(tidyData,".\\UCI HAR Dataset\\tidydata.csv",sep=",")

