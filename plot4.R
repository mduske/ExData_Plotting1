##
## Course 4 - Peer Graded Assignment: Course Project 1
## Plot 4 - Combined charts

require(tidyr)
require(dplyr)
require(lubridate)

## Read Data
columnClass <- rep("numeric", 9)
columnClass[1] = "character"
columnClass[2] = "character"
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = columnClass)

## Filter and transform data
data <- filter(data, Date %in% c("1/2/2007", "2/2/2007"))

## Inlcude a field with complete date/time
data$datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

## Combine 4 charts in one image
png(filename = "plot4.png", width = 480, height = 480)

##Enable 2x2 charts
par(mfrow = c(2, 2))

## Upper Left - Global Active Power
plot(data$datetime, data$Global_active_power, ylab = "Global Active Power", xlab = "", main = "", type = "l")

## Upper Right - Voltage
plot(data$datetime, data$Voltage, ylab = "Voltage", xlab = "datetime", main = "", type = "l")

## Lower Left - 3 sub meterings
plot(data$datetime, data$Sub_metering_1, ylab = "Energy sub metering", xlab = "", main = "", type = "l")
lines(data$datetime, data$Sub_metering_2, col = "red")
lines(data$datetime, data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, bty = "n", col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Lower Right - Global Reactive Power
plot(data$datetime, data$Global_reactive_power, ylab = "Global_reactive_power", xlab = "", main = "", type = "l")

dev.off()