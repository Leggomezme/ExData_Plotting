##Load Data File

data_load <- read.csv("./household_power_consumption.txt", header=TRUE, sep=";", 
                      stringsAsFactors=FALSE, na.strings = "?", dec=".")

##Format Date
data_load$Date <- as.Date(data_load$Date, format = "%d/%m/%Y")
data_load_subset <-subset(data_load, data_load$Date >= "2007-02-01" & data_load$Date <= "2007-02-02")
data_load_subset$TS <- as.POSIXct(paste(data_load_subset$Date, data_load_subset$Time))


##Output Plot1- png
png("plot1.png", height = 480, width = 480)
hist(data_load_subset$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
dev.off()