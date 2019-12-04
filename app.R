source("scripts/graphone.R")
source("scripts/graphtwo.R")
source("scripts/analysis.R")
source("seattle-crime-data/app_server.R")
source("seattle-crime-data/app_ui.R")

library(plotly)
library(ggplot2)
library(styler)
library(lintr)
library(shiny)

shinyApp(ui = ui, server = server)