library(dplyr)

crime <- read.csv(file="data/crime_data.csv", stringsAsFactors = FALSE, 
                  fileEncoding="UTF-8-BOM")

len <- nchar(crime$Occurred.Date)[1]
crime <- crime %>% mutate(year = substr(Occurred.Date, len - 3, len))
years <- unique(crime$year)
years <- years[years != ""] %>% sort(decreasing = TRUE)



