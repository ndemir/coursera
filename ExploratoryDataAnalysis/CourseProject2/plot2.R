NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI<-NEI[NEI$fips==24510,]

s<-aggregate(NEI$Emissions, by=list(NEI$year), FUN=sum)
names(s)<-c("year", "total")

png("plot2.png")

plot(s)
lines(s)

dev.off()