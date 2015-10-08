plot1 <- function() {
    ##Reads in data, plots histogram of Global Active Power and saves to PNG file
    
    ##Define classes for columns
    classes<-c("character","character",rep("numeric",7))
    ##Read in data
    Data<-read.table("household_power_consumption.txt", sep=";",header=TRUE, nrows = 80000, na.strings = "?",,colClasses=classes)
    ##Convert column 1 to dates and subset the wanted data
    Data[,1] <- as.Date(strptime(Data[,1],"%d/%m/%Y"))
    Data<-Data[(Data[,1]=="2007-02-01")|(Data[,1]=="2007-02-02"),]
    
    ##Plot histogram of Global Active Power
    hist(Data$Global_active_power, col ="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
    
    ##Save plot to PNG file
    dev.copy(png, file="plot1.png", width = 480, height = 480)
    dev.off()
}