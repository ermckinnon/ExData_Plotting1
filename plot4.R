# Plot4 - Multi Plots
# Read data

library(dplyr)
raw <- read.table("household_power_consumption.txt", header = TRUE, sep=";",colClasses = "character")
energy1 <- filter(raw,Date=="1/2/2007" | Date=="2/2/2007")
combine <- data.frame(datetime=paste(energy1$Date,energy1$Time))
energy <- cbind(date = as.Date(combine$datetime,"%d/%m/%Y"), time = strptime(combine$datetime,"%d/%m/%Y %H:%M:%S"),energy1[,3:9])
rm(raw,energy1)

# Create Plot and save as plot4.png

png(filename="plot4.png",
    width = 480, height = 480)

par(mfrow = c(2, 2))
with(energy, {

  plot(time,as.numeric(Global_active_power),type="l",
       ylab = "Global Active Power", xlab="")  
  
  plot(time,as.numeric(Voltage),type="l",
       ylab = "Voltage", xlab="datetime")  
  
  
  plot(time,as.numeric(Sub_metering_1),type="l",
       ylab = "Energy sub metering", xlab="")
  lines(time,as.numeric(Sub_metering_2),type="l",col = "red")
  lines(time,as.numeric(Sub_metering_3),type="l",col = "blue")
  legend("topright",lty=c(1,1,1), col=c("black","blue", "red"), legend =
           c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),  bty="n")
  
  plot(time,as.numeric(Global_reactive_power),type="l",
       ylab = "Global_reactive_power", xlab="datetime")
  
  })

dev.off()



