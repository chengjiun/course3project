
#read data sets
dir <- 'UCI HAR Dataset/'
nrows=-1
labelFeatures <- read.table(paste(dir,'features.txt',sep="")
                            ,col.names=c('id','features'))
labelActivities <- read.table(paste(dir,'activity_labels.txt',sep="")
                              ,col.names=c('id','activities'))
testData<-read.table(paste(dir,'test/','X_test.txt',sep='')
                     ,col.names = labelFeatures$features,nrows=nrows)
testAct<-read.table(paste(dir,'test/','y_test.txt',sep=''),col.names='id',nrows=nrows)
testSub<-read.table(paste(dir,'test/','subject_test.txt',sep=''),col.names='sub',nrows=nrows)
trainData<-read.table(paste(dir,'train/','X_train.txt',sep=''),nrows=nrows
                      ,col.names = labelFeatures$features)
trainAct<-read.table(paste(dir,'train/','y_train.txt',sep=''),col.names='id',nrows=nrows)
trainSub<-read.table(paste(dir,'train/','subject_train.txt',sep=''),col.names='sub',nrows=nrows)

# merge test and train data set
mergedData<-rbind(testData,trainData)
mergedAct<-rbind(testAct,trainAct)
mergedSub<-rbind(testSub,trainSub)

# only keep the columns of average and stdev of the measurements 
# which means the features including pattern of "-mean()" or "-std()"
indMean <- grep('-mean()',labelFeatures$features,value=FALSE,fixed=TRUE)
indStd<- grep('-std()',labelFeatures$features,value=FALSE,fixed=TRUE)
cutmergedData <- mergedData[,c(indMean,indStd)]

# add two columns of the subject ID and activities
# the name of activities are regularized to all lower case and no underscore
labelActivities$activities <- tolower(sub('_','',labelActivities$activities,
                                          fixed=TRUE))
activities <- labelActivities$activities[strtoi(mergedAct$id)]
subjects <- mergedSub$sub

# calculate the mean using aggregate for each subject and activity
meanMeasures<-aggregate(x=cutmergedData,by=list(activities,subjects)
                        ,FUN=mean)
# assign a better name for the group
names(meanMeasures)[1:2]<-c('activities','subjectId')

# write out the file
write.csv(meanMeasures,'meanMeasures.csv')
