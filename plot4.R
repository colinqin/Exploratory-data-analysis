#Set workarea
setwd("E:/Study_area/coursera/lessons/Exploratory data analysis/week1")
#Read data 
data <- read.table("data/household_power_consumption.txt",sep = ";",header = TRUE,na.strings="?")
#Get the sub data
subData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
subData <- transform(subData,Date= as.Date(subData$Date,"%d/%m/%Y"),
                     Time=as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")))

png(filename = "Plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
#1
plot(subData$Time, subData$Global_active_power,ylab="Global Active Power",xlab="",type="l")
#2
plot(subData$Time, subData$Voltage,ylab="Voltage",xlab="datatime",type="l")
#3
plot(subData$Time, subData$Sub_metering_1,ylab="Energy sub metering",xlab="",type="l")
lines(subData$Time,subData$Sub_metering_2,col="red",type = "l")
lines(subData$Time,subData$Sub_metering_3,col="blue",type = "l")
legend("topright", lty = c(1, 1, 1),col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#4
plot(subData$Time, subData$Global_reactive_power,ylab="Global_reactive_power",xlab="datatime",type="l")

dev.off()
