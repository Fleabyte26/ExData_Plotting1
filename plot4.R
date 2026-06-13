
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                    na.strings="?", stringsAsFactors=FALSE)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
subdata <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)
subdata$Global_reactive_power <- as.numeric(subdata$Global_reactive_power)
subdata$Voltage <- as.numeric(subdata$Voltage)
subdata$Sub_metering_1 <- as.numeric(subdata$Sub_metering_1)
subdata$Sub_metering_2 <- as.numeric(subdata$Sub_metering_2)
subdata$Sub_metering_3 <- as.numeric(subdata$Sub_metering_3)
subdata$datetime <- as.POSIXct(paste(subdata$Date, subdata$Time), format="%Y-%m-%d %H:%M:%S")

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

plot(subdata$datetime, subdata$Global_active_power, type="l",
     xlab="", ylab="Global Active Power")

plot(subdata$datetime, subdata$Voltage, type="l",
     xlab="datetime", ylab="Voltage")

plot(subdata$datetime, subdata$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering")
lines(subdata$datetime, subdata$Sub_metering_2, col="red")
lines(subdata$datetime, subdata$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black","red","blue"), bty="n",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(subdata$datetime, subdata$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global_reactive_power")

dev.off()

