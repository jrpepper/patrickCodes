#patrick-codes.R

#make fake data
n <- 30
clientData <- data.frame(name = sample(c("josh", "patrick", "obama", "trump", "grinch", "hippo"), n, replace=TRUE), recordId = 1:n, code = sample(LETTERS,n, replace=TRUE), value=sample(10:1000, n, replace=TRUE))

#get unique list of clients
clientList <- unique(clientData$name) %>% as.character()

#for loop solution
for (x in 1:length(clientList)) {
  client <- clientList[x]
  subsetData <- subset(clientData, clientData$name==client)
  write.csv(subsetData, paste("./",client,".csv", sep=""))
}