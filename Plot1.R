#
## Plot1.R
#

# getwd()
# setwd("/Users/clu/Desktop/Coursera/Exploratory Analysis/")
# dir()

# dt_begin <- ymd("2007-02-01")
# class(dt_begin)
# dt_end <- ymd("2007-02-02")
# class(dt_end)

filename <- "./household_power_consumption.txt"
df1 <- read.table(filename, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
workData <- df1[df1$Date %in% c("1/2/2007","2/2/2007") ,]
# Free useless memory from datafile
df1 <- NULL

#str(workData)
globalActivePower <- as.numeric(workData$Global_active_power)
png("Plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Close graphic device, write bitmap to PNG file 
dev.off()