plot1 <- function() {
  
  dat <- read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?",""))
  dat1<- subset(dat,Date %in% c("1/2/2007","2/2/2007"))
  
  dat1$Date <- as.Date(dat1$Date, format = "%d/%m/%Y") 
  dat1$timetemp <- paste(dat1$Date, dat1$Time)  
  dat1$Time <- strptime(dat1$timetemp, format = "%Y-%m-%d %H:%M:%S") 
   
  png('plot1.png', width = 480, height = 480)                                                                               
  hist(dat1$Global_active_power,main="Global Active Power", col= "red",xlim =c(0,6),ylim=c(0,1200),xlab="Global Active Power (kilowatts)", ylab="Frequency") 
  dev.off() 
  
}
