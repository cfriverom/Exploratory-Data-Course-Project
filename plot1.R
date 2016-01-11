getwd()
setwd("C:\\Users\\Carlos Fernando\\Desktop\\Coursera")

dataFile <- "C:\\Users\\Carlos Fernando\\Desktop\\Coursera\\household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
'eligiendo el intervalo de tiempo'
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

globalActivePower <- as.numeric(subSetData$Global_active_power)
'guardando en png'
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global active power", xlab="Global active power (kilowatts)")
dev.off()