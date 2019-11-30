server <- function(input, output) {

    output$plot1 <- renderPlot({
        graph_one
    })
    
    output$plot2 <- renderPlot({
        graph_two
    })
    
    output$plot3 <- renderPlot({
        graph_three
    })
    
}