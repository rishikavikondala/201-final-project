library(plotly)
library(dplyr)
library(leaflet)
library(htmltools)
library(knitr)

#number of data
data <- read.csv("../data/crime_data.csv")
View(data)

#total number of crime reported
num_of_crime_reported <- nrow(data)
DT <- data %>% select(Report.Number, Neighborhood) %>%
      group_by(Neighborhood) %>%
      summarise(sum = n())


#filter and count the number of crimes in the Neighborhood data

#create pie chart
# pie chart - http://www.sthda.com/english/wiki/ggplot2-pie-chart-quick-start-guide-r-software-and-data-visualization
pie_chart <- plot_ly(DT, 
                     x = ~Neighborhood, 
                     y = ~sum, type = 'bar') %>%
  layout(title = "Least Used Features",
         xaxis = list(title = ""),
         yaxis = list(title = ""))


