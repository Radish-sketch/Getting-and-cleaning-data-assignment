


# Set working directory and create  folder "data"

getwd()

setwd("...")



# Download and unzip the files

fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
download.file(fileUrl,destfile = ".\\Sumsung.zip",mode='wb',cacheOK = FALSE)

unzip("Sumsung.zip",exdir=getwd())


# Read the data set,a 561-feature vector with time and frequency domain variables

features<-read.table(".\\UCI HAR Dataset\\features.txt")

testSet<-read.table(".\\UCI HAR Dataset\\test\\X_test.txt")
testLabels<-read.table(".\\UCI HAR Dataset\\test\\y_test.txt")

#table(testLabels)

trainingSet<-read.table(".\\UCI HAR Dataset\\train\\X_train.txt")
trainingLabels<-read.table(".\\UCI HAR Dataset\\train\\y_train.txt")

#table(trainingLabels)

activity<-read.table(".\\UCI HAR Dataset\\activity_labels.txt")

subjectTrain<-read.table(".\\UCI HAR Dataset\\train\\subject_train.txt")
table(subjectTrain)

subjectTest<-read.table(".\\UCI HAR Dataset\\test\\subject_test.txt")
table(subjectTest)


# lable the training and test data sets with features
names(trainingSet)<-features[,2]
names(testSet)<-features[,2]



# link with activities and volunteers
testSet1<-data.frame(activity=testLabels[,1],volunteer=subjectTest[,1],testSet)
trainingSet1<-data.frame(activity=trainingLabels[,1],volunteer=subjectTrain[,1],trainingSet)

# merge by activity

mergedData<-merge(testSet1,trainingSet1,by=c("activity","volunteer"),all=TRUE)


#2. only keep the variables with mean or std, 172 columns left
mergedData<-mergedData[,grepl("activity|volunteer|[Mm]ean|[Ss]td",names(mergedData))]

#3. Uses descriptive activity names to name the activities in the data set

mergedData[["activity"]]<-activity[match(mergedData[["activity"]],activity[["V1"]]),'V2']


#names(mergedData)

#5. calculate the average of each variable for each activity and each subject. 172 variables, 6 activities, 30 volunteers/subjects
# the volunteer either participate in training or testing

table(mergedData$volunteer)

# group by activity
data<-split(mergedData,mergedData$activity)

#initialize 
newData<-data.frame()

#calculated mean for each activity and subject

for (i in 1:length(data)){
    subData<-split(data[[i]],data[[i]]$volunteer)
    
    for (j in 1:length(subData)) {
        temp<-sapply(subData[[j]],mean,na.rm=TRUE)
        temp[1]<-subData[[j]]$activity[1]
        newData<-rbind(newData,temp)
    }
    
}

names(newData)<-names(mergedData)
#change the name "volunteer" back to "object"
names(newData)[2]<-"object"

# 6 output data to .txt file

write.table(newData, file = "newData.txt", sep = "\t",
            row.names = FALSE)