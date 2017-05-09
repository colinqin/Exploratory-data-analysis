#Set workarea
setwd("E:/Study_area/coursera/lessons/Exploratory data analysis/week1")
#Read data 
data <- read.table("data/household_power_consumption.txt",sep = ";",header = TRUE,na.strings="?")
#Get the sub data
subData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
#convert the Date and Time variables to Date/Time classes
subData <- transform(subData,Date= as.Date(subData$Date,"%d/%m/%Y"),
                     Time=strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))

#draw hist
hist(subData$Global_active_power,xlab="Global Active Power (Kilowatts)", main="Global Active Power",
     col="red")

#save the hist as png file
dev.copy(png,file="plot.png",width=480,height=480)
dev.off()
