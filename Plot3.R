#
## Plot3.R
#

# getwd()
# setwd("/Users/clu/Desktop/Coursera/Exploratory Analysis/")
# dir()

# dt_begin <- ymd("2007-02-01")
# class(dt_begin)
# dt_end <- ymd("2007-02-02")
# class(dt_end)

filename <- "./household_power_consumption.txt"
df3 <- read.table(filename, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
workData <- df3[df3$Date %in% c("1/2/2007","2/2/2007") ,]
# Free useless memory from datafile
df3 <- NULL

datetime <- strptime(paste(workData$Date, workData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(workData$Global_active_power)
submetering1 <- as.numeric(workData$Sub_metering_1)
submetering2 <- as.numeric(workData$Sub_metering_2)
submetering3 <- as.numeric(workData$Sub_metering_3)

png("Plot3.png", width=480, height=480)
# Actual data plot
plot(datetime, submetering1, type="l", ylab="Energy submetering", xlab="")
# Adding solid lines, red and blue
lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")
# Adding legends on the plot 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# Close graphic device, write bitmap to PNG file 
dev.off()