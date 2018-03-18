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

#plot3
collines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(electric$SetTime, electric$Sub_metering_1, type="l", col=collines[1], xlab="", ylab="Energy sub metering")
lines(electric$SetTime, electric$Sub_metering_2, col=collines[2])
lines(electric$SetTime, electric$Sub_metering_3, col=collines[3])
legend("topright", legend=labels, col=collines, lty="solid")