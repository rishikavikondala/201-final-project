# GRAPH ONE

# Install packages
library("dplyr")
library("tidyr")
library("ggplot2")
library("plotly")
library("styler")
library("lintr")

# Load data
crime_data <- read.csv("data/dataset_one.csv")

# Find number of crimes per precinct from 2008-Present
precinct_totals <- crime_data %>%
  group_by(Precinct) %>%
  count()

# Make a bar chart using ggplot2
graph_one <- ggplot(
  data = precinct_totals, aes(x = Precinct, y = n, fill = Precinct)
) +
  geom_bar(stat = "identity") +
  coord_polar() +
  ggtitle("Crimes Per Precinct from 2008 to Present Day")

graph_one_alt <- ggplot(precinct_totals, aes(x = "", y = n, fill = Precinct))+
  geom_bar(width = 1, stat = "identity") + 
  ggtitle("Crimes Per Precinct from 2008 to Present Day")

