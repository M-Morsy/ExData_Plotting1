# Project One Code - plot1
power_consumption <- read.csv2("Explotoy Data Analysis/project1/household_power_consumption.txt" , header = TRUE , na.string = "?" )

power_consumption$Date <- as.Date(power_consumption$Date , "%d/%m/%Y")
head (power_consumption$Date)
power_consumption_sub <- subset(power_consumption , Date >= as.Date("2007-02-01" , "%Y-%m-%d"))
power_consumption_sub <- subset(power_consumption_sub , Date <= as.Date("2007-02-02" , "%Y-%m-%d"))
power_consumption_sub$Global_active_power <- as.numeric(power_consumption_sub$Global_active_power)


power_consumption_sub <- subset(power_consumption_sub , Global_active_power)
h <- hist(power_consumption_sub$Global_active_power / 100,
     col = "red",
     xlab = "Global Active Power",
     ylab = "Frequency",
     breaks = 11
     # xlim = range(6)
     )

png (filename = "Explotoy Data Analysis/project1/plot1.png")
hist(power_consumption_sub$Global_active_power / 100,
     col = "red",
     xlab = "Global Active Power (Kilowatts)",
     ylab = "Frequency",
     main = "Global Active Power"
     # xlim=c(0, 7),
     # breaks = 8
    )
library(Hmisc)
minor.tick(nx=4)
dev.off() 
