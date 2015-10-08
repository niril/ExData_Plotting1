plot2 <- function() {
    ##Reads in data, plots Time vs Global Active Power and saves to PNG file
    
    ##Define classes for columns
    classes<-c("character","character",rep("numeric",7))
    ##Read in data
    Data<-read.table("household_power_consumption.txt", sep=";",header=TRUE, nrows = 80000, na.strings = "?",,colClasses=classes)
    ##Convert column 1 to dates and subset the wanted data
    Data[,1] <- as.Date(strptime(Data[,1],"%d/%m/%Y"))
    Data<-Data[(Data[,1]=="2007-02-01")|(Data[,1]=="2007-02-02"),]
   
    ##Make variable Time to use as x-axis
    Time <- strptime(paste(Data$Date,Data$Time),"%Y-%m-%d %H:%M:%S")
    
    ##Plot Time vs Global Active Power
    plot(Time,Data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab="")
    ##Save plot to PNG file
    dev.copy(png, file="plot2.png", width = 480, height = 480)
    dev.off()
    
}