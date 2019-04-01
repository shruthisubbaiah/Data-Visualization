library(shiny)

ui <- fluidPage(
  titlePanel("Start your application here", windowTitle = "Application"),
  fluidRow(
    column(3, textInput("text", label = "Enter your name", value = "Enter text...")),
    column(3, radioButtons("radio", label = "Gender", choices = list("Male" = 1, "Female" = 2, "Do not wish to identify" = 3),selected = 3)),
    column(3, numericInput("num", label = "Enter your age", value = 22)),
    column(3, selectInput("dropdown", label = "Race", choices = list("American" = 1, "Asian" = 2, "Indian American" = 3, "Do not wish to identify" = 4), selected = 4))
  ),
  hr(),
  fluidRow(
    column(3, dateRangeInput("dates", label = "School attended from")),
    column(3, fileInput("file", label = "Upload your Resume")),
    column(3, checkboxGroupInput("checkbox2", "Preferred Locations:", choices = list("Boston, MA","New York City, NY" ,"San Jose, CA")))
  ),
  hr(),
  fluidRow(
    column(3, sliderInput("slider1", label = "Total years of experience", min = 0, max = 50, step = 0.5, value = 0)),
    column(3, sliderInput("slider2", label = "Expected Salary", min = 0, max = 300, value = c(100, 150)))
  ),
  hr(),
  fluidRow(
    column(3, checkboxInput("checkbox1", label = "Yes, I have read and consent to the terms and conditions", value = FALSE)),
    column(3, dateInput("date", label = "Enter today's Date")),
    column(3, actionButton(inputId = "btn1",label="Submit"))
  ),
  hr()
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  #output$value <- renderText("Application")
}

shinyApp(ui = ui, server = server)
