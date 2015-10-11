#load data
mydata<-read.csv(file="household_power_consumption.txt", sep=";", na.strings = "?")

#casting to date format
mydata[,"Date"]<-as.Date(mydata[,"Date"], "%d/%m/%Y")

#subsetting to specified dates
mydata_1<-mydata[mydata[,"Date"] >= as.Date("01/02/2007", "%d/%m/%Y"),]
mydata_2<-mydata_1[mydata_1[,"Date"]<=as.Date("02/02/2007", "%d/%m/%Y"),]

#generating histogram plot  
png(file="plot1.png",width=480,height=480);
hist(mydata_2$Global_active_power, col = "red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
 