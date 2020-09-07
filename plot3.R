library(ggplot2)


source <- readRDS("Source_Classification_Code.rds")
pm <- readRDS("summarySCC_PM25.rds")

subpm <- subset(pm,pm$fips=="24510")
totalbyyear <- aggregate(Emissions~year + type,subpm,sum)

png("plot3.png", width=640, height=480)
g <- ggplot(totalbyyear, aes(year, Emissions, color = type))
g <- g + geom_line() +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Emissions in Baltimore City, Maryland from 1999 to 2008')
print(g)
dev.off()