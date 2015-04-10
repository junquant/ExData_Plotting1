# Read the data into R
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# Convert the date and subset the data
data$Date <- as.Date(data$Date , "%d/%m/%Y")
data <- subset(data,data$Date=="2007-02-01"|data$Date=="2007-02-02")

# Convert the time to POSIXlt
data$Time <- strptime(paste(data$Date,data$Time, sep=" "),"%Y-%m-%d %H:%M:%S")

# Launch the graphics device. Plot the Graph. Close the graphics device
png("plot3.png", width = 480, height = 480)

plot(data$Time,data$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l")
points(data$Time,data$Sub_metering_2, type="l",col="red")
points(data$Time,data$Sub_metering_3, type="l",col="blue")

legend("topright", 
       lty=c(1,1,1), 
       col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
