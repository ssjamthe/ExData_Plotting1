#This script plots line graph for different parameters vs dates 1/2/2007 and 2/2/2007
fullData<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE);
reqData<-subset(fullData,Date=="1/2/2007" | Date == "2/2/2007")
png(filename="plot3.png",width=480,height=480)
reqData<-transform(reqData,DateTime=strptime(paste(Date,Time),format="%d/%m/%Y %H:%M:%S"))
with(reqData,plot(DateTime[!is.na(DateTime)],Sub_metering_1[!is.na(DateTime)],type="l",xlab="",ylab="Enerygy sub metering"),col="black")
with(reqData,lines(DateTime[!is.na(DateTime)],Sub_metering_2[!is.na(DateTime)],col="red"))
with(reqData,lines(DateTime[!is.na(DateTime)],Sub_metering_3[!is.na(DateTime)],col="blue"))
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

