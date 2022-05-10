install.packages("pacman")
library(pacman)
p_load(shiny,ggplot2)

ui <- fluidPage(
  titlePanel("the relationship of p and Q"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("A1","Advertisement",0,6000,3000),
      selectInput("month","Please choose the month",c(1,2,3,4,5,6,7,8,9,10,11,12),5),
      numericInput("A2","Coupon",2000),
      textInput("plottitle","the title of plot","May")),
    mainPanel(
      plotOutput("plot1")
    )
  ))