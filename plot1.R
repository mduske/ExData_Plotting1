##
## Course 4 - Peer Graded Assignment: Course Project 1
## Plot 1 - A simple histogram of Global Active Power

require(tidyr)
require(dplyr)

## Read Data
columnClass <- rep("numeric", 9)
columnClass[1] = "character"
columnClass[2] = "character"
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = columnClass)

## Filter and transform data
data <- filter(data, Date %in% c("1/2/2007", "2/2/2007")) %>%
  mutate(Date = as.Date(Date, "%d/%m/%Y")) ## Convert Date field to Date format

## Plot a simple histogram of Global Active Power
png(filename = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (killowatts)", main = "Global Active Power")
dev.off()