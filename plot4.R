##Plot4   

    ## set fileName to be zip file with data
    fileName <- "exdata_data_household_power_consumption.zip"
    ## unzip fileName and set to file
    file<-unzip(fileName)
    ## file<-"household_power_consumption.txt"

    ## read header into dataframe data
    data<-read.table(file, sep=";", nrows=1, stringsAsFactors=FALSE)
    ## read data for Feb 1 and Feb 2 2007 only into dataframe data1
    data1<-read.table(file, sep=";", skip=grep("1/2/2007", readLines(file)), nrows=2879)

    ## apply data as column names to data1
    names(data1)<-data[1,]

    ## Change Date and Time columns in data1 to be data/time format
    data1$Date<-as.Date(data1$Date, format="%d/%m/%Y")
    data1$Time<-paste(data1$Date,data1$Time)
    data1$Time<-strptime(data1$Time, format ="%Y-%m-%d %H:%M:%S")

    ## create png file connection 
    png(filename = "plot4.png", bg="transparent", width = 480, height = 480, units = "px")

    ## Denotes that we want a 2x2 matrix of graphs filled in row-wise
    par(mfrow=c(2,2))
    
    ## create scatter line plot #1 (upper left)
    plot(data1$Time,data1$Global_active_power, type="l", xlab="", ylab="Global Active Power")
   
    ## create scatter line plot #2 (upper right)
    plot(data1$Time,data1$Voltage, type="l", ylab="Voltage", xlab="datetime")
    
    ## create scatter line plot #3 (lower left)
    plot(data1$Time,data1$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
    
    ## add data to the current scatter line plot
    lines(data1$Time,data1$Sub_metering_2, type="l", col="red") 
    lines(data1$Time,data1$Sub_metering_3, type="l", col="blue") 
    
    ## add a legend to the current scatter line plot
    legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty="solid", bty="n")

    ## create scatter line plot #4 (lower right)
    plot(data1$Time,data1$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datatime", ylim=c(0.0, 0.5))
    
    ## close connection with png file
    dev.off()