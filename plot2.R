##
## Course 4 - Peer Graded Assignment: Course Project 1
## Plot 2 - Global Active Power by weekday

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

## Plot a Global Active Power by weekday
png(filename = "plot2.png", width = 480, height = 480)
plot(data$datetime, data$Global_active_power, ylab = "Global Active Power (killowatts)", xlab = "", main = "", type = "l")
dev.off()