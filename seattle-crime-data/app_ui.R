library(lintr)

ui <- fluidPage(
  includeCSS("style.css"),
  navbarPage(
    "Analysis of the City of Seattle's Police Reports",
    tabPanel(
      "Project Overview",
      div(strong(h1("Crime in Seattle")), style = "text-align: center;"),
      div(img(src = "seattlecrime.png",
          height = 250, width = 500),
          style = "text-align: center;"),
      h4("Explored Datasets:"),
      p("We utilized three different datasets released onto Seattle.gov
      by the Seattle Police Department: one regarding records of criminal
      activity, another entailing information on calls to 911, and a
      dataset showcasing reported—via calling—or detected crimes. Within
      our explored data, there is information on details such as the
      location of incidents, Police Sectors that got involved, what type
      of crime was called in, along with many other records that may
      provide insight on a particular event/report. Evaluating all three
      datasets side by side reveal patterns of where certain crimes will be
      most prevalant; such patterns will then become a lot easier for the
      Police to detect and track, ensuring optimal civilian safety.
      Furthermore, anyone with access to this project, will have visual
      aids to inform them of the more dangerous locations to be more
      careful about."),
      h5("Question 1: ", strong(em("
      Where do violent crimes take place most often in the city of Seattle?"))),
      p("Our first inquiry of interest are the most common areas in
      Seattle where crimes occur. Amongst family, classmates,
      and friends, it is well-known by now, that walking around
      in the dark city could potentially lead one to undesired harm.
      Tracking where crimes are most likely to occur helps us hone in
      on the more troublesome areas for civilians to especially
      take caution in."),
      h5("Question 2: ", strong(em(
      "Is there a relationship between the frequency of crimes
      and number of 911 calls throughout different areas of Seattle?"))),
      p("Last but not least, our project looks for
      the correlations between the number of 911 calls
      and frequency of crimes within Seattle. Police
      departments often receive false alarms, unneccsary
      reports, and unrealistic claims that ultimately
      waste everyone's time. Faulty or petty 911 calls
      could distract officers from very important tasks
      and even break a lead on actual crime. Patterns
      found in the displayed data could reveal if there
      is enough action being taken against crime
      (through 911 calls) in the areas where there
      is more criminal activity occuring."),
      h5("Question 3: ", strong(em(
      "How do the numbers of reported crimes in different
      Seattle neighborhoods vary across several years?"))),
      p("This question looks to determine not simply
      a general area in Seattle that is more
      dangerous; rather, it is meant to identify
      which residential community the riskiest to
      live in. Seattle is a highly populous city
      that is booming with career opportunities,
      and people will want to make sure that they
      are entering a safe neighborhood if they live
      there or move there for their job or education.
      Simultaneously, police would want to provide
      more protection in these areas to fight back
      against criminal activity.")
    ),
    tabPanel(
      "Question 1",
      sidebarLayout(
        sidebarPanel(
          h5(
            "Question 1: ",
            strong(em("Where do violent crimes take place most often in the
                        city of Seattle?"))
          ),
          radioButtons("plot_type", "Plot type", c("Barplot", "Scaled pie")),
        ),
        mainPanel(
          plotOutput("plot1"),
          uiOutput("ans_one")
        )
      )
    ),
    tabPanel(
      "Question 2",
      sidebarLayout(
        sidebarPanel(
          h5(
            "Question 2: ",
            strong(em(
            "Is there a relationship between the frequency of crimes
            and number of 911 calls throughout
            different areas of Seattle?"))
          ),
          sliderInput(
            inputId = "crim_range",
            label = h3("Total Crimes in Record"),
            min = 0, max = 90, value = c(30, 80)
          ),

          sliderInput(
            inputId = "call_range",
            label = h3("Number of Calls"),
            min = 0, max = 100, value = c(0, 100)
          )
        ),
        mainPanel(
          plotOutput("plot2"),
          uiOutput("ans_two")
        )
      )
    ),
    tabPanel(
      "Question 3",
      sidebarLayout(
        sidebarPanel(
          h5(
            "Question 3: ",
            strong(em(
            "How do the numbers of reported crimes in
            different Seattle neighborhoods
            vary across several years?"))
          ),
          selectInput(
            "year_info",
            label = "year",
            choices = years,
            selected = "2018"
          )
        ),
        mainPanel(
          plotlyOutput("plot3"),
          uiOutput("ans_three")
        )
      )
    ),
    tabPanel(
      "Summary Findings",
      p("One major takeaway from this project is that the
      Northern precinct of Seattle has the highest
      concentration of criminal activity in recent years.
      This insight is meaningful because the police
      department can use this knowledge to place more
      officers in the Northern areas of Seattle. Another
      major takeaway from this project is that there is
      a trend with regards to the areas that have more criminal
      activity and the areas with more 911 calls. This is a
      valuable insight since it shows that people are being
      proactive in combating criminal activity and are taking
      the initiative to stand up for the safety of themselves
      and others. A final takeaway from this project is that,
      for the past 12 years, the downtown commercial
      neighborhood in Seattle has experienced the most criminal
      activity.This is significant because people who are
      making housing decisions can factor in the safety of a
      community while determining where to get a property.
      Additionally, police can take further necessary action to
      make this community, and other neighborhoods with high
      criminal activity into safer places for everyone.")
    )
  )
)
