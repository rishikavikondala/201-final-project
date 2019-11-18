library(httr)
library(jsonlite)
library(dplyr)

uri1 <- "https://data.seattle.gov/resource/3xqu-vnum.json"
response1 <- GET(uri1)
response_text1 <- content(response1, "text")
data1 <- fromJSON(response_text1)

uri2 <- "https://data.seattle.gov/resource/33kz-ixgy.json"
response2 <- GET(uri2)
response_text2 <- content(response2, "text")
data2 <- fromJSON(response_text2)

uri3 <- "https://data.seattle.gov/resource/4fs7-3vj5.json"
response3 <- GET(uri3)
response_text3 <- content(response3, "text")
data3 <- fromJSON(response_text3)


## by location
data1$abb_sector <- data1$sector
one_by_loc <- data1 %>%
  group_by(abb_sector) %>%
  summarize(num_crimes = n())

data2$abb_sector <- substr(data2$sector, 1, 1)

two_by_loc <- data2 %>%
  group_by(abb_sector) %>%
  summarize(num_calls = n()) %>%
  select(abb_sector, num_calls)

data3$abb_sector <- substr(data3$sector, 1, 1)

three_by_loc <- data3 %>%
  group_by(abb_sector) %>%
  summarize(num_crime_reported = n()) %>%
  select(abb_sector, num_crime_reported)
  
agg_table <- left_join(one_by_loc, two_by_loc, by = "abb_sector")
