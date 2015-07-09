# reading data
data <- read.table("household_power_consumption.txt", header=T,  sep=";", na.strings="?")

# formatting date-time
library(dplyr)
data[,"Date"] <- as.Date(data[, "Date"], "%d/%m/%Y")
data <- mutate(data, "date.time"=as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %T"))
subset <- filter(data, Date=="2007-02-01" | Date=="2007-02-02")
#--------------------------------------------------------------------------------------------


## Making plot1
#initialise file device (480x480 pixels is default)
png("plot1.png")
hist(subset$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()


