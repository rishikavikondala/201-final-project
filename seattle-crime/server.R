# Find number of crimes per precinct from 2008-Present
precinct_totals <- crime_data %>%
    group_by(Precinct) %>%
    count()

graph_one <- plot_ly(precinct_totals, labels = ~Precinct, values = ~n, type = 'pie') %>%
    layout(title = 'Crimes Per Precinct from 2008 to Present Day',
           xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
           yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))

server <- function(input, output) {

    output$overview <- renderUI({
        header_one <- strong("Question 1:")
        content_one <- "Our first inquiry of interest are the most common areas in 
        Seattle where crimes occur. Amongst family, classmates, and friends, it is 
        well-known by now, that walking around in the dark city could potentially 
        lead one to undesired harm. Tracking where crimes are most likely to occur 
        helps us hone in on the more troublesome areas for civilians to especially 
        take caution in."
        header_two <- strong("Question 2:")
        content_two <- "Following the assessment of the location of crimes, the 
        most prevalant types of crime must be anaylyzed hand in hand.  With insight on which 
        categories of crimes occur most often, and where, innocent pedestrians will be able 
        to properly prpare themselves for perhaps, a late night stroll. Understanding what 
        kind of harm may come your way, could serve very beneficial for defending oneself, 
        and avoiding running into danger."
        header_three <- strong("Question 3:")
        content_three <- "Last but not least, our project looks for the correlations
        between the number of 911 calls and frequency of crimes within Seattle. Police
        departments often receive false alarms, unneccsary reports, and unrealistic claims
        that ultimately, waste everyone's time. Faulty or petty 911 calls could distract
        officers from very important tasks and even break a lead on actual crime. Patterns 
        found in the displayed data could reveal if there is enough action being taken against
        crime (through 911 calls) in the areas where there is more criminal activity occuring."
        header_four <- h4(em(strong("Explored Datasets: ")))
        content_four <- "We utilized three different datasets released by the Seattle Police
        Department: one regarding records of criminal activity, another entailing information
        on calls to 911, and a dataset showcasing reported or detected crimes."
        HTML(paste("<br/>", header_one, content_one, "<br/><br/>", 
                   header_two, content_two, "<br/><br/>",
                   header_three, content_three, "<br/><br/>",
                   header_four, content_four))
    })
    
    # Each page should revolve around a specific question you have of 
    # your dataset. Each page should have sufficient interactivity 
    # (e.g., Shiny widgets + 1 or more reactive charts) for exploring
    # the question of interest.
    
    output$plot1 <- renderPlotly({
        graph_one
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