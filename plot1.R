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

#plot1
hist(extract$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power(kilowatts)"
)
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
