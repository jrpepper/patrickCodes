#patrick-codes.R
library(dplyr)
library(lubridate)

#make fake data
#n <- 30
#clientData <- data.frame(name = sample(c("josh", "patrick", "obama", "trump", "grinch", "hippo"), n, replace=TRUE), recordId = 1:n, code = sample(LETTERS,n, replace=TRUE), value=sample(10:1000, n, replace=TRUE))

#get unique list of clients
#clientList <- clientData$name %>% unique() %>% as.character()

#import csv


#for loop solution
for (x in 1:length(clientList)) {
  client <- clientList[x]
  subsetData <- subset(clientData, clientData$name==client)
  
  clientData[clientData$name==client,c("name","value")]
  
  write.csv(subsetData, paste("./timelogs/",client,".csv", sep=""))
}

#solution usign apply()
f1 <- function(client, y) {
  subsetData <- subset(y, y$name==client)
  write.csv(subsetData, file=paste("./",client,".csv", sep=""))
}

lapply(clientList, f1, y=clientData)