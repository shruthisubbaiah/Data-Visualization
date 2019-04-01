library(ggplot2)

ui <- fluidPage(
titlePanel("Application"),

mainPanel(
    tabsetPanel(type = "tabs",
                tabPanel("Personal Info", 
                fluidRow(column(4, textInput("text", label = "Name", value = "Enter text..."))),
                fluidRow(column(4, radioButtons("radio", label = "Gender", choices = list("Male" = 1, "Female" = 2, "Do not wish to identify" = 3),selected = 3))),
                fluidRow(column(4, numericInput("num1", label = "Age", value = 22))),
                fluidRow(column(4, selectInput("dropdown1", label = "Race", choices = list("American" = 1, "Asian" = 2, "Indian American" = 3, "Do not wish to identify" = 4), selected = 4)))
                ),
            
                tabPanel("Education", 
                fluidRow(column(4, textInput("text", label = "School Name", value = "Enter text..."))),
                fluidRow(column(4, selectInput("dropdown2", label = "Degree Level", choices = list("Under Graduate" = 1, "Graduate" = 2, "PhD" = 3), selected = 1))),
                fluidRow(column(4, numericInput("num2", label = "GPA", value = 0))),
                fluidRow(column(10, dateRangeInput("dates", label = "School attended from")))
                ),
                
                tabPanel("Experience", 
                fluidRow(column(6, sliderInput("slider1", label = "Total years of experience", min = 0, max = 50, step = 0.5, value = 0))),
                fluidRow(column(6, textInput("text", label = "Current Company", value = "Enter text...")),
                         column(6, dateInput("dates", label = "Working since"))
                        ),
                fluidRow(column(6, textInput("text", label = "Previous Company", value = "Enter text...")),
                         column(6, dateRangeInput("dates", label = "Worked from"))
                         )
                ),
                
                tabPanel("Review & Submit",
                fluidRow(column(10, checkboxInput("checkbox1", label = "Yes, I have read and consent to the terms and conditions", value = FALSE))),
                fluidRow(column(10, dateInput("date", label = "Enter today's Date"))),
                hr(),
                fluidRow(column(3, actionButton(inputId = "btn1",label="Submit")))
                )
)
)
)   

server <- function(input, output) {
  
}

shinyApp(ui = ui, server = server)