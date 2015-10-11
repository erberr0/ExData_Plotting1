plot2 <- function() {
  
  dat <- read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?",""))
  dat1<- subset(dat,Date %in% c("1/2/2007","2/2/2007"))
  
  dat1$Date <- as.Date(dat1$Date, format = "%d/%m/%Y") 
  dat1$timetemp <- paste(dat1$Date, dat1$Time)  
  dat1$Time <- strptime(dat1$timetemp, format = "%Y-%m-%d %H:%M:%S") 
  
  png('plot2.png', width = 480, height = 480)                                                                               
  plot(dat1$Global_active_power, type="l" ,ylab="Global Active Power (kilowatts)", axes=FALSE, ann=FALSE)
  
  axis(1, at=c(0,1500,2800), lab=c("Thu", "Fri","Sat"))
  axis(2, las=1, at=c(0,2,4,6))
  box()
  
  dev.off() 
  
}