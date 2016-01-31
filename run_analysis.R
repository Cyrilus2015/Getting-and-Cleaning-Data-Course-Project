# download the datafiles

fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!file.exists("./data")){dir.create("./data")}

# works in Win-7(32)
# in the other systems maybe need the third parameter method="curl"
download.file(fileUrl,destfile="./data/Data.zip")

unzip(zipfile="./data/Data.zip",exdir="./data")


# pathes to files

pth <- "./data/UCI HAR Dataset/"
pth_test <- paste0(pth,"Test/") 
pth_train <- paste0(pth,"Train/") 

# read the files and get data.frames

set_test <- read.table(paste0(pth_test,"X_test.txt"))
set_train <- read.table(paste0(pth_train,"X_train.txt"))
labels_test <- read.table(paste0(pth_test,"y_test.txt"))
labels_train <- read.table(paste0(pth_train,"y_train.txt"))
subjects_test <- read.table(paste0(pth_test,"subject_test.txt"))
subjects_train <- read.table(paste0(pth_train,"subject_train.txt"))

# Merge data.frames

set <- rbind(set_test,set_train)
labels <- rbind(labels_test,labels_train)
subjects <- rbind(subjects_test,subjects_train)

# get vector of the variable names

vnames <- read.table(paste0(pth,"features.txt"))$V2

# get numbers of mean() and std() names

nmb_msnames <- grep("(mean|std)\\(\\)",vnames)

# retain only mean & std variables in the main data.frame

msset <- set[,nmb_msnames]

# retain only mean & std names of the variables                        

msnames <- vnames[nmb_msnames]

# get the vector of the activities with the real activity names

#names(labels) <- c("Id")
act_names <- read.table(paste0(pth,"activity_labels.txt"), header=FALSE, as.is=TRUE)
labels$id <- 1:nrow(labels)
w <- merge(labels,act_names)
w <- w[order(w$id),]
activities <- w[,3]

# correct the variable names to more descriptive (based on fetures_info.txt)
# supposed  the repeat BodyBody is a mistake

msnames <- gsub("^t","time",msnames)
msnames <- gsub("^f","frequency",msnames)
msnames <- gsub("Acc","Acceleration",msnames)
msnames <- gsub("Gyro","AngularVelocity",msnames)
msnames <- gsub("Mag","Magnitude",msnames)
msnames <- gsub("BodyBody","Body",msnames)
msnames <- gsub("mean\\(\\)","MeanValue",msnames)
msnames <- gsub("std\\(\\)","StandardDeviation",msnames)
msnames <- gsub("-","_",msnames)

# costract final dataset with new names

setdata <- cbind(subjects, activities, msset)
names(setdata) <- c("Subject","Activity",msnames)

# create and write new data in accordance with the task

newtidy <- aggregate(setdata[,-c(1,2)],list(Subject=setdata$Subject,Activity=setdata$Activity),mean)

newtidy <- newtidy[order(newtidy$Subject,newtidy$Activity),]

# write this

write.table(newtidy,file="newtidy.txt", row.names = FALSE, quote = FALSE)
