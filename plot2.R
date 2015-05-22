library(dplyr)


setwd('/Users/yinagu/Dropbox/exdata-data-NEI_data/')
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore <- filter(NEI, fips == "24510")

xy2 <- tapply(baltimore$Emissions, baltimore$year, sum)

png("plot2.png")
par(mar = c(5,5,4,1))
barplot(xy2, col=topo.colors(4), main="Total emissions from PM2.5 in the Baltimore City from 1999 to 2008", xlab="Year", ylab="Total PM2.5 emission (tons)")
dev.off()