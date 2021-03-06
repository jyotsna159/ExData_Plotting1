
data <- read.table("./exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt",header=TRUE,sep = ";")
data_Feb <- subset(data, as.Date(data$Date,"%d/%m/%Y")=="2007-02-01" | as.Date(data$Date,"%d/%m/%Y")=="2007-02-02")

library(datasets)

par(mfcol=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))

with(data_Feb,{
  plot(as.POSIXct(paste(data_Feb$Date, data_Feb$Time), format="%d/%m/%Y %H:%M:%S"),as.numeric(as.character(data_Feb$Global_active_power)),
       type="l",ylab = "Global Active Power (kilowatts)",xlab = "")
  plot(as.POSIXct(paste(data_Feb$Date, data_Feb$Time), format="%d/%m/%Y %H:%M:%S"),as.numeric(as.character(data_Feb$Sub_metering_1)),
                     type="n",xlab = "",ylab = "Energy sub metering")
  with(data_Feb,lines(as.POSIXct(paste(data_Feb$Date, data_Feb$Time), format="%d/%m/%Y %H:%M:%S"),as.numeric(as.character(data_Feb$Sub_metering_1))
                      ,col ="black"))
  with(data_Feb,lines(as.POSIXct(paste(data_Feb$Date, data_Feb$Time), format="%d/%m/%Y %H:%M:%S"),as.numeric(as.character(data_Feb$Sub_metering_2))
                      ,col ="red"))
  with(data_Feb,lines(as.POSIXct(paste(data_Feb$Date, data_Feb$Time), format="%d/%m/%Y %H:%M:%S"),as.numeric(as.character(data_Feb$Sub_metering_3))
                      ,col ="blue"))
  legend("topright",lty=1,col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n",cex=0.8,adj=c(0,0.6))
  plot(as.POSIXct(paste(data_Feb$Date, data_Feb$Time), format="%d/%m/%Y %H:%M:%S"),as.numeric(as.character(data_Feb$Voltage)),type="l"
                    ,xlab="datetime",ylab="Voltage")
  plot(as.POSIXct(paste(data_Feb$Date, data_Feb$Time), format="%d/%m/%Y %H:%M:%S"),as.numeric(as.character(data_Feb$Global_reactive_power)),type="l"
                    ,xlab="datetime",ylab="Global_reactive_power")
})


dev.copy(png,file="plot4.png")
dev.off()

