#This script plots line graph for Global_active_power vs dates 1/2/2007 and 2/2/2007
fullData<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE);
reqData<-subset(fullData,Date=="1/2/2007" | Date == "2/2/2007")
png(filename="plot2.png",width=480,height=480)
reqData<-transform(reqData,DateTime=strptime(paste(Date,Time),format="%d/%m/%Y %H:%M:%S"))
with(reqData,plot(DateTime[!is.na(DateTime)],Global_active_power[!is.na(DateTime)],type="l",xlab="",ylab="Global Active Power(kilowatts)"))
dev.off()


