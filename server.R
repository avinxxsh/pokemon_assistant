source("functions.R")
source("ui.R")

server <- function(input, output) {
  # data <- read.csv("data/Pokemon.csv")
  
  # MODULE 1 - POKEMON SEARCH
  
  observeEvent(input$search_button, {
    keyword <- input$search_input
    selected_category <- input$filter_category
    selected_category_2 <- input$filter_category_2
    selected_category_3 <- input$filter_category_3
    
    # data <- read.csv("data/Pokemon.csv")
    matched_data <- subset(data, grepl(keyword, Name, ignore.case = TRUE))
    # matched_data <- subset(data, Name %in% keyword)

    if (selected_category != "None") {
      filtered_data <- matched_data[matched_data$Type2 == selected_category | 
                                      matched_data$Type1 == selected_category, ]
    } else {
      filtered_data <- matched_data
    }

    if (selected_category_2 == "TRUE") {
      filtered_data <- filtered_data[filtered_data$Legendary == "TRUE", ]
    } else if (selected_category_2 == "FALSE") {
      filtered_data <- filtered_data[filtered_data$Legendary == "FALSE", ]
    } else {
      filtered_data <- filtered_data
    }
    
    if (selected_category_3 == 1) {
      filtered_data <- filtered_data[filtered_data$Generation == 1, ]
    } else if (selected_category_3 == 2) {
      filtered_data <- filtered_data[filtered_data$Generation == 2, ]
    } else if (selected_category_3 == 3) {
      filtered_data <- filtered_data[filtered_data$Generation == 3, ]
    } else if (selected_category_3 == 4) {
      filtered_data <- filtered_data[filtered_data$Generation == 4, ]
    } else if (selected_category_3 == 5) {
      filtered_data <- filtered_data[filtered_data$Generation == 5, ]
    } else if (selected_category_3 == 6) {
      filtered_data <- filtered_data[filtered_data$Generation == 6, ]
    } else {
      filtered_data <- filtered_data
    }

    output$search_results <- renderTable({
      if (nrow(filtered_data) > 0) {
        filtered_data
      } else {
        "ERROR: No matching Pokémon found."
      }
    })
  })

  # MODULE 2 - BOXPLOT
  
  observeEvent(input$submit_button, {
    
    selected_pokemon <- input$selected_pokemon
    selected_statistic <- input$selected_statistic
    
    selected_pokemon_data <- data %>%
      filter(Name == selected_pokemon)
    
    same_type_pokemon_data <- data %>%
      filter(Type1 %in% c(selected_pokemon_data$Type1, selected_pokemon_data$Type2) | 
               Type2 %in% c(selected_pokemon_data$Type1, selected_pokemon_data$Type2))
    
    average_stats <- same_type_pokemon_data %>%
      group_by(Type1, Type2, .drop = FALSE) %>%
      summarise_at(vars(selected_statistic), mean, na.rm = TRUE)
    
    combined_stats <- rbind(average_stats, selected_pokemon_data)
    
    output$boxplot <- renderPlot({
    
      ggplot(combined_stats, aes(x = Type1, y = !!as.name(selected_statistic), fill = Type1)) +
      geom_boxplot() +
      geom_point(data = combined_stats[combined_stats$Name == selected_pokemon, ],
                 aes(x = Type1, y = !!as.name(selected_statistic)), color = "red", size = 3) +
      labs(title = paste("Statistics for", selected_pokemon),
           x = "Type", y = selected_statistic) +
      theme_minimal()
    })
  })
  
  # MODULE 3 - Battle Recommendation System
  
  observeEvent(input$selected_pokemon_battle, {
    selected_pokemon <- input$selected_pokemon_battle
    print(paste("Selected Pokémon:", selected_pokemon))
    
    pokemon_types <- data[data$Name == selected_pokemon, c("Type1", "Type2")]
    pokemon_types <- unlist(pokemon_types)
    pokemon_types <- pokemon_types[!is.na(pokemon_types)]  # Remove NAs
    print(paste("Pokémon Types:", paste(pokemon_types, collapse = ", ")))
    
    colnames(type_effectiveness) <- gsub("^\\s+|\\s+$", "", colnames(type_effectiveness))
    
    effective_types <- character(0)
    
    for (pokemon_type in pokemon_types) {
      effectiveness <- type_effectiveness[type_effectiveness$def_type == pokemon_type, ]
      effective_types <- c(effective_types, colnames(effectiveness)[effectiveness > 1 & colnames(effectiveness) != "def_type"])
    }
    
    effective_types <- unique(effective_types)
    
    effective_types <- setdiff(effective_types, pokemon_types)
    
    print(paste("Effective Types:", paste(effective_types, collapse = ", ")))
    
    output$battle_recommendations <- renderText({
      if (length(effective_types) > 0) {
        paste("Recommended Pokémon types against", selected_pokemon, ":", paste(effective_types, collapse = ", "))
      } else {
        "No specific recommendations."
      }
    })
    all_pokemon <- data[data$Type1 %in% effective_types | data$Type2 %in% effective_types, ]
    
    output$all_pokemon_table <- renderDataTable({
      datatable(all_pokemon)
    })
  })

}
    
  
  
  
  
    





