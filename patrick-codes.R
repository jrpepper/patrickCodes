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
  subsetData <- subset(mytable, mytable$Client==clientList)
  write.csv(subsetData, paste("./timelogs/",uclient,".csv", sep=""))
}

#solution usign apply()
#f1 <- function(client, y) {
#  subsetData <- subset(y, y$name==client)
#  write.csv(subsetData, file=paste("./",client,".csv", sep=""))
#}
#
#lapply(clientList, f1, y=clientData)