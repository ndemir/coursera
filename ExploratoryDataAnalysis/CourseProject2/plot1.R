NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

s<-aggregate(NEI$Emissions, by=list(NEI$year), FUN=sum)
names(s)<-c("year", "total")

png("plot1.png")

plot(s)
lines(s)

dev.off()