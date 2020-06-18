
#### PLOT 1 #####


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
hist(powerData$Global_active_power, col = "red", main = "Global Active Power", ylab = "Frequency", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width = 480, height = 480)
dev.off()
