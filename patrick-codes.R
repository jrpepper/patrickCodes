#patrick-codes.R
library(dplyr)
library(lubridate)
setwd("/Users/Ifrit/Documents/codes/patrickCodes/")

#import csv
mytable <- read.csv("./clients.csv", stringsAsFactors = FALSE)

#get unique list of clients
clientList <- mytable$Client %>% unique() %>% as.character() %>% sort()

#make list of file names from clientList
fileNameList <- gsub(" ","",clientList)
fileNameList <- gsub("\\.","",fileNameList)
fileNameList <- gsub("-","",fileNameList)

fdate <- paste(year(today()),"0",month(today())-1, sep="")

for (x in 1:length(fileNameList)) {
  fileNameList[x] <- paste(fileNameList[x],fdate, sep="") 
}

#for loop solution
for (x in 1:length(clientList)) {
  uclient <- clientList[x]
  subsetData <- subset(mytable, mytable$Client==uclient)
  
  #add new line at bottom with summary data w/ line space
  sumRow <- rep("",dim(subsetData)[2])
  sumRow[2] <- sum(subsetData[2])
  sumRow[1] <- "Total Hours"
  
  addRow <- rep("",dim(subsetData)[2])
  
  subsetData <- rbind(subsetData, addRow, sumRow)
  
  #get filename
  fclient <- gsub("\\ ","",uclient)
  fclient <- gsub("\\.","",fclient)
  fclient <- gsub("\\-","",fclient)
  fclient <- paste(fclient,fdate,sep="")
  
  #write new file using subsetData
  write.csv(subsetData, paste("./timelogs/",fclient,".csv", sep=""), row.names = FALSE)
}

write.csv(data.frame(fileNameList, clientList),
          paste("./timelogs/#fileNames.csv"),
          row.names = FALSE)