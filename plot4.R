plot4 <- function() {
    ##Reads in data, plots 4 different data together and saves to PNG file
    
    ##Define classes for columns
    classes<-c("character","character",rep("numeric",7))
    ##Read in data
    Data<-read.table("household_power_consumption.txt", sep=";",header=TRUE, nrows = 80000, na.strings = "?",,colClasses=classes)
    ##Convert column 1 to dates and subset the wanted data
    Data[,1] <- as.Date(strptime(Data[,1],"%d/%m/%Y"))
    Data<-Data[(Data[,1]=="2007-02-01")|(Data[,1]=="2007-02-02"),]
    
    ##Make variable Time to use as x-axis
    Time <- strptime(paste(Data$Date,Data$Time),"%Y-%m-%d %H:%M:%S")
    ##Set color for plot 2 and devide window
    color<-c("black","red","blue")
    par(mfcol=c(2,2))
    ##Plot Time vs Global Active Power
    plot(Time,Data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab="")
    ##Plot Time vs the three sub meetering data and add legend
    plot(Time,Data$Sub_metering_1, type="l",col=color[1], ylab = "Energy sub meeting", xlab="")
    lines(Time,Data$Sub_metering_2, col = color[2])
    lines(Time,Data$Sub_metering_3, col = color[3])
    legend("topright", lwd =1, col = color, legend=names(Data)[7:9])
    
    ##Plot two remaining plots
    plot(Time,Data$Voltage, type = "l", ylab = "Voltage", xlab = "Datetime")
    plot(Time,Data$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "Datetime")
    
    ##Save plot to PNG file
    dev.copy(png, file="plot4.png", width = 480, height = 480)
    dev.off()
    
}