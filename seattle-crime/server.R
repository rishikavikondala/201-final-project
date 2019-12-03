<<<<<<< HEAD
source("../scripts/graphone.R")
source("../scripts/graphtwo.R")
library(plotly)
library(ggplot2)

server <- function(input, output) {
    
    output$plot1 <- renderPlot({
        if (input$plot_type == "Scaled pie") {
            graph_one
        }
        else if (input$plot_type == "Barplot") {
            graph_one_alt
        }
    })
    
    output$ans_one <- renderUI({
        header_one <- strong("Answer to question 1:")
        content_one <- "Based on this pie chart, it can be concluded that
        the Northern precinct of Seattle experienced the most criminal activity
        from 2008 to present day."
        HTML(paste("<br/>", header_one, content_one, "<br/><br/>")) 
    })
    
    output$plot2 <- renderPlot({
        scatter_pl <- filter_num_crime_detail(input$crim_range, input$call_range)
        scatter_pl
    })
    
    output$plot3 <- renderPlot({
        graph_three
    })
=======
source("../scripts/graphone.R")
source("../scripts/graphtwo.R")
#source("../scripts/graphthree.R")
library(plotly)
library(ggplot2)

server <- function(input, output) {
    
    output$plot1 <- renderPlot({
        if (input$plot_type == "Scaled pie") {
            graph_one
        }
        else if (input$plot_type == "Barplot") {
            graph_one_alt
        }
    })
    
    output$ans_one <- renderUI({
        header_one <- strong("Answer to question 1:")
        content_one <- "Based on this pie chart, it can be concluded that
        the Northern precinct of Seattle experienced the most criminal activity
        from 2008 to present day."
        HTML(paste("<br/>", header_one, content_one, "<br/><br/>")) 
    })
    
    output$plot2 <- renderPlot({
        scatter_pl <- filter_num_crime_detail(input$crim_range, input$call_range)
        scatter_pl
    })
    
    output$plot3 <- renderPlot({
        graph_three
    })
>>>>>>> 286c661afcee3d2b2eaefe16335444f5816c7466
}