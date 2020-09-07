source <- readRDS("Source_Classification_Code.rds")
pm <- readRDS("summarySCC_PM25.rds")

totalbyyear <- aggregate(Emissions~year,pm,sum)

barplot(height=totalbyyear$Emissions, names.arg=totalbyyear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions at various years'))

png("plot1.png")
barplot(height=totalbyyear$Emissions, names.arg=totalbyyear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions at various years'))
dev.off()