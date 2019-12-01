library(shiny)

ui <- fluidPage(
    titlePanel("Analysis of the City of Seattle's Police Reports"),
    sidebarLayout(
        sidebarPanel(
            h6("Question 1: In which precinct of Seattle do crimes
                most often occur?"),
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
                        tabPanel("Project Overview", 
                                 img(src='seattlecrime.png', height = 200, width = 350), 
                                 htmlOutput("overview")),
                        tabPanel("Question 1", br(), 
                                 plotlyOutput("plot1"), 
                                 htmlOutput("ans_one")),
                        tabPanel("Question 2", plotOutput("plot2")),
                        tabPanel("Question 3", plotOutput("plot3")),
                        tabPanel("Summary Takeaways", plotOutput("summary"))
            ),
        )
    )
)