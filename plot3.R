power<-read.csv("consumption.csv",sep=";",dec=".",na.strings="?",stringsAsFactors = FALSE)
par(mfrow=c(1,1))
Sys.setlocale("LC_TIME","en_US") #Required on non en_US systems to get the week days in english
power$dateTime<-strptime(paste(power$Date,power$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")
png("plot3.png",height=480,width=480)
with(power,plot(dateTime,pmax(Sub_metering_1,Sub_metering_2,Sub_metering_3),xlab="",ylab="Energy Submetering",type="n"))
#The pmax as second argument is there to get the a vertical scale that fits the dynamic range of the vectors
with(power,lines(dateTime,Sub_metering_2,type="l",col="red"))
with(power,lines(dateTime,Sub_metering_3,type="l",col="blue"))
with(power,lines(dateTime,Sub_metering_1,type="l",col="black"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
dev.off()