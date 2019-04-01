#Sidebar Layout


library(shiny)
library(ggplot2)

df<-data.frame(Year = 2000:2010,
               Pop_uk=c(59.38,59.61,59.84,60.07,60.37,60.73,61.10,61.50,61.90,62.25,62.61),
               Pop_us=c(282.17,285.08,287.80,290.32,293.04,295.75,298.59,301.57,304.37,307,310.23),
               Pop_ind=c(1006.30,1023.29,1040.28,1057.25,1074.15,1090.97,1107.62,1124.13,1140.56,1156.89,1173.10)
)

ui<-fluidPage(
  titlePanel("Problem 2- Different Layouts showing Population distribution of a country, over the years"),
  sidebarLayout(
    # Has a side bar panel and a Main panel
    sidebarPanel(
      h3("Sidebar"),
      radioButtons("country", "Choose country",
                   c("UK" = "uk",
                     "USA" = "usa",
                     "India"="ind")),
      actionButton(inputId = "p",label="Plot")
    ),
    
    mainPanel(
      h3("Country population over the years"),
      plotOutput(outputId = "plot1")
    )
  ),
  hr(),
  splitLayout(
    #Everything is placed horizontally, the space is split equally 
    h3("Split layout:"),
    radioButtons("country2", "Choose country",
                c("UK" = "uk",
                  "USA" = "usa",
                  "India"="ind")),
    actionButton(inputId = "p2",label="Plot"),
    plotOutput(outputId = "plot2")

  ),
  hr(),
  verticalLayout(
    #One below the other
    h3("Vertical Layout:"),
    radioButtons("country3", "Choose country",
                 c("UK" = "uk",
                  "USA" = "usa",
                  "India"="ind")),
    actionButton(inputId = "p3",label="Plot"),
    plotOutput(outputId = "plot3")
  )
)
server <- function(input, output) {
  data1<-eventReactive(input$p,switch(input$country,uk = df$Pop_uk,usa = df$Pop_us,ind=df$Pop_ind))
  data2<-eventReactive(input$p2,switch(input$country2,uk = df$Pop_uk,usa = df$Pop_us,ind=df$Pop_ind))
  data3<-eventReactive(input$p3,switch(input$country3,uk = df$Pop_uk,usa = df$Pop_us,ind=df$Pop_ind))
  
  output$plot1 <- renderPlot({
    plot(df$Year,data1(),xlab="Year",ylab="population(thousands)")
  })
  
  output$plot2<-renderPlot(({
    plot(df$Year,data2(),xlab="Year",ylab="population(thousands)")
  }))
  output$plot3<-renderPlot(({
    plot(df$Year,data3(),xlab="Year",ylab="population(thousands)")
  }))
}

shinyApp(ui, server)
