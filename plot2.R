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

# Create graph 2
plot(dateTime, subData$Global_active_power, xlab="", type="l", ylab="Global Active Power (kilowatts)")