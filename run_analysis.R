## PART ONE ##

# Read subject files from test and train folders
subject.test <- read.table("test/subject_test.txt")
subject.train <- read.table("train/subject_train.txt")

# Read X files from test and train folders
X.test <- read.table("test/X_test.txt")
X.train <- read.table("train/X_train.txt")

# Read y files from test and train folders
y.test <- read.table("test/y_test.txt")
y.train <- read.table("train/y_train.txt")

# rbind subject files together (train first) and assign name to column
subject <- rbind(subject.train, subject.test)
colnames(subject) <- c("subject")

# Read features.txt (for labels)
features <- read.table("features.txt")

# rbind y files together (train first) and assign name to column
y <- rbind(y.train, y.test)
colnames(y) <- c("activity")

# rbind X files togheter (train first)
X <- rbind(X.train, X.test)

## PART TWO ##

# Extract necessary columns from X (Means and Standard Deviations)
extract <- c(1:6,41:46,81:86,121:126,161:166,201,202,214,215,227,228,240,241,253,254,266:271,345:350,424:429,503,504,516,517,529,530,542,543)
subset.X <- X[extract]

## PART FOUR ##

# Extract labels from features variable and label extracted columns from X
features <- features[,2]
featurelabels <- features[extract]
colnames(subset.X) <- featurelabels

## PART THREE ##

# Replace code numbers in y with understandable labels, as described by activity_labels.txt
y$activity[y$activity == "1"] <- "WALKING"
y$activity[y$activity == "2"] <- "WALKING_UPSTAIRS"
y$activity[y$activity == "3"] <- "WALKING_DOWNSTAIRS"
y$activity[y$activity == "4"] <- "SITTING"
y$activity[y$activity == "5"] <- "STANDING"
y$activity[y$activity == "6"] <- "LAYING"

## PART ONE, CONTINUED (Merging the files completely into one dataset) ##

# cbind the subject, activity and data together to create the dataset
data <- cbind(subject,y, subset.X)

# Store the tidy dataset in a new text file (1st dataset)
write.table(data, "tidydataset1.txt")

## PART FIVE ##

# Use a for loop to calculate the averages and bind them to a new dataset in
# order of subject, then activity
final.data <- data.frame()
final.prefix <- data.frame()

for(i in 1:30){
  
  current.subject <- data[data$subject == i,]
  
    # WALKING
    walking <- current.subject[current.subject$activity == "WALKING",]
    walking <- walking[,3:68]
    walking.means <- as.data.frame(lapply(walking, mean))
    walking.prefix <- cbind(i, c("WALKING"))
    final.prefix <- rbind(final.prefix, walking.prefix)
    final.data <- rbind(final.data, walking.means)
  
    # WALKING UPSTAIRS
    walking_upstairs <- current.subject[current.subject$activity == "WALKING_UPSTAIRS",]
    walking_upstairs <- walking_upstairs[,3:68]
    walking_upstairs.means <- as.data.frame(lapply(walking_upstairs, mean))
    walking_upstairs.prefix <- cbind(i, c("WALKING_UPSTAIRS"))
    final.prefix <- rbind(final.prefix, walking_upstairs.prefix)
    final.data <- rbind(final.data, walking_upstairs.means)
  
    # WALKING_DOWNSTAIRS
    walking_downstairs <- current.subject[current.subject$activity == "WALKING_DOWNSTAIRS",]
    walking_downstairs <- walking_downstairs[,3:68]
    walking_downstairs.means <- as.data.frame(lapply(walking_downstairs, mean))
    walking_downstairs.prefix <- cbind(i, c("WALKING_DOWNSTAIRS"))
    final.prefix <- rbind(final.prefix, walking_downstairs.prefix)
    final.data <- rbind(final.data, walking_downstairs.means)
    
    # SITTING 
    sitting <- current.subject[current.subject$activity == "SITTING",]
    sitting <- sitting[,3:68]
    sitting.means <- as.data.frame(lapply(sitting, mean))
    sitting.prefix <- cbind(i, c("SITTING"))
    final.prefix <- rbind(final.prefix, sitting.prefix)
    final.data <- rbind(final.data, sitting.means)
    
    # STANDING
    standing <- current.subject[current.subject$activity == "STANDING",]
    standing <- standing[,3:68]
    standing.means <- as.data.frame(lapply(standing, mean))
    standing.prefix <- cbind(i, c("STANDING"))
    final.prefix <- rbind(final.prefix, standing.prefix)
    final.data <- rbind(final.data, standing.means)
  
    # LAYING
    laying <- current.subject[current.subject$activity == "LAYING",]
    laying <- laying[,3:68]
    laying.means <- as.data.frame(lapply(laying, mean))
    laying.prefix <- cbind(i, c("LAYING"))
    final.prefix <- rbind(final.prefix, laying.prefix)
    final.data <- rbind(final.data, laying.means)

}

final.data <- cbind(final.prefix, final.data)
colnames(final.data) <- colnames(data)

# Finally, write the second dataset to file
# (This is the uploaded dataset)
write.table(final.data,"tidydataset2.txt")