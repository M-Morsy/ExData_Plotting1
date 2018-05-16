# Project One Code
power_consumption <- read.csv2("Explotoy Data Analysis/project1/household_power_consumption.txt" , header = TRUE , na.string = "?" )

power_consumption$Date <- as.Date(power_consumption$Date , "%d/%m/%Y")
head (power_consumption$Date)
power_consumption_sub <- subset(power_consumption , Date >= as.Date("2007-02-01" , "%Y-%m-%d"))
power_consumption_sub <- subset(power_consumption_sub , Date <= as.Date("2007-02-02" , "%Y-%m-%d"))
power_consumption_sub$Global_active_power <- as.numeric(power_consumption_sub$Global_active_power)

head (power_consumption_sub)
names (unclass (as.POSIXlt(power_consumption_sub$Date[1])))
# unclass(as.POSIXlt(power_consumption_sub$Date[1]))
# power_consumption_sub$Date[1]
as.POSIXlt(power_consumption_sub$Date[1])$yday # Tursday > 4 , Fri > 5 , Sat > 6
datetime <- strptime(paste(power_consumption_sub$Date, power_consumption_sub$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 
plot (as.POSIXlt(power_consumption_sub$Date)$yday, power_consumption_sub$Global_active_power , 
      ylab = "Global active power (Kilowatts)",
      type="l"
        )


#str(subSetData)

globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

## Another code ##
dataFile <- "./Explotoy Data Analysis/project1/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("./Explotoy Data Analysis/project1/plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()