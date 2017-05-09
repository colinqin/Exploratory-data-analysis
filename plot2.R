#Set workarea
setwd("E:/Study_area/coursera/lessons/Exploratory data analysis/week1")
#Read data 
data <- read.table("data/household_power_consumption.txt",sep = ";",header = TRUE,na.strings="?")
#Get the sub data
subData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
#convert the Date and Time variables to Date/Time classes
subData <- transform(subData,Date= as.Date(subData$Date,"%d/%m/%Y"),
                     Time=as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")))

plot(subData$Time, subData$Global_active_power,ylab="Global Active Power (Kilowatts)",
     xlab="",type="l")

dev.copy(png,file="plot2.png", width=480,height=480)

dev.off()
