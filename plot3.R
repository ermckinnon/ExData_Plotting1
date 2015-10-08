# Plot3 - Time plot of sub metering
# Read data

library(dplyr)
raw <- read.table("household_power_consumption.txt", header = TRUE, sep=";",colClasses = "character")
energy1 <- filter(raw,Date=="1/2/2007" | Date=="2/2/2007")
combine <- data.frame(datetime=paste(energy1$Date,energy1$Time))
energy <- cbind(date = as.Date(combine$datetime,"%d/%m/%Y"), time = strptime(combine$datetime,"%d/%m/%Y %H:%M:%S"),energy1[,3:9])
rm(raw,energy1)

# Create Plot and save as plot3.png

png(filename="plot3.png",
    width = 480, height = 480)
plot(energy$time,as.numeric(energy$Sub_metering_1),type="l",
        ylab = "Energy sub metering", xlab="")
lines(energy$time,as.numeric(energy$Sub_metering_2),type="l",col = "red")
lines(energy$time,as.numeric(energy$Sub_metering_3),type="l",col = "blue")
legend("topright",lty=c(1,1,1), col=c("black","blue", "red"), legend =
         c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()


  



