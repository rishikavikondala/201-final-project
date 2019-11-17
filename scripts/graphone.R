# GRAPH ONE

# Install packages
library("dplyr")
library("tidyr")
library("ggplot2")
library("plotly")

# Load data
crime_data <- read.csv("./data/dataset_one.csv")

# Find number of crimes per precinct from 2008-Present
precinct_totals <- crime_data %>%
  group_by(Precinct) %>%
  count()

# Make a bar chart using ggplot2
graph_one <- ggplot(
  data = precinct_totals, aes(x = Precinct, y = n, fill = Precinct)) +
  geom_bar(stat = "identity") + 
  guides(fill = FALSE) + 
  xlab("Precinct of Seattle") + 
  ylab("Total Number of Crimes") +
  ggtitle("Crimes Per Precinct from 2008 to Present Day")

# Convert to an interactive plotly graph
graph_one <- ggplotly(graph_one) %>% 
  config(displayModeBar = F) %>% 
  layout(showlegend = FALSE)

