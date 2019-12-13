
#Objective: 
    #Create an app that allows people to select a country, and see the graphs for both draft position and number of players.
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
    selectInput(inputId = "country", label = "Country", choices = list(France,
                                                                       Canada,
                                                                       Croatia,
                                                                       Brazil,
                                                                       Spain,
                                                                       Argentina,
                                                                       Lithuania,
                                                                       Australia,
                                                                       Russia,
                                                                       Senegal,
                                                                       Serbia,
                                                                       Slovenia,
                                                                       Greece,
                                                                       Turkey,
                                                                       Ukraine,
                                                                       Germany,
                                                                       Nigeria,
                                                                       `Puerto Rico`,
                                                                       `Serbia and Montenegro`,
                                                                       China,
                                                                       `Democratic Republic of the Congo`,
                                                                       `Dominican Republic`,
                                                                       Georgia,
                                                                       Italy,
                                                                       Montenegro,
                                                                       Yugoslavia,
                                                                       Cameroon,
                                                                       `Czech Republic`,
                                                                       Jamaica,
                                                                       Latvia,
                                                                       Mexico,
                                                                       Poland,
                                                                       Bosnia,
                                                                       Congo,
                                                                       England,
                                                                       Haiti,
                                                                       Israel,
                                                                       Mali,
                                                                       Netherlands,
                                                                       `New Zealand`,
                                                                       Sweden,
                                                                       Switzerland,
                                                                       Venezuela,
                                                                       Austria,
                                                                       Bahamas,
                                                                       Belize,
                                                                       `Bosnia & Herzegovina`,
                                                                       `Cabo Verde`,
                                                                       Finland,
                                                                       Gabon,
                                                                       Ghana,
                                                                       `Great Britain`,
                                                                       Iran,
                                                                       Ireland,
                                                                       Macedonia,
                                                                       Panama,
                                                                       Scotland,
                                                                       `South Korea`,
                                                                       `South Sudan`,
                                                                       `St. Vincent & Grenadines`,
                                                                       `Sudan (UK)`,
                                                                       Tanzania,
                                                                       Tunisia,
                                                                       `U.S. Virgin islands`,
                                                                       `United Kingdom`,
                                                                       Uruguay,
                                                                       `US Virgin Islands`,
                                                                       USSR
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
