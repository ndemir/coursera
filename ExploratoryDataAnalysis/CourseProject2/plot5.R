library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


NEI<-NEI[(NEI$fips==24510 & NEI$type=="ON-ROAD"),]

s<-aggregate(NEI$Emissions, by=list(NEI$year), FUN=sum)
names(s)<-c("year", "total")


ggplot(s, aes(year, total)) + geom_line()
ggsave(filename = "plot5.png")
