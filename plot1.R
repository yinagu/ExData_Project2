library(dplyr)

setwd('~/exdata-data-NEI_data/')
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


xy1 <- tapply(NEI$Emissions, NEI$year, sum)

png("plot1.png")
par(mar = c(5,5,4,1))
barplot(xy1, col=terrain.colors(4), main="Total emissions from PM2.5 from 1999 to 2008", xlab="Year", ylab="Total PM2.5 emission (tons)")
dev.off()