library(shiny)

ui <- fluidPage(
    navbarPage("Analysis of the City of Seattle's Police Reports",
        tabPanel("Project Overview",
            img(src='seattlecrime.png', height = 125, width = 275), 
            h5("Question 1:"),
            p("Our first inquiry of interest are the most common areas in 
            Seattle where crimes occur. Amongst family, classmates, and friends, it is 
            well-known by now, that walking around in the dark city could potentially 
            lead one to undesired harm. Tracking where crimes are most likely to occur 
            helps us hone in on the more troublesome areas for civilians to especially 
            take caution in."),
            h5("Question 2:"),
            p("Following the assessment of the location of crimes, the 
            most prevalant types of crime must be anaylyzed hand in hand.  With insight on which 
            categories of crimes occur most often, and where, innocent pedestrians will be able 
            to properly prpare themselves for perhaps, a late night stroll. Understanding what 
            kind of harm may come your way, could serve very beneficial for defending oneself, 
            and avoiding running into danger."),
            h5("Question 3:"),
            p("Last but not least, our project looks for the correlations
            between the number of 911 calls and frequency of crimes within Seattle. Police
            departments often receive false alarms, unneccsary reports, and unrealistic claims
            that ultimately, waste everyone's time. Faulty or petty 911 calls could distract
            officers from very important tasks and even break a lead on actual crime. Patterns 
            found in the displayed data could reveal if there is enough action being taken against
            crime (through 911 calls) in the areas where there is more criminal activity occuring."),
            h4("Explored Datasets:"),
            p("We utilized three different datasets released by the Seattle Police
            Department: one regarding records of criminal activity, another entailing information
            on calls to 911, and a dataset showcasing reported or detected crimes.")
        ),
        tabPanel("Question 1",
            # sidebarLayout(
            #     sidebarPanel(
            #         radioButtons("type_one", "Pie chart type:",
            #                      c("Standard" = "norm",
            #                        "Scaled" = "exp")),
            #     ),
            #     mainPanel(
            #         plotlyOutput("plot1")
            #     )
            # )
            plotlyOutput("plot1")
        ),
        tabPanel("Question 2",
            sidebarLayout(
                sidebarPanel(

                ),
                mainPanel(
                    plotlyOutput("plot2")
                )
            )
        ),
        tabPanel("Question 3",
            sidebarLayout(
                sidebarPanel(
                                  
                ),
                mainPanel(
                    plotlyOutput("plot3")
                )
            )
        ),
        tabPanel("Summary Findings",
            sidebarLayout(
                sidebarPanel(
                                  
                ),
                mainPanel(
                    plotlyOutput("plot2")
                )
        )
        )
    )
)