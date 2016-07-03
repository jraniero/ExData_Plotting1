#The consumption.csv file was created using unix commands on the original file
#A couple of grep commands were used to select the data only relevant to the dates being analyzed
power<-read.csv("consumption.csv",sep=";",dec=".",na.strings="?",stringsAsFactors = FALSE)
par(mfrow=c(1,1))
png("plot1.png",height=480,width=480)
hist(power$Global_active_power,col="red",main="Global Active Power",xlab ="Global Active Power (kilowatts)")
dev.off()