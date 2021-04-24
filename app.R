#https://s2032914.shinyapps.io/w7_shiny_tutorial/
#https://www.shinyapps.io/admin/#/applications/all

library(shiny)

ui <- fluidPage(

    titlePanel("Calculate Circle Area"),

    sidebarPanel(
        sliderInput(
            inputId = "radius", 
            label = "Select radius", 
            value = 10, min = 1, max = 100
        )
    ),
    mainPanel(
        h4('Formula: A= 3.14 * r^2'),
        h4('Area='),
        textOutput("area")
    )
)

area <- function(radius) radius^2 * 3.14

server<- function(input, output) {
    output$area <- renderPrint({area(input$radius)})
}


shinyApp(ui = ui, server = server)
