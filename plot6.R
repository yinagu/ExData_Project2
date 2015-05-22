library(dplyr)
library(ggplot2)

setwd('/Users/yinagu/Dropbox/exdata-data-NEI_data/')
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore <- filter(NEI, fips == "24510")
LA <- filter(NEI, fips == "06037")

b3 <- baltimore %>% filter(type == "ON-ROAD") %>% group_by(year) %>% summarize(totalPM = sum(Emissions))
l3 <- LA %>% filter(type == "ON-ROAD") %>% group_by(year) %>% summarize(totalPM = sum(Emissions))

xy6 <- rbind(b3,l3)
xy6 <- mutate(xy6, county = factor(c(rep("Baltimore",4), rep("Los Angeles",4))))

png('plot6.png', width = 600, height = 480)
qplot(year, totalPM, data=xy6, color = county) + geom_line() + ylab("Total PM2.5 emissions (tons)") + ggtitle("Comparison of emissions from motor vehicle sources in Baltimore and Los Angeles")

dev.off()