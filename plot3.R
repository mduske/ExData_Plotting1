##
## Course 4 - Peer Graded Assignment: Course Project 1
## Plot 3 - Sub-meterings

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

## Plot in 3 colors the Sub Metetrings
png(filename = "plot3.png", width = 480, height = 480)
plot(data$datetime, data$Sub_metering_1, ylab = "Energy sub metering", xlab = "", main = "", type = "l")
lines(data$datetime, data$Sub_metering_2, col = "red")
lines(data$datetime, data$Sub_metering_3, col = "blue")

legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()