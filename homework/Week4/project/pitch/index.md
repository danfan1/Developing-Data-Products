---
title       : Building Data Product Project
subtitle    : 2018-05-23
author      : Ying Wai Fan
job         : 
framework   : landslide        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## The Shiny App

I built a shiny app to show how mathematical plots change with parameters.

Link: https://yingwaifan.shinyapps.io/Developing_Data_Product_Course_Project/

<img height=400px src="assets/img/line.png"></img>

---

## Two Tabs

The app has two tabs:

1. line: show how a line changes with slope and intercept.
2. sine: show how a sine curve changes with frequency, phase shift and amplitude.

<img height=400px src="assets/img/sine.png"></img>

---

## ui.R and server.R

I put several sliderInput's in ui.R to select parameter values.
Then in server.R, I use those parameter values to make mathematical plots.
I fix the plot coordinates to better show changes in the plots.

For example, the following is the code to generate the line plot.

```r
  output$plot1 <- renderPlot({
    x <- seq(-5, 5, length.out = 11)
    y <- input$m * x + input$c
    df <- data.frame(x=x, y=y)
    ggplot(df, aes(x, y)) + geom_line() +
      coord_fixed(1, xlim = c(-5,5), ylim = c(-5,5), expand = FALSE) +
      scale_x_continuous(breaks = -5:5) +
      scale_y_continuous(breaks = -5:5)
  })
```

---

## Example Line Plot

This is the line plot when slope (`input$m`) is 2 and intercept (`input$c`) is 1.
![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2-1.png)
`

---

## Example Sine Plot

This is the sine plot when frequency (`input$w`) is 2, phase shift (`input$theta`) is pi/2 and amplitude (`input$A`) is 3.
![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3-1.png)
