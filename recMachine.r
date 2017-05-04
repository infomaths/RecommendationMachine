library(readr)
### read data from csv file
mydata <- read_csv("~/R/RecommendationMachine/Output.csv")

### remove rows where the score is not a double
toremove <- !is.na(as.double(mydata$"review/score"[1:nrow(mydata)]))
mydata <- subset(mydata,toremove)
N <- nrow(mydata) # number of reviews

# keep only the columns we want to use
keep <- c("product/productId","review/userId","review/helpfulness","review/score")
mydata <- mydata[,keep]

### data study
# get number of movies
nmovies <- nrow(unique(mydata["product/productId"]))
# get number of users
nusers <- nrow(unique(mydata["review/userId"]))
# get approximate means
mean_reviewspermovie = N/nmovies
mean_reviewsperuser = N/nusers

### function to get % out of helpfulness
percentage <- function(str)
{
  nums <- unlist(strsplit(str,"[\\/]"))
  a <- as.double(nums[1])
  n <- as.double(nums[2])
  if (n == 0){
    1
  }else{
    a/n
  }
}

### function to get the score according to the helpfulness
weightedscore <- function(score,helpf){
  as.double(score)*percentage(helpf)
}

# change score to be according to helpfulness
for(i in 1:N){
  mydata$"review/score"[i] <- weightedscore(mydata$"review/score"[i],mydata$"review/helpfulness"[i])
}

# now we dont need helpfulness anymore
mydata <- mydata[,!(names(mydata) %in% c("review/helpfulness"))]

