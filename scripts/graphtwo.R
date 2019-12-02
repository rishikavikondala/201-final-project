library(dplyr)
library(stringr)
library(ggplot2)
library(httr)
library(jsonlite)
library(lintr)

uri <- "https://data.seattle.gov/resource/33kz-ixgy.json"
response <- GET(uri)
response_text <- content(response, "text")
call_data <- fromJSON(response_text)

uri3 <- "https://data.seattle.gov/resource/4fs7-3vj5.json"
response3 <- GET(uri3)
response_text3 <- content(response3, "text")
crime_data <- fromJSON(response_text3)

is.data.frame(call_data)
str(call_data)

call_data$abb_sector <- substr(call_data$sector, 1, 1)
crime_data$abb_sector <- crime_data$sector

call_by_sector <- call_data %>%
  group_by(abb_sector, sector) %>%
  summarize(cnt_call = n()) %>%
  filter(sector != "NULL")

crime_by_sector <- crime_data %>%
  group_by(abb_sector) %>%
  summarize(cnt_crime = n())

combined <- left_join(call_by_sector, crime_by_sector, by = "abb_sector") %>%
  select(sector, abb_sector, cnt_crime, cnt_call) %>%
  mutate(call_to_crime_ratio = cnt_crime / cnt_call)

filter_num_crime_detail <- function(range){
  lower_bound <- range[1]
  upper_bound <- range[2]
  filter_combined <- combined %>% 
    filter(cnt_crime > lower_bound & cnt_crime < upper_bound)
  
  scatter_plot <- ggplot(data = filter_combined,
                         aes(x = sector, y = call_to_crime_ratio,
                             color = cnt_call,
                             size = cnt_crime)) +
    geom_point() +
    theme(axis.text.x = element_text(angle = 70)) +
    aes(x = reorder(sector, cnt_crime)) +
    labs(x = "Sector",
         y = "Crimes to Calls Ratio in Record",
         color = "Number of Calls",
         size = "Total Crimes in Record")
  
  scatter_plot
}

