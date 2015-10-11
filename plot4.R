plot4 <- function() {
  
  dat <- read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?",""))
  dat1<- subset(dat,Date %in% c("1/2/2007","2/2/2007"))
  
  dat1$Date <- as.Date(dat1$Date, format = "%d/%m/%Y") 
  dat1$timetemp <- paste(dat1$Date, dat1$Time)  
  dat1$Time <- strptime(dat1$timetemp, format = "%Y-%m-%d %H: %M:%S") 
  
  png('plot4.png', width = 480, height = 480) 
  par(mfcol=c(2,2))
  
  plot(dat1$Global_active_power, type="l" ,ylab="Global Active Power (kilowatts)", axes=FALSE)
  axis(1, at=c(0,1500,2800), lab=c("Thu", "Fri","Sat"))
  axis(2, las=1, at=c(0,2,4,6))
  box()
  
  
  
  plot(dat1$Sub_metering_1, type="l" ,col="black",ylab="Energy sub metering", axes=FALSE, ann=FALSE) 
  lines(dat1$Sub_metering_2, type="l",col="red") 
  lines(dat1$Sub_metering_3, type="l",col="blue") 
  legend("topright",col=c("black","red","blue"),lty=1, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),box.lwd=0, cex = .8) 
  axis(1, at=c(0,1500,2800), lab=c("Thu", "Fri","Sat"))
  axis(2, las=1, at=c(0,10,20,30))
  box()
  
  plot(dat1$Voltage, type="l", xlab="datetime", ylab="Voltage", axes=FALSE)
  axis(1, at=c(0,1500,2800), lab=c("Thu", "Fri","Sat"))
  axis(2, las=1, at=c(234,238,242,246))
  box()
  
  plot(dat1$Global_reactive_power, type="l" ,xlab="datetime",ylab="Global_reactive_power (kilowatts)", axes=FALSE)
  axis(1, at=c(0,1500,2800), lab=c("Thu", "Fri","Sat"))
  axis(2, las=1, at=c(0,0.1,0.2,0.3,0.4,0.5))
  box()
  
  dev.off() 
  
}