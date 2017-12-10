#
## Plot2.R
#

# getwd()
# setwd("/Users/clu/Desktop/Coursera/Exploratory Analysis/")
# dir()

# dt_begin <- ymd("2007-02-01")
# class(dt_begin)
# dt_end <- ymd("2007-02-02")
# class(dt_end)

filename <- "./household_power_consumption.txt"
df2 <- read.table(filename, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
workData <- df2[df2$Date %in% c("1/2/2007","2/2/2007") ,]
# Free useless memory from datafile
df2 <- NULL

datetime <- strptime(paste(workData$Date, workData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(workData$Global_active_power)
png("Plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Close graphic device, write bitmap to PNG file 
dev.off()