## First the data has to be read in.
## fulldata is the whole data
## data is a subset of fulldata from the dates 2007-02-01 and 2007-02-02


fulldata <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                     nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data <- subset(fulldata, Date %in% c("1/2/2007","2/2/2007"))
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data<-cbind(data, "DateTime" = as.POSIXct(paste(data$Date, data$Time)))

## Now the plot to save as png with data.

png("plot2.png", width=480, height=480)
plot(data$Global_active_power ~ data$DateTime, type="l", xlab= "", ylab="Global Active power (kilowatts)")
dev.off()