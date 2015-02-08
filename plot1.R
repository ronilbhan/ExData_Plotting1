
'Reading the Data'
household_power_consumption <- read.csv("C:/Users/user/Desktop/household_power_consumption.txt", sep=";")
View(household_power_consumption)

'Subsetting the Data'
power_household<- subset(household_power_consumption, 
(household_power_consumption$Date == "1/2/2007") | (household_power_consumption$Date == "2/2/2007"))

'Changing date into appropriate format'
power_household$Date <- strptime(paste(power_household$Date,power_household$Time), "%d/%m/%Y %H:%M:%S")


'plot1'
hist(as.numeric(as.character(power_household$Global_active_power)),col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")





