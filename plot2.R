
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                    na.strings="?", stringsAsFactors=FALSE)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
subdata <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)
subdata$datetime <- as.POSIXct(paste(subdata$Date, subdata$Time), format="%Y-%m-%d %H:%M:%S")

png("plot2.png", width=480, height=480)
plot(subdata$datetime, subdata$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

