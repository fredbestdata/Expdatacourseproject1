#read in the data
setwd("~/R/exdata%2Fdata%2Fhousehold_power_consumption")
dataset <- read.csv("~/R/exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt", sep=";")

#setting the date variable and select specific dates
dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")
dataset <- with(dataset, dataset[(dataset$Date >= "2007-02-01"),])
dataset <- with(dataset, dataset[(dataset$Date <= "2007-02-02"),])

#bind the 2 columns date and time in a timestamp variable
datset <- transform(dataset, timestamp=as.POSIXct(paste(dataset$Date, dataset$Time)), "%d/%m/%Y %H:%M:%S")

#set the other variables good
dataset$Global_active_power <- as.numeric(as.character(dataset$Global_active_power))
dataset$Global_reactive_power <- as.numeric(as.character(dataset$Global_reactive_power))
dataset$Voltage <- as.numeric(as.character(dataset$Voltage))
dataset$Sub_metering_1 <- as.numeric(as.character(dataset$Sub_metering_1))
dataset$Sub_metering_2 <- as.numeric(as.character(dataset$Sub_metering_2))
dataset$Sub_metering_3 <- as.numeric(as.character(dataset$Sub_metering_3))

#make the histogram and saving
png("plot1.png", width=480, height=480)
hist(dataset$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
