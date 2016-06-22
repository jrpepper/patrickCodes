#patrick-codes.R
library(dplyr)
library(lubridate)
setwd("/Users/Ifrit/Documents/codes/patrickCodes/")


#import csv
mytable <- read.csv("./clients14.csv", stringsAsFactors = FALSE)

#get unique list of clients
clientList <- mytable$Client %>% unique() %>% as.character() %>% sort()

#for loop solution
for (x in 1:length(clientList)) {
  uclient <- clientList[x]
  subsetData <- subset(mytable, mytable$Client==uclient)
  
  #add new line at bottom with summary data
  sumRow <- rep("",dim(subsetData)[2])
  sumRow[2] <- sum(subsetData$Dur.Qty)
  sumRow[4] <- "Total Hours"
  
  subsetData <- rbind(subsetData, sumRow)
  
  #write new file using subsetData
  write.csv(subsetData, paste("./timelogs/",uclient,".csv", sep=""), row.names = FALSE)
}

#make list of file names from clientList
fileNameList <- gsub(" ","",clientList)
fileNameList <- gsub("\\.","",fileNameList)

write.csv(fileNameList, paste("./#fileNames.csv"), row.names = FALSE)

#solution usign apply()
#f1 <- function(client, y) {
#  subsetData <- subset(y, y$name==client)
#  write.csv(subsetData, file=paste("./",client,".csv", sep=""))
#}
#
#lapply(clientList, f1, y=clientData)