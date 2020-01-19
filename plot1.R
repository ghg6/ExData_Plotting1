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

# Create graph 1
with(subData, hist(Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main = "Global Active Power"))