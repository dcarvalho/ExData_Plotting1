#load data
mydata<-read.csv(file="household_power_consumption.txt", sep=";", na.strings = "?")

#casting to date format
mydata[,"Date"]<-as.Date(mydata[,"Date"], "%d/%m/%Y")

#subsetting to specified dates
mydata_1<-mydata[mydata[,"Date"] >= as.Date("01/02/2007", "%d/%m/%Y"),]
mydata_2<-mydata_1[mydata_1[,"Date"]<=as.Date("02/02/2007", "%d/%m/%Y"),]


#generating plot  
library(lubridate)
png(file="plot3.png",width=480,height=480);
plot(mydata_2$Sub_metering_1, type="l",main="", xlab="",ylab="Energy sub metering")
lines(mydata_2$Sub_metering_2, col="red")
lines(mydata_2$Sub_metering_3, col="purple")
legend("topright", pch = "-", col = c("black","red","purple"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()