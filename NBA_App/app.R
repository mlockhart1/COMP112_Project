
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


server <- function(input, output) {
    output$graph <- renderPlot({
        players_country %>% 
            filter(country == input$country,) %>% 
            
         
                ggplot(aes(x=fct_inorder(country), y=n)) +
                geom_bar(stat = "identity")+
                coord_flip()+
                labs(title = "Number of Players in the NBA per Country (Excluding the U.S.)", x= "Country", y = "Number of Players")
    })}


shinyApp(ui = ui, server = server)
