#
## Plot4.R
#

# getwd()
# setwd("/Users/clu/Desktop/Coursera/Exploratory Analysis/")
# dir()

# dt_begin <- ymd("2007-02-01")
# class(dt_begin)
# dt_end <- ymd("2007-02-02")
# class(dt_end)

filename <- "./household_power_consumption.txt"
df4 <- read.table(filename, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
workData <- df4[df4$Date %in% c("1/2/2007","2/2/2007") ,]
# Freeing useless memory used by datafile
df4 <- NULL

datetime <- strptime(paste(workData$Date, workData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(workData$Global_active_power)
globalReactivePower <- as.numeric(workData$Global_reactive_power)
voltage <- as.numeric(workData$Voltage)
submetering1 <- as.numeric(workData$Sub_metering_1)
submetering2 <- as.numeric(workData$Sub_metering_2)
submetering3 <- as.numeric(workData$Sub_metering_3)


png("Plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

# First plot (upper, left)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

# Second plot (upper, right)
plot(datetime, voltage, type="l", xlab="Datetime", ylab="Voltage")

# Third plot (lower, left)
plot(datetime, submetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

# Fourth plot (lower, right)
plot(datetime, globalReactivePower, type="l", xlab="Datetime", ylab="Global_reactive_power")

# Close graphic device, write bitmap to PNG file 
dev.off()