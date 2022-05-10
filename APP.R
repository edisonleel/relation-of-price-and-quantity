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

server <- function(input,output,session) {
  p <- seq(0,100,0.01)
  q <- reactive({
    -11.59*p-10.60*as.numeric(input$month)+0.04*input$A1+0.002*input$A2+550.42
  })
  dataset1 <- reactive({data.frame(p,q())})
  output$plot1 <- renderPlot({
    ggplot(dataset1(),aes(p,q()))+geom_line(size=1)+labs(x='price',y='quantity',title = input$plottitle)
  })
}

shinyApp(ui,server)