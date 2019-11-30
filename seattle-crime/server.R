server <- function(input, output) {

    output$crime <- renderImage({
        #img(src = "seattlecrime.png", height = 200, width = 350)
    })
    
    output$overview <- renderUI({
        header_one <- paste("Question 1:")
        content_one <- paste("Our first inquiries of interest are the most common areas in 
        Seattle where crimes occur. Amongst family, classmates, and friends, it is 
        well-known by now, that walking around in the dark city could potentially 
        lead one to undesired harm.Tracking where crimes are most likely to occur 
        helps us hone in on the more troublesome areas for civilians to especially 
        take caution in.")
        header_two <- paste("Question 2:")
        content_two <- paste("Following the assessment of the location of crimes, the 
        most prevalant types of crime must be anaylyzed hand in hand.  With insight on which 
        categories of crimes occur most often, and where, innocent pedestrians will be able 
        to properly prpare themselves for perhaps, a late night stroll. Understanding what 
        kind of harm may come your way, could serve very beneficial for defending oneself, 
        and avoiding running into danger.")
        header_three <- paste("Question 3:")
        content_three <- paste("Last but not least, our project looks for the correlations
        between the number of 911 calls and frequency of crimes within Seattle.")
        HTML(paste(header_one, content_one, 
                   header_two, content_two, 
                   header_three, content_three, sep = '<br/>'))
    })
    
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