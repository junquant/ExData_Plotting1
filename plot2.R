# Read the data into R
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# Convert the date and subset the data
data$Date <- as.Date(data$Date , "%d/%m/%Y")
data <- subset(data,data$Date=="2007-02-01"|data$Date=="2007-02-02")

# Convert the time to POSIXlt
data$Time <- strptime(paste(data$Date,data$Time, sep=" "),"%Y-%m-%d %H:%M:%S")

# Launch the graphics device. Plot the Graph. Close the graphics device
png("plot2.png", width = 480, height = 480)

with(data, 
     plot(data$Time, data$Global_active_power, 
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     type="l"))

dev.off()
