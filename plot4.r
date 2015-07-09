# reading data
data <- read.table("household_power_consumption.txt", header=T,  sep=";", na.strings="?")

# formatting date-time
library(dplyr)
data[,"Date"] <- as.Date(data[, "Date"], "%d/%m/%Y")
data <- mutate(data, "date.time"=as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %T"))
subset <- filter(data, Date=="2007-02-01" | Date=="2007-02-02")
#--------------------------------------------------------------------------------------------

png("plot4.png")
par(mfcol= c(2,2))
plot(subset$date.time, subset$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
plot(subset$date.time, subset$Sub_metering_1, type="l", ylab="Energy sub meeting", xlab="")
lines(subset$date.time, subset$Sub_metering_2, col="red")
lines(subset$date.time, subset$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"), bty="n")
plot(subset$date.time, subset$Voltage, type="l", ylab="Voltage", xlab="datetime")
plot(subset$date.time, subset$Global_reactive_power, type="l", xlab="datetime")
dev.off()