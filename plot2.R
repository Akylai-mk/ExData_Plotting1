
#### PLOT 2 #####


## LOADING THE DATA
## Data loaded from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## and unzipped into working directory as "household_power_consumption.txt"

## opening and reading the file
full <- read.table("household_power_consumption.txt", 
                   header = TRUE, sep = ";",
                   na.strings="?", stringsAsFactors=F)

## subsetting data from the dates 2007-02-01 and 2007-02-02
powerData <- subset(full, Date %in% c("1/2/2007", "2/2/2007"))

library(dplyr)
powerdf <- tbl_df(powerData)
globalActivePower <- as.numeric(as.character(powerdf$Global_active_power))
## reading "Date" as dates, "Time" as time
class(powerData$Time); class(powerData$Date)
powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")
datetime <- strptime(paste(powerdf$Date, powerdf$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## MAKING PLOT
Sys.setlocale(category = "LC_ALL", locale = "english") ##the system language is Russian, need to change it to English
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width = 480, height = 480)
dev.off()
