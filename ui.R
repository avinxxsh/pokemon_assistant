# ui.R
library(shiny)
library(shinythemes)
source("functions.R")

shinyUI(
  fluidPage(
    theme = shinytheme("simplex"),
    navbarPage("Pokémon Database",
               tabPanel("Search Database",
                        sidebarPanel(
                          h3("Pokémon Search"),
                          selectInput("search_input", "Search:", choices = unique(data$Name)),
                          selectInput("filter_category", "Filter by Type:", 
                                      choices = c("None", unique(data$Type1)),
                                      selected = "None"
                        ),
                          selectInput("filter_category_2", "Legendary Pokémon:", 
                                      choices = c("None", unique(data$Legendary)),
                                      selected = "None"
                        ),
                          selectInput("filter_category_3", "Pokémon Generation:", 
                                     choices = c("None", unique(data$Generation)),
                                     selected = "None"
                        ),
                          actionButton("search_button", "Search"),
                        ),
                        mainPanel(
                          tableOutput("search_results")
                        )
                        
               ),
               tabPanel("Boxplot",
                        sidebarLayout(
                          sidebarPanel(
                            h2(""),
                            selectInput("selected_pokemon", "Select Pokémon:", choices = unique(data$Name)),
                            selectInput("selected_statistic", "Select Statistic:", 
                                        choices = c("HP", "Attack", "Defense", "Speed"),
                                        selected = "HP"),
                            actionButton("submit_button", "Submit"),
                          ),
                          mainPanel(
                            plotOutput("boxplot")
                          )
                        )
               ),
               
               tabPanel("Battle Guide",
                        sidebarLayout(
                          sidebarPanel(
                            h2("Battle Guide"),
                            selectInput("selected_pokemon_battle", "Select Pokémon:", choices = unique(data$Name)),
                            actionButton("recommend_button", "Recommend Pokémon"),
                          ),
                          mainPanel(
                            textOutput("battle_recommendations"),
                            dataTableOutput("all_pokemon_table")
                          )
                        )
               )
    )
  )
)

