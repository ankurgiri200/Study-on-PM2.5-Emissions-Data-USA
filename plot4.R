library(ggplot2)


source <- readRDS("Source_Classification_Code.rds")
pm <- readRDS("summarySCC_PM25.rds")


new <- merge(pm, source, by="SCC")

coal  <- grepl("coal", new$Short.Name, ignore.case=TRUE)
subpm<- new[coal, ]
totalbyyear <- aggregate(Emissions ~ year,subpm,sum)
png("plot4.png")
barplot(height=totalbyyear$Emissions, names.arg=totalbyyear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions from coal at various years'))
dev.off()
