#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

first_page <- tabPanel(
    "Introduction Page",
    sidebarLayout(
        sidebarPanel(
            
        )
    )
    
)

ui <- navbarPage(
    "final deliverable",
    first_page
)
