#Downloading the data
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "electricpowerconsumption.zip")
unzip("electricpowerconsumption.zip")

#Organizing and subsetting the data
electric <- read.table("household_power_consumption.txt", sep = ";", skip = 1, stringsAsFactors = FALSE)
colnames(electric) <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
                        "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
                        "Sub_metering_3")
subsetelectric <- electric[electric$Date %in% c("1/2/2007","2/2/2007"), ]

#Making plot3
datetime <- strptime(paste(subsetelectric$Date, subsetelectric$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 
globalactivepower <- as.numeric(subsetelectric$Global_active_power)
submetering1 <- as.numeric(subsetelectric$Sub_metering_1)
submetering2 <- as.numeric(subsetelectric$Sub_metering_2)
submetering3 <- as.numeric(subsetelectric$Sub_metering_3)

png("plot3.png", width = 480, height = 480)
plot(datetime, submetering1, type = "l", ylab = "Energy Sub metering", xlab = "")
lines(datetime, submetering2, type = "l", col = "red")
lines(datetime, submetering3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))
dev.off()