#load data
mydata<-read.csv(file="household_power_consumption.txt", sep=";", na.strings = "?")

#casting to date format
mydata[,"Date"]<-as.Date(mydata[,"Date"], "%d/%m/%Y")

#subsetting to specified dates
mydata_1<-mydata[mydata[,"Date"] >= as.Date("01/02/2007", "%d/%m/%Y"),]
mydata_2<-mydata_1[mydata_1[,"Date"]<=as.Date("02/02/2007", "%d/%m/%Y"),]


#generating plot  
library(lubridate)
png(file="plot2.png",width=480,height=480);
plot(mydata_2$Global_active_power, type="l",main="", xlab="",ylab="Global Active Power (kilowatts)")
#plot(x=format(mydata_2$Date, "%a", na.encode=FALSE), y=mydata_2$Global_active_power, type="l" ,main="", ylab="Global Active Power (kilowatts)")
dev.off()
