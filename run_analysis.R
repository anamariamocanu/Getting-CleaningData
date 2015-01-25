##set the working directory
setwd("C:/Users/amoca_000/datasciencecoursera/Getting and Cleaning Data/UCI HAR Dataset")

##set the path of the train Set file
trainSet <- "train/X_train.txt"
trainLabel <-"train/y_train.txt"
subjectTrain <- "train/subject_train.txt"

##set the path of the test set file
testSet <- "test/X_test.txt"
testLabel <-"test/y_test.txt"
subjectTest <- "test/subject_test.txt"


##read all the features
features<-read.table("features.txt")["V2"]

##read all activitylabels
activity_labels<-read.table("activity_labels.txt")["V2"]

##read the train set and define headers for Labels and Subject
train_set <- read.table(trainSet)

train_label <- read.table(trainLabel)
names(train_label) <-"Label"

subject_train <-read.table(subjectTrain)
names(subject_train)<-"Subjects"

##give names to the train set variables from the features factor
names(train_set) <-features$V2

##read the test set and define headers for Labels and Subject
test_set <- read.table(testSet)
test_label <- read.table(testLabel)
names(test_label) <-"Label"

subject_test <-read.table(subjectTest)
names(subject_test)<-"Subjects"

##give names to the test variables from the features factor
names(test_set) <-features$V2

##Merge the 2 data sets
mergedData <- rbind(train_set,test_set)

##Find mean and sd in the label of the features
mean_std <-grep("mean|std", features$V2)


##include the complete columns with these data
mean_std_data <-colnames(test_set)[mean_std]
train_subset <-cbind(subject_train,train_label,subset(train_set, select = mean_std_data))
test_subset <-cbind(subject_test,test_label,subset(test_set, select = mean_std_data))

##Take the subset of the mergedData which includes only mean and sdev measurements
mergedDataSubset <-rbind(train_subset, test_subset) 

##Create an activity label to match the Label in the dataset
mergedDataSubset$Activity <-activity_labels[mergedDataSubset$Label,]

##create the average of each variable for each activity and label
mergedComplete <-aggregate(mergedDataSubset[,3:ncol(mergedDataSubset)-1], list(subject
                =mergedDataSubset$Subjects,Activity=mergedDataSubset$Activity), mean )

##create tidy data
write.table(mergedComplete, file="./tidydata.txt", sep="\t", row.names=FALSE)



