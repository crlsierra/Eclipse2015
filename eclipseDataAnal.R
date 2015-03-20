
all=read.csv("~/Eclipse/mpi_roof.csv")

date=strptime(as.character(all[,1]),format="%d.%m.%Y %H:%M:%S") #Convert dates and times to POSIX
all=cbind(date,all[,-1]) #Replaces dates and times for POSIX dates

Wed=strptime("2015-03-18 00:00:00", "%Y-%m-%d %H:%M:%S")
Thr=strptime("2015-03-19 00:00:00", "%Y-%m-%d %H:%M:%S")
Fri=strptime("2015-03-20 00:00:00", "%Y-%m-%d %H:%M:%S")

Wedset=all[all[,1]>=Wed & all[,1]<Thr,c(1,18,19)] #data only for 18.03.2015
Thrset=all[all[,1]>=Thr & all[,1]<Fri,c(1,18,19)] #data only for 19.03.2015
Friset=all[all[,1]>=Fri,c(1,18,19)] #data only for 20.03.2015

format(Friset[,1], "%H:%M")
hr=seq(0,(23+5/6),1/6)
hr2=seq(0,(19+2/6),1/6)

plot(hr,Wedset[,2],type="l",col="green",ylab="Short wave incoming radiation (W m-2)",xlab="Hour of day")
lines(hr,Thrset[,2],col="orange")
lines(hr2,Friset[,2],col="blue")
legend("topright",c("18.03.2015","19.03.2015","20.03.2015"),col=c("green","orange","blue"),lty=1,bty="n")

plot(hr,Wedset[,3],type="l",col="green",ylab="Photosynthetically active radiation (umol m-2 s-1)",xlab="Hour of day")
lines(hr,Thrset[,3],col="orange")
lines(hr2,Friset[,3],col="blue")
legend("topright",c("18.03.2015","19.03.2015","20.03.2015"),col=c("green","orange","blue"),lty=1,bty="n")

plot(Friset[,2]-Wedset[,2],type="l")

