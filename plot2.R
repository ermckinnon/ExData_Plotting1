# Plot2 - Time plot of Global Active Energy
# Read data

library(dplyr)
raw <- read.table("household_power_consumption.txt", header = TRUE, sep=";",colClasses = "character")
energy1 <- filter(raw,Date=="1/2/2007" | Date=="2/2/2007")
combine <- data.frame(datetime=paste(energy1$Date,energy1$Time))
energy <- cbind(date = as.Date(combine$datetime,"%d/%m/%Y"), time = strptime(combine$datetime,"%d/%m/%Y %H:%M:%S"),energy1[,3:9])
rm(raw,energy1)

# Create Plot and save as plot2.png

png(filename="plot2.png",
    width = 480, height = 480)

plot(energy$time,as.numeric(energy$Global_active_power),type="l",
        ylab = "Global Active Power (kilowatts)", xlab="")

dev.off()  



