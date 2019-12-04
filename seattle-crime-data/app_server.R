server <- function(input, output) {

  output$crimepic <- renderImage({
    return(list(
        src = "www/crimescene.jpg",
        filetype = "image/jpg",
        alt = "This is a crime scene in Seattle."
      ))
  }, deleteFile = FALSE)

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
    scatter_pl <- filter_num_crime_detail(
      input$crim_range, input$call_range)
    scatter_pl
  })

  output$ans_two <- renderUI({
    header_two <- strong("Answer to question 2:")
    content_two <- "Based on this scatterplot, it can be concluded
    that the there is a relationship between the number of 911 calls
    and crimes recorded in the police data log in each sector of Seattle
    (excluding the outlier Queen)."
    HTML(paste("<br/>", header_two, content_two, "<br/><br/>"))
  })

  output$plot3 <- renderPlotly({
    crime_data <- crime %>%
      filter(year == input$year_info) %>%
      group_by(Neighborhood) %>%
      summarise(sum = n())



    filtered_data <- plot_ly(
      x = crime_data$Neighborhood,
      y = crime_data$sum,
      name = "Crime",
      type = "bar",
      text = crime_data$Neighborhood,
      marker = list(
        color = "rgb(158,202,225)",
        line = list(
          color = "rgb(8,48,107)",
          width = 1.5
        )
      )
    ) %>%
      layout(
        title = "Crime Across Different Neighborhoods in Seattle",
        xaxis = list(title = ""),
        yaxis = list(title = "")
      )

    filtered_data
  })

  output$ans_three <- renderUI({
    header_three <- strong("Answer to question 3:")
    content_three <- "This graph demonstrates that the downtown
    commercial neighborhood has the most criminal activity in
    recent years. This graph allows users to visualize the
    number of crimes reported in Seattle neighborhoods by the
    reported year of the crime. The latest year is 2019.
    The option to allow users to view the number of crimes by
    year provides a general crime trend. Furthermore, users can
    examine how each neighborhood crime rate decreased/increased
    throughout the year."
    HTML(paste("<br/>", header_three, content_three, "<br/><br/>"))
  })
}
