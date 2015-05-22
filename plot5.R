library(dplyr)
library(ggplot2)

setwd('/Users/yinagu/Dropbox/exdata-data-NEI_data/')
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore <- filter(NEI, fips == "24510")

b1<- baltimore %>% filter(type == "POINT") %>% group_by(year) %>% summarize(totalPM = sum(Emissions))
b2<- baltimore %>% filter(type == "NONPOINT") %>% group_by(year) %>% summarize(totalPM = sum(Emissions))
b3<- baltimore %>% filter(type == "ON-ROAD") %>% group_by(year) %>% summarize(totalPM = sum(Emissions))
b4<- baltimore %>% filter(type == "NON-ROAD") %>% group_by(year) %>% summarize(totalPM = sum(Emissions))

xy3 <- rbind(b1, b2, b3, b4)
xy3 <- mutate(xy3, type=factor(c(rep("POINT",4), rep("NONPOINT",4), rep("ON-ROAD", 4), rep("NON-ROAD",4))))

qplot(year, totalPM, data=xy3, color = type) + geom_line() + ylab("Total PM2.5 emissions (tons)") + ggtitle("Total emissions from PM2.5 in the Baltimore City")