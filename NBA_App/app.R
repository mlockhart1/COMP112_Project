
#Objective: 
    #Create an app that allows people to select a country, and see the visualization for both draft position and number of players.
   # Ideally, someone can select a country and see both visualizations at once.
    # Choose countries from a list of the countries available in dataset.
    # Ability to choose two countries for comparison





library(shiny)
library(readr)
library(tidyverse)
library(dplyr)
library(rsconnect)
players_country

# Define UI for application that draws a histogram
ui <- fluidPage(
    selectInput(inputId = "country", label = "Country", choices = list(Canada,
                                                                       Croatia,
                                                                       Spain,
                                                                       Brazil,
                                                                       Lithuania,
                                                                       Greece,
                                                                       Russia,
                                                                       Slovenia,
                                                                       Turkey,
                                                                       Australia,
                                                                       Nigeria,
                                                                       Senegal,
                                                                       Serbia,
                                                                       `Serbia and Montenegro`,
                                                                       Ukraine,
                                                                       Georgia,
                                                                       Germany,
                                                                       Montenegro,
                                                                       Argentina,
                                                                       Cameroon,
                                                                       China,
                                                                       `Czech Republic`,
                                                                       `Democratic Republic of the Congo`,
                                                                       `Dominican Republic`,
                                                                       Italy,
                                                                       Latvia,
                                                                       Congo,
                                                                       Haiti,
                                                                       Jamaica,
                                                                       Mali,
                                                                       Netherlands,
                                                                       `New Zealand`,
                                                                       Poland,
                                                                       Sweden,
                                                                       Switzerland,
                                                                       Yugoslavia,
                                                                       Austria,
                                                                       Bahamas,
                                                                       Bosnia,
                                                                       `Bosnia & Herzegovina`,
                                                                       `Cabo Verde`,
                                                                       Finland,
                                                                       Gabon,
                                                                       Ghana,
                                                                       `Great Britain`,
                                                                       Israel,
                                                                       Mexico,
                                                                       `Puerto Rico`,
                                                                       Scotland,
                                                                       `South Korea`,
                                                                       `South Sudan`,
                                                                       `St. Vincent & Grenadines`,
                                                                       Tanzania,
                                                                       `United Kingdom`,
                                                                       `US Virgin Islands`,
                                                                       Venezuela
                                                                       )), 
    plotOutput(outputId = "graph"))

    # Application title
    titlePanel("Old Faithful Geyser Data")

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
