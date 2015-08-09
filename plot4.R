#Read file
epc <- read.table("household_power_consumption.txt",sep=";",header=TRUE)

#Date conversion
epc$Date <- as.Date(epc$Date, format="%d/%m/%Y")
extract <- epc[(epc$Date=="2007-02-01") | (epc$Date=="2007-02-02"),]

#Convert to numeric
extract$Global_active_power <- as.numeric(as.character(extract$Global_active_power))
extract$Sub_metering_1 <- as.numeric(as.character(extract$Sub_metering_1))
extract$Sub_metering_2 <- as.numeric(as.character(extract$Sub_metering_2))
extract$Sub_metering_3 <- as.numeric(as.character(extract$Sub_metering_3))
extract$Voltage <- as.numeric(as.character(extract$Voltage))
extract <- transform(extract, datetime=as.POSIXct(paste(Date, Time)))

#plot4
par(mfrow=c(2,2))

#1
plot(extract$datetime,
     extract$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power"
)

#2
plot(extract$datetime,
     extract$Voltage,
     type="l",
     xlab="datetime",
     ylab="Voltage"
)

#3
plot(extract$datetime,
     extract$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Energy sub metering"
)
lines(extract$datetime,extract$Sub_metering_2,col="red")
lines(extract$datetime,extract$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"),
       c("Sub_metering_1 ","Sub_metering_2 ", "Sub_metering_3 "),
       lty=c(1,1), bty="n", cex=.5
)

#4
plot(extract$datetime,
     extract$Global_reactive_power,
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power"
)
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
