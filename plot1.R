# Read the data into R
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# Convert the date and subset the data
data$Date <- as.Date(data$Date , "%d/%m/%Y")
data <- subset(data,data$Date=="2007-02-01"|data$Date=="2007-02-02")

# Launch the graphics device. Plot the Graph. Close the graphics device
png("plot1.png", width = 480, height = 480)

hist(data$Global_active_power, 
main = "Global Active Power", 
col = "red", 
xlab = "Global Active Power (kilowatts)")

dev.off()
