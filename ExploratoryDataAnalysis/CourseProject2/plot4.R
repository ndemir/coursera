library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coalSCC<-SCC[grep(".*Coal.*", SCC$Short.Name),]$SCC
NEI<-subset(NEI, SCC=coalSCC)

s<-aggregate(NEI$Emissions, by=list(NEI$year), FUN=sum)
names(s)<-c("year", "total")

ggplot(s, aes(year, total)) + geom_line()
ggsave(filename = "plot4.png")
