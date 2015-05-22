library(dplyr)
library(ggplot2)

setwd('/Users/yinagu/Dropbox/exdata-data-NEI_data/')
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coalSCC <- SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE) ,]

coalNEI <- merge(NEI, coalSCC, by = "SCC") 

xy4 <- tapply(coalNEI$Emissions, coalNEI$year, sum)

png("plot4.png")
par(mar = c(6,5,4,4))
barplot(xy4, col=heat.colors(4), main='Emissions from coal combustion-related sources from 1999-2008', xlab='year', ylab='Total PM2.5 emissions (tons)')

# ggplot(data=coalNEI, aes(x=year, y=log(Emissions))) + guides(fill=F) + geom_boxplot() + stat_boxplot(geom='errorbar') + xlab('year') + ylab('PM2.5 emissions') + ggtitle('Emissions from coal combustion-related sources from 1999-2008')
dev.off()