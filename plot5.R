library(ggplot2)


source <- readRDS("Source_Classification_Code.rds")
pm <- readRDS("summarySCC_PM25.rds")


new <- merge(pm, source, by="SCC")

subpm <- subset(new,new$fips=="24510"&new$type=="ON-ROAD")
totalbyyear <- aggregate(Emissions ~ year,subpm,sum)
png("plot5.png")
barplot(height=totalbyyear$Emissions, names.arg=totalbyyear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions in Bailtimore due to ONROAD at various years'))
dev.off()