# Find number of crimes per precinct from 2008-Present
precinct_totals <- crime_data %>%
    group_by(Precinct) %>%
    count()

graph_one <- plot_ly(precinct_totals, labels = ~Precinct, values = ~n, type = 'pie') %>%
    layout(title = 'Crimes Per Precinct from 2008 to 2014',
           xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
           yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))

graph_one_alt <- ggplot(
    data = precinct_totals, aes(x = Precinct, y = n, fill = Precinct)) +
    geom_bar(stat = "identity") +
    coord_polar() +
    ggtitle("Crimes Per Precinct from 2008 to Present Day")

server <- function(input, output) {
    
    output$plot1 <- renderPlot({
        "plot1" <- graph_one_alt
    })
    
    output$ans_one <- renderUI({
        header_one <- strong("Answer to question 1:")
        content_one <- "Based on this pie chart, it can be concluded that
        the Northern precinct of Seattle experienced the most criminal activity
        from 2008 to present day."
        HTML(paste("<br/>", header_one, content_one, "<br/><br/>")) 
    })
    
    output$plot2 <- renderPlot({
        graph_two
    })
    
    output$plot3 <- renderPlot({
        graph_three
    })
}