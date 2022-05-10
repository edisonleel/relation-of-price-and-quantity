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