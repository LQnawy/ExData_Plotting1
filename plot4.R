library(dplyr)
library(lubridate)

#read the data
electrics <- read.table("electric/household_power_consumption.txt",header = T,sep =";",na.strings = "?")
electric <- tbl_df(electrics)

#remove original data
rm("electrics")

#subset the data from the dates 2007-02-01 and 2007-02-02
electric <- electric %>% 
  filter(Date == "1/2/2007" | Date == "2/2/2007" )

#convert date and time as date type
SetTime <-strptime(paste(electric$Date, electric$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
electric <- cbind(SetTime,electric)

#plot4
labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines <- c("black","red","blue")
par(mfrow=c(2,2))
plot(electric$SetTime, electric$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(electric$SetTime, electric$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(electric$SetTime, electric$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(electric$SetTime, electric$Sub_metering_2, type="l")
lines(electric$SetTime, electric$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=labels, lty=1, col=columnlines)
plot(electric$SetTime, electric$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
