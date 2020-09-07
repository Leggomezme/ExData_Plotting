##Load Data File

data_load <- read.csv("./household_power_consumption.txt", header=TRUE, sep=";", 
                      stringsAsFactors=FALSE, na.strings = "?", dec=".")

##Format Date + Time
data_load$Date <- as.Date(data_load$Date, format = "%d/%m/%Y")
data_load_subset <-subset(data_load, data_load$Date >= "2007-02-01" & data_load$Date <= "2007-02-02")
data_load_subset$TS <- as.POSIXct(paste(data_load_subset$Date, data_load_subset$Time, seperator = " "))


##Output Plot to  png
png("plot3.png", height = 480, width = 480)
plot(data_load_subset$Sub_metering_1~data_load_subset$TS, type = "l", ylab = "Energy sub metering", xlab = "")
##lines(data_load_subset$TS, data_load_subset$Sub_metering_1)
lines(data_load_subset$TS, data_load_subset$Sub_metering_2, col = "red")
lines(data_load_subset$TS, data_load_subset$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col=c("black", "red", "blue"))

dev.off()