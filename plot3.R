plot3 <- function() {
    ##Reads in data, plots the three sub metering data and saves to PNG file
    
    ##Define classes for columns
    classes<-c("character","character",rep("numeric",7))
    ##Read in data
    Data<-read.table("household_power_consumption.txt", sep=";",header=TRUE, nrows = 80000, na.strings = "?",,colClasses=classes)
    ##Convert column 1 to dates and subset the wanted data
    Data[,1] <- as.Date(strptime(Data[,1],"%d/%m/%Y"))
    Data<-Data[(Data[,1]=="2007-02-01")|(Data[,1]=="2007-02-02"),]
    
    ##Make variable Time to use as x-axis
    Time <- strptime(paste(Data$Date,Data$Time),"%Y-%m-%d %H:%M:%S")
    ##Set color for plot
    color<-c("black","red","blue")
    ##Plot Time vs the three sub meetering data and add legend
    plot(Time,Data$Sub_metering_1, type="l",col=color[1], ylab = "Energy sub meeting", xlab="")
    lines(Time,Data$Sub_metering_2, col = color[2])
    lines(Time,Data$Sub_metering_3, col = color[3])
    legend("topright", lwd =1, col = color, legend=names(Data)[7:9])
    
    ##Save plot to PNG file
    dev.copy(png, file="plot3.png", width = 480, height = 480)
    dev.off()
    
}