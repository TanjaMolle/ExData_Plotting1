## First the data has to be read in.
## fulldata is the whole data
## data is a subset of fulldata from the dates 2007-02-01 and 2007-02-02


fulldata <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data <- subset(fulldata, Date %in% c("1/2/2007","2/2/2007"))
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Now the the histogram can be plotted and saved as png with data.

png("plot1.png", width=480, height=480)
hist(data$Global_active_power, xlab="Global Active power (kilowatts)", ylab="Frequency", main="Global Active Power",col="red")
dev.off()
