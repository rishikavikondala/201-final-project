library(dplyr)

chart_1 <- read.csv("midpoint/2008 seattle crime stats.csv")
chart_2 <- read.csv("midpoint/Call_Data.csv")
chart_3 <- read.csv("midpoint/Crime_Data.csv")

## by location
one_by_loc <- chart_1 %>%
  group_by(Sector) %>%
  summarize(amount = n())

two_by_loc <- chart_2 %>%
  group_by(Sector) %>%
  summarize(amount = n())

three_by_loc <- chart_3 %>%
  group_by(Sector) %>%
  summarize(amount = n())

## by crimes 
one_by_type <- chart_1 %>%
  group_by(CRIME_TYPE) %>%
  summarize(amount = n()) %>%
  filter(amount == max(amount))

two_by_type <- chart_2 %>%
  mutate(type = gsub(" .*$", "", gsub("-", "", Final.Call.Type))) %>%
  group_by(type) %>%
  summarize(amount = n()) %>%
  filter(amount == max(amount))

three_by_type <- chart_3 %>%
  group_by(Crime.Subcategory) %>%
  summarize(amount = n()) %>%
  filter(amount == max(amount))

## 911 calls
calls <- chart_2 %>%
  group_by(Call.Type) %>%
  summarize(amount = n()) %>%
  filter(Call.Type == "911")

## crimes by month, check for correlation
crimes_by_month <- chart_3 %>%
  mutate(month = substr(Occurred.Date, 1, 2)) %>%
  group_by(month) %>%
  summarize(amount = n()) 




