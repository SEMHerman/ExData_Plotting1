##Plot1    

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
    
    ## create png file connection 
    png(filename = "plot1.png", bg="transparent", width = 480, height = 480, units = "px")
    
    ## create histogram plot
    hist(data1$Global_active_power, breaks=12, col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power")
    
    ## close connection with png file
    dev.off()