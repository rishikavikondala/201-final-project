library(dplyr)
library(stringr)
library(ggplot2)
library(httr)
library(jsonlite)

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

#call_data <- read.csv(file = "data/Call_Data.csv", stringsAsFactors = FALSE)
#crime_data <- read.csv("./data/crime_data.csv")

######################### Scatter Plot #######################

call_data$abb_sector <- substr(call_data$sector, 1, 1)
crime_data$abb_sector <- crime_data$sector

call_by_sector <- call_data %>%
  group_by (abb_sector, sector) %>%
  summarize(cnt_call = n()) %>%
  filter(sector != "NULL")

crime_by_sector <- crime_data %>%
  group_by (abb_sector) %>%
  summarize(cnt_crime = n())

combined <- left_join(call_by_sector, crime_by_sector, by = "abb_sector") %>%
  select (sector, abb_sector, cnt_crime, cnt_call) %>%
  mutate(call_to_crime_ratio = cnt_crime / cnt_call)

scatter_plot <- ggplot(data = combined,
                     aes(x = sector, y = call_to_crime_ratio, 
                         color = cnt_call,
                         size = cnt_crime)) +
  geom_point() + 
  theme(axis.text.x = element_text(angle = 70)) +
  aes(x = reorder(sector, cnt_crime)) +
  labs(x="Sector", 
       y="Crimes to Calls Ratio in Record",
       color = "Number of Calls",
       size = "Total Crimes in Record")


######################## Pie Chart Experimentation ##################


call_type <- call_data %>%
  group_by (initial_call_type) %>%
  summarize (
    cnt = n()
  ) %>%
  select (initial_call_type, cnt) 

condensed_call_type <- top_n(call_type, n = 15, wt = cnt)
condensed_call_type$gen_type <- gsub("-.*","",condensed_call_type$initial_call_type)
condensed_call_type$gen_type <- gsub("\\(.*","",condensed_call_type$gen_type)
condensed_call_type$gen_type <- gsub(",.*","",condensed_call_type$gen_type)
#condensed_call_type$gen_type <- gsub("[[:blank:]]","\n",condensed_call_type$gen_type)

pie_chart <- ggplot(data = condensed_call_type, 
                    aes(x = gen_type, y = cnt, fill = gen_type)) +
  geom_bar(stat = "identity") +
  coord_polar() +
  aes (x=reorder(gen_type, cnt)) +
  theme(axis.text.x = element_text(angle = -30)) +
  labs(x="Initial Call Types", 
       y="Number of Calls",
       fill= "Initial Call Types")


#This data comes from Seattle Police Department's Communications Center's record of log calls, 
#including 911 calls, etc.The pie chart shows the top 10 most common Initial Call Type received 
#from 2008 to present day. Of these call types, the most common ones are simple Premise Checks 
#and Traffic Violations. However, there are also more serious crimes such as Burglary and Narcotics. 
