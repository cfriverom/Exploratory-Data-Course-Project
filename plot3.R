getwd()
setwd("C:\\Users\\Carlos Fernando\\Desktop\\Coursera")
dataFile <- "C:\\Users\\Carlos Fernando\\Desktop\\Coursera\\household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
'Eligiendo el intervalo de tiempo'
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

'guardando en png'
png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Subm etering", xlab="")
'modificando detalle de lineas'
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
'creando leyenda'
legend("topright", c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()