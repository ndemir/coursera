library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI<-NEI[NEI$fips==24510,]

s<-aggregate(NEI$Emissions, by=list(NEI$year,NEI$type), FUN=sum)
names(s)<-c("year", "type", "total")


ggplot(s, aes(year, total, group=type, color=type)) + geom_line()
ggsave(filename = "plot3.png")
