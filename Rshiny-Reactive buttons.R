library(shiny)

# Define UI for app that draws a histogram ----
ui <- fluidPage(
  titlePanel("Problem 1"),
  fluidRow(
    column(3,sliderInput(inputId = "num",
                  label = "Choose the number",
                  min = 1,
                  max = 1000,
                  value = 30)),
    column(3,radioButtons("dist", "Distribution type:",
               c("Normal" = "norm",
                 "Uniform" = "unif"))),
    column(3,actionButton(inputId = "btn",label="Update"))),
    
    plotOutput(outputId = "distPlot"),
    verbatimTextOutput("stats")
    
)

# Define server logic required to draw a histogram ----
server <- function(input, output) {

  data<-eventReactive(input$btn,switch(input$dist,norm = rnorm(input$num),unif = runif(input$num)))
  output$distPlot <- renderPlot({
    hist(data(),ylab="Frequency",xlab="variable")
  })
  
  output$stats <- renderPrint({
    summary(data())
  })
}

shinyApp(ui = ui, server = server)