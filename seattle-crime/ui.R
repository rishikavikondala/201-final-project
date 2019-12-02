library(shiny)

ui <- fluidPage(
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
            h5("Question 1: ", strong(em("Where do violent crimes take place most often in the city of 
            Seattle?"))),
            p("Our first inquiry of interest are the most common areas in 
            Seattle where crimes occur. Amongst family, classmates, and friends, it is 
            well-known by now, that walking around in the dark city could potentially 
            lead one to undesired harm. Tracking where crimes are most likely to occur 
            helps us hone in on the more troublesome areas for civilians to especially 
            take caution in."),
            h5("Question 2: ", strong(em("Which category of crime is most prevalent in the 
            city of Seattle?"))),
            p("Following the assessment of the location of crimes, the 
            most prevalant types of crime must be anaylyzed hand in hand.  With insight on which 
            categories of crimes occur most often, and where, innocent pedestrians will be able 
            to properly prpare themselves for perhaps, a late night stroll. Understanding what 
            kind of harm may come your way, could serve very beneficial for defending oneself, 
            and avoiding running into danger."),
            h5("Question 3: ", strong(em("Is there any correlation between the frequency of crimes 
            and number of 911 calls throughout different areas of Seattle?"))),
            p("Last but not least, our project looks for the correlations
            between the number of 911 calls and frequency of crimes within Seattle. Police
            departments often receive false alarms, unneccsary reports, and unrealistic claims
            that ultimately, waste everyone's time. Faulty or petty 911 calls could distract
            officers from very important tasks and even break a lead on actual crime. Patterns 
            found in the displayed data could reveal if there is enough action being taken against
            crime (through 911 calls) in the areas where there is more criminal activity occuring.")
        ),
        tabPanel("Question 1",
            plotOutput("plot1")
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