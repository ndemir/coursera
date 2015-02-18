library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI<-NEI[(NEI$fips %in% c("24510","06037")) & (NEI$type=="ON-ROAD"),]

s<-aggregate(NEI$Emissions, by=list(NEI$fips,NEI$year), FUN=sum)
names(s)<-c("fips", "year", "total")
s[s$fips=="24510",]$fips="Baltimore"
s[s$fips=="06037",]$fips="California"


ggplot(s, aes(year, total, group=fips,color=fips)) + geom_line()
ggsave(filename = "plot6.png")
