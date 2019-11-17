library(plotly)
library(dplyr)

#number of data
data <- read.csv("../data/crime_data.csv")

#total number of crime reported
num_of_crime_reported <- nrow(data)
DT <- data %>% select(Report.Number, Neighborhood) %>%
      group_by(Neighborhood) %>%
      summarise(sum = n())


#filter and count the number of crimes in the Neighborhood data

#create pie chart
bar_chart <- plot_ly(DT, 
                     x = ~Neighborhood, 
                     y = ~sum, 
                     type = 'bar',
                     marker = list(color = 'rgb(229,204,255)')) %>%
  layout(title = "Number of crimes Reported in Seattle Neighborhood",
         xaxis = list(title = ""),
         yaxis = list(title = ""))


