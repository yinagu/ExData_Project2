library(dplyr)
library(ggplot2)

setwd('/Users/yinagu/Dropbox/exdata-data-NEI_data/')
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore <- filter(NEI, fips == "24510")

b3 <- baltimore %>% filter(type == "ON-ROAD") %>% group_by(year) %>% summarize(totalPM = sum(Emissions))

qplot(year, totalPM, data=b3) + geom_line() + ylab("Total PM2.5 emissions (tons)") + xlab("year") + ggtitle("Total emissions from motor vehicle sources in the Baltimore City")