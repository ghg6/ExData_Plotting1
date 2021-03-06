if(!"data.table" %in% library()$results[,1]) {
  print("Loading data.table package")
  library(data.table)
} else {
  print("data.table is already loaded")
}

data = fread("household_power_consumption.txt")

subData = subset(data, data$Date %in% c("1/2/2007", "2/2/2007"))

# Convert global active power to numeric
subData$Global_active_power <- as.numeric(subData$Global_active_power)

# Convert to date/time
dateTime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Assign graph 3 variables
sm1 = as.numeric(subData$Sub_metering_1)
sm2 = as.numeric(subData$Sub_metering_2)
sm3 = as.numeric(subData$Sub_metering_3)

# Create graph3
plot(dateTime,sm1, col="black", type="l", xlab="", ylab="Energy sub metering")
lines(dateTime, sm2, col="red", type="l")
lines(dateTime, sm3, col="blue", type="l")
legend_names <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", legend_names, col=c("black", "red", "blue"), lwd=2.5)