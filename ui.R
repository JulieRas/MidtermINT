library(shiny)
shinyUI(fluidPage(
  titlePanel("Event Study of Thailand"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("sliderMPG", "Events", 10, 35, value = 20),
      checkboxInput("showEvent1", "Show/Hide Event 1", value = TRUE),
      checkboxInput("showEvent2", "Show/Hide Event 2", value = TRUE),
      checkboxInput("showEvent3", "Show/Hide Event 3", value = TRUE)
    ),
    mainPanel(
      plotOutput("plot1")
    )
  )
))