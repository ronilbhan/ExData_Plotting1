
'Reading the Date'
household_power_consumption <- read.csv("C:/Users/user/Desktop/household_power_consumption.txt", sep=";")

'Subsetting the data'
power_household<- subset(household_power_consumption, (household_power_consumption$Date == "1/2/2007") | 
                           (household_power_consumption$Date == "2/2/2007"))


'Changing date to appropriate format'

datetime=strptime(paste(power_household$Date,power_household$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
power_data=data.frame(power_household,datetime)

'plot2'


plot(datetime,as.numeric(as.character(power_data$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)")