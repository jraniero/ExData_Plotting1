#The consumption.csv file was created using unix commands on the original file
#A couple of grep commands were used to select the data only relevant to the dates being analyzed
power<-read.csv("consumption.csv",sep=";",dec=".",na.strings="?",stringsAsFactors = FALSE)
par(mfrow=c(1,1))
Sys.setlocale("LC_TIME","en_US") #Required on non en_US systems to get the week days in english
power$dateTime<-strptime(paste(power$Date,power$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")
png("plot2.png",height=480,width=480)
plot(power$dateTime,power$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(power$dateTime,power$Global_active_power,type="l")
dev.off()