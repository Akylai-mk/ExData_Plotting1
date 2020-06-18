#### PLOT 4 #####


## LOADING THE DATA
## Data loaded from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## and unzipped into working directory as "household_power_consumption.txt"

## opening and reading the file
full <- read.table("household_power_consumption.txt", 
                   header = TRUE, sep = ";",
                   na.strings="?", stringsAsFactors=F)

## subsetting data from the dates 2007-02-01 and 2007-02-02
powerData <- subset(full, Date %in% c("1/2/2007", "2/2/2007"))

## reading "Date" as dates, "Time" as time
class(powerData$Time); class(powerData$Date)
powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")
powerData$Time <- strptime((paste(powerData$Date, powerData$Time)), "%Y-%m-%d %H:%M:%S")


## MAKING PLOT
Sys.setlocale(category = "LC_ALL", locale = "english") ##the system language is Russian, need to change it to English

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(powerData, plot(Time, Global_active_power, type="l", xlab="", ylab="Global Active Power"))
     
with(powerData, plot (Time, Voltage, type = "l", xlab="datetime", ylab="Voltage")) 

with(powerData, plot(Time, Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering")) 
with(powerData, lines(Time, Sub_metering_2, col = "red"))
with(powerData, lines(Time, Sub_metering_3, col = "blue"))
legend("topright", col=c("black", "red", "blue"), lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(powerData, plot(Time, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))

dev.copy(png, file="plot4.png", width = 480, height = 480)
dev.off()
