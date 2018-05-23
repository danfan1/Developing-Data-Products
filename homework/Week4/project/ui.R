library(shiny)
shinyUI(fluidPage(
  titlePanel("How Mathematical Plots Change with Parameters"),
  h3("Change the parameter values and see how the plot changes"),
  tabsetPanel(
    tabPanel(
      "Line",
      h3("y = m * x + c"),
      sidebarLayout(
        sidebarPanel(
          sliderInput("m", "Slope (m)", value = 2, min = -5, max = 5, step = 1),
          sliderInput("c", "Intercept (c)", value = 1, min = -5, max = 5, step = 1)
        ),
        mainPanel(
          plotOutput("plot1")
        )
      )
    ),
    tabPanel(
      "Sine",
      h3("y = A * sin(w * x + theta)"),
      sidebarLayout(
        sidebarPanel(
          sliderInput("w", "Frequency (w)", value = 1, min = -5, max = 5, step = 1),
          sliderInput("theta", "Phase Shift (theta)", value = 0, min = -2*pi, max = 2*pi, step = pi/2),
          sliderInput("A", "Amplitude (A)", value = 1, min = -5, max = 5, step = 1)
        ),
        mainPanel(
          plotOutput("plot2")
        )
      )
    )
  )
))

