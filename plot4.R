#The consumption.csv file was created using unix commands on the original file
#A couple of grep commands were used to select the data only relevant to the dates being analyzed
power<-read.csv("consumption.csv",sep=";",dec=".",na.strings="?",stringsAsFactors = FALSE)
Sys.setlocale("LC_TIME","en_US") #Required on non en_US systems to get the week days in english
power$dateTime<-strptime(paste(power$Date,power$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")
png("plot4.png",height=480,width=480)
par(mfrow=c(2,2)) # Needs to be specified after the device is open
plot(power$dateTime,power$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(power$dateTime,power$Global_active_power,type="l")
plot(power$dateTime,power$Voltage,type="n",xlab="datetime",ylab="Voltage")
lines(power$dateTime,power$Voltage,type="l")
with(power,plot(dateTime,pmax(Sub_metering_1,Sub_metering_2,Sub_metering_3),xlab="",ylab="Energy Submetering",type="n"))
#The pmax as second argument is there to get the a vertical scale that fits the dynamic range of the vectors
with(power,lines(dateTime,Sub_metering_2,type="l",col="red"))
with(power,lines(dateTime,Sub_metering_3,type="l",col="blue"))
with(power,lines(dateTime,Sub_metering_1,type="l",col="black"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
plot(power$dateTime,power$Global_reactive_power,type="n",xlab="datetime",ylab="Global_reactive_power")
lines(power$dateTime,power$Global_reactive_power,type="l")
dev.off()