source("../scripts/graphone.R")
source("../scripts/graphtwo.R")
library(plotly)
library(ggplot2)

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
    includeCSS("style.css"),
    navbarPage("Analysis of the City of Seattle's Police Reports",
        tabPanel("Project Overview", 
            div(strong(h3("Crime in Seattle")), style = "text-align: center;"),
            div(img(src='seattlecrime.png', height = 250, width = 500), style = "text-align: center;"),
            h4("Explored Datasets:"),
            p("We utilized three different datasets released onto Seattle.gov by the Seattle Police
            Department: one regarding records of criminal activity, another entailing information
            on calls to 911, and a dataset showcasing reported—via calling—or detected crimes. Within
            our explored data, there is information on details such as the location of incidents,
            Police Sectors that got involved, what type of crime was called in, along with many 
            other records that may provide insight on a particular event/report. Evaluating all
            three datasets side by side reveal patterns of where certain crimes will be 
            most prevalant; such patterns will then become a lot easier for the Police to detect 
            and track, ensuring optimal civilian safety. Furthermore, anyone with access to this
            project, will have visual aids to inform them of the more dangerous locations to be
            avoided."),
            h5("Question 1: ", strong(em("Where do violent crimes take place most often in the 
            city of Seattle?"))),
            p("Our first inquiry of interest are the most common areas in 
            Seattle where crimes occur. Amongst family, classmates, and friends, it is 
            well-known by now, that walking around in the dark city could potentially 
            lead one to undesired harm. Tracking where crimes are most likely to occur 
            helps us hone in on the more troublesome areas for civilians to especially 
            take caution in."),
            h5("Question 2: ", strong(em("Is there a relationship between the frequency of crimes 
            and number of 911 calls throughout different areas of Seattle?"))),
            p("Last but not least, our project looks for the correlations
            between the number of 911 calls and frequency of crimes within Seattle. Police
            departments often receive false alarms, unneccsary reports, and unrealistic claims
            that ultimately, waste everyone's time. Faulty or petty 911 calls could distract
            officers from very important tasks and even break a lead on actual crime. Patterns 
            found in the displayed data could reveal if there is enough action being taken against
            crime (through 911 calls) in the areas where there is more criminal activity occuring."),
            h5("Question 3: ", strong(em("At what time of day do crimes occur most often?"))),
            p("This question looks to determine which part of an average day has the highest amount
            of criminal activity. Insights gained from answering this question can help identify
            when it is not risky to be out and when it is better to remain in a safe place.")),
        tabPanel("Question 1",
            sidebarLayout(
                sidebarPanel(
                    h5("Question 1: ", 
                        strong(em("Where do violent crimes take place most often in the 
                        city of Seattle?"))),
                    radioButtons("plot_type", "Plot type", c("Barplot", "Scaled pie")),
                ),
                mainPanel(
                    plotOutput("plot1"),
                    uiOutput("ans_one")
                )
            )
        ),
        tabPanel("Question 2",
            sidebarLayout(
                sidebarPanel(
                    h5("Question 2: ", 
                        strong(em("Is there a relationship between the frequency of crimes 
                        and number of 911 calls throughout different areas of Seattle?"))),
                    sliderInput(inputId = "crim_range",
                        label = h3("Total Crimes in Record"),
                        min = 0, max = 90, value = c(30, 80)),
                         
                    sliderInput(inputId = "call_range",
                        label = h3("Number of Calls"),
                        min = 0, max = 100, value = c(0, 100))
                     ),
                mainPanel(
                    plotOutput("plot2")
                )
            )
        ),
        tabPanel("Question 3",
            sidebarLayout(
                sidebarPanel(
                    h5("Question 3: ", 
                        strong(em("At what time of day do crimes occur most often?"))),
                ),
                mainPanel(
                    plotOutput("plot3")
                )
            )
        ),
        tabPanel("Summary Findings",
        p("One major takeaway from this project is that the Northern precinct of Seattle
        has the highest concentration of criminal activity in recent years. This insight
        is meaningful because the polce department can use this knowledge to place more
        officers in the Northern areas of Seattle. Another major takeaway from this 
        project is that there is a trend with regards to the areas that have more criminal
        activity and the areas with more 911 calls. This is a valuable insight since it
        shows that people are being proactive in combating criminal activity and are 
        taking the initiative to stand up for the safety of themselves and others. A 
        final takeaway from this project is that [insert here]. This is significant because [insert here]. ")
        )
    )
)

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
}

shinyApp(ui = ui, server = server)
