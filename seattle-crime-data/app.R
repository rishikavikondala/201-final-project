source("app_server.R")
source("app_ui.R")

library(plotly)
library(ggplot2)
library(styler)
library(lintr)
library(shiny)

shinyApp(ui = ui, server = server)