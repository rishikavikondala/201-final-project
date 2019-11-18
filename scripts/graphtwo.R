library(dplyr)
library(stringr)
library(ggplot2)
library(httr)
library(jsonlite)

uri <- "https://data.seattle.gov/resource/33kz-ixgy.json"

response <- GET(uri)

response_text <- content(response, "text")
call_data <- fromJSON(response_text)

is.data.frame(response_data)
str(response_data)

#call_data <- read.csv(file = "data/Call_Data.csv", stringsAsFactors = FALSE)
#crime_data <- read.csv("./data/crime_data.csv")

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
