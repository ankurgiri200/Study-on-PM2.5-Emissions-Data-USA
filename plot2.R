
source <- readRDS("Source_Classification_Code.rds")
pm <- readRDS("summarySCC_PM25.rds")

subpm <- subset(pm,pm$fips=="24510")
totalbyyear <- aggregate(Emissions~year,subpm,sum)
barplot(height=totalbyyear$Emissions, names.arg=totalbyyear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions in Baltimore City  at various years'))

png("plot2.png")
barplot(height=totalbyyear$Emissions, names.arg=totalbyyear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions in Baltimore City  at various years'))
dev.off()