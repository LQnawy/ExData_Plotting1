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

#plot1
hist(electric$Global_active_power,xlab = "Global Active Power (kilowats)",col = "red",main="Global Active Power")
