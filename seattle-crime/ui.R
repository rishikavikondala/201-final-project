library(shiny)

ui <- fluidPage(
    
    titlePanel("Analysis of the City of Seattle's Police Reports"),
    
    sidebarLayout(
        
        sidebarPanel(
            h6("Question 1: Where do violent crimes take place most often 
               in the city of Seattle?"),
            h6("Question 2: Which category of crime is most prevalent 
               in the city of Seattle?"),
            h6("Question 3: Is there an alignment between the frequency of crimes 
               and 911 calls in the different areas of Seattle?"),
            
            radioButtons("dist", "Distribution type:",
                         c("Normal" = "norm",
                           "Uniform" = "unif",
                           "Log-normal" = "lnorm",
                           "Exponential" = "exp")),
            br(),
            sliderInput("n",
                        "Number of observations:",
                        value = 500,
                        min = 1,
                        max = 1000)
            
        ),
        
        mainPanel(
            
            tabsetPanel(type = "tabs",
                        tabPanel("Project Overview", verbatimTextOutput("overview")),
                        tabPanel("Question 1", plotOutput("plot1")),
                        tabPanel("Question 2", plotOutput("plot2")),
                        tabPanel("Question 3", plotOutput("plot3")),
                        tabPanel("Summary Takeaways", plotOutput("summary"))
            ),
            
            img(src = "seattlecrime.png", height = 200, width = 350),
            h3("What our data entails: "),
            h5("Question 1:"),
            p("Our first inquiries of interest are the most common areas in Seattle
                where crimes occur. Amongst family, classmates, 
                and friends, it is well-known by now, that walking around in the 
                dark city could potentially lead one to undesired harm.Tracking where 
                crimes are most likely to occur helps us hone in on the more troublesome 
                areas for civilians to especially take caution in."),
            h5("Question 2:"),
            p("Following the assessment of the location of crimes, the most prevalant 
                types of crime must be anaylyzed hand in hand.  With insight on which
                categories of crimes occur most often, and where, innocent pedestrians 
                will be able to properly prpare themselves for perhaps, a late night
                stroll. Understanding what kind of harm may come your way, could
                serve very beneficial for defending oneself, and avoiding running
                into danger."),
            h5("Question 3:"),
            p("Last but not least, our project looks for the correlations between
                the number of 911 calls and frequency of crimes within Seattle. ")
        )
    )
)