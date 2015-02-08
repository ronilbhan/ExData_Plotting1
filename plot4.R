'Reading the Date'
household_power_consumption <- read.csv("C:/Users/user/Desktop/household_power_consumption.txt", sep=";")

'Subsetting the data'
power_household<- subset(household_power_consumption, (household_power_consumption$Date == "1/2/2007") | 
                           (household_power_consumption$Date == "2/2/2007"))


'Changing date to appropriate format'

datetime=strptime(paste(power_household$Date,power_household$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
power_data=data.frame(power_household,datetime)


'plot4'

par(mfrow=c(2,2), pin = c(2.4,2.4))
 plot(datetime,as.numeric(as.character(power_data$Global_active_power)),type="l",xlab="",ylab="Global Active Power")
 
 plot(datetime,as.numeric(as.character(power_data$Voltage)),type="l",xlab="datetime",ylab="Voltage")

with(power_data,plot(datetime,power_data$Sub_metering_1,type="n",ylim=c(0,38),xlab="",ylab="Energy sub metering "))
with(power_data,points(datetime,as.numeric(as.character(power_data$Sub_metering_1)),type="l",col="black"))
with(power_data,points(datetime,as.numeric(as.character(power_data$Sub_metering_2)),type="l",col="red"))
with(power_data,points(datetime,as.numeric(as.character(power_data$Sub_metering_3)),type="l",col="blue"))
legend("topright",lty=1,lwd=2.5,bty="n",col=c("black","red","blue"), cex=.7,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
 
plot(datetime,as.numeric(as.character(power_data$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")