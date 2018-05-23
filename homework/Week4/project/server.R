library(shiny)
library(ggplot2)
shinyServer(function(input, output) {
  output$plot1 <- renderPlot({
    x <- seq(-5, 5, length.out = 11)
    y <- input$m * x + input$c
    df <- data.frame(x=x, y=y)
    ggplot(df, aes(x, y)) + geom_line() +
      coord_fixed(1, xlim = c(-5,5), ylim = c(-5,5), expand = FALSE) +
      scale_x_continuous(breaks = -5:5) +
      scale_y_continuous(breaks = -5:5)
  })
  output$plot2 <- renderPlot({
    x <- seq(-5, 5, length.out = 101)
    y <- input$A * sin(input$w * x + input$theta)
    df <- data.frame(x=x, y=y)
    ggplot(df, aes(x, y)) + geom_line() +
      coord_fixed(1, xlim = c(-5,5), ylim = c(-5,5), expand = FALSE) +
      scale_x_continuous(breaks = -5:5) +
      scale_y_continuous(breaks = -5:5)
  })
})
