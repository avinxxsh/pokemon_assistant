library(tidyverse)

data <- read.csv("data/Pokemon.csv")

type_effectiveness <- data.frame(
  def_type = c("Normal", "Fire", "Water", "Electric", "Grass", "Ice", "Fighting", "Poison", "Ground", "Flying", "Psychic", "Bug", "Rock", "Ghost", "Dragon", "Dark", "Steel", "Fairy"),
  Normal = c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0.5, 0, 1, 1, 0.5, 1),
  Fire = c(1, 0.5, 0.5, 1, 2, 2, 1, 1, 1, 1, 1, 2, 0.5, 1, 0.5, 1, 2, 1),
  Water = c(1, 2, 0.5, 1, 0.5, 1, 1, 1, 2, 1, 1, 1, 2, 1, 0.5, 1, 1, 1),
  Electric = c(1, 1, 2, 0.5, 0.5, 1, 1, 1, 0, 2, 1, 1, 1, 1, 0.5, 1, 1, 1),
  Grass = c(1, 0.5, 2, 1, 0.5, 1, 1, 0.5, 2, 0.5, 1, 0.5, 2, 1, 0.5, 1, 0.5, 1),
  Ice = c(1, 0.5, 0.5, 1, 2, 0.5, 1, 1, 2, 2, 1, 1, 1, 1, 2, 1, 0.5, 1),
  Fighting = c(2, 1, 1, 1, 1, 2, 1, 0.5, 1, 0.5, 0.5, 0.5, 2, 0, 1, 2, 2, 0.5),
  Poison = c(1, 1, 1, 1, 2, 1, 1, 0.5, 0.5, 1, 1, 1, 0.5, 0.5, 1, 1, 0, 2),
  Ground = c(1, 2, 1, 2, 0.5, 1, 1, 2, 1, 0, 1, 0.5, 2, 1, 1, 1, 2, 1),
  Flying = c(1, 1, 1, 0.5, 2, 1, 2, 1, 1, 1, 1, 2, 0.5, 1, 1, 1, 0.5, 1),
  Psychic = c(1, 1, 1, 1, 1, 1, 2, 2, 1, 1, 0.5, 1, 1, 1, 1, 0, 0.5, 1),
  Bug = c(1, 0.5, 1, 1, 2, 1, 0.5, 0.5, 1, 0.5, 2, 1, 1, 0.5, 1, 2, 0.5, 0.5),
  Rock = c(1, 2, 1, 1, 1, 2, 0.5, 1, 0.5, 2, 1, 2, 1, 1, 1, 1, 0.5, 1),
  Ghost = c(0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 2, 1, 0.5, 1, 1),
  Dragon = c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 0.5, 0),
  Dark = c(1, 1, 1, 1, 1, 1, 0.5, 1, 1, 1, 2, 1, 1, 2, 1, 0.5, 1, 0.5),
  Steel = c(1, 0.5, 0.5, 0.5, 1, 2, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 0.5, 2),
  Fairy = c(1, 0.5, 1, 1, 1, 1, 2, 0.5, 1, 1, 1, 1, 1, 1, 2, 2, 0.5, 1)
)

type_effectiveness_transposed <- data.frame(
  def_type = c("Normal", "Fire", "Water", "Electric", "Grass", "Ice", "Fighting", "Poison", "Ground", "Flying", "Psychic", "Bug", "Rock", "Ghost", "Dragon", "Dark", "Steel", "Fairy"),
  Normal = c(1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1),
  Fire = c(1, 0.5, 2, 0.5, 0.5, 0.5, 1, 1, 2, 1, 1, 2, 1, 1, 1, 1, 0.5, 0.5),
  Water = c(1, 0.5, 0.5, 2, 2, 0.5, 1, 1, 1, 1, 1, 0.5, 2, 1, 1, 1, 0.5, 1),
  Electric = c(1, 1, 0.5, 0.5, 1, 2, 1, 1, 0.5, 0.5, 1, 1, 1, 1, 1, 1, 0.5, 1),
  Grass = c(1, 2, 0.5, 0.5, 0.5, 1, 1, 2, 0.5, 2, 1, 2, 1, 1, 1, 1, 1, 1),
  Ice = c(1, 2, 1, 1, 1, 2, 0.5, 1, 1, 1, 1, 1, 0.5, 2, 1, 1, 0.5, 1),
  Fighting = c(1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 0.5, 1, 0.5, 1, 0.5, 1, 2),
  Poison = c(1, 1, 1, 1, 0.5, 1, 0.5, 0.5, 2, 1, 1, 0.5, 1, 1, 1, 1, 1, 0.5),
  Ground = c(1, 1, 2, 0, 2, 2, 1, 0.5, 1, 1, 1, 1, 0.5, 1, 1, 1, 1, 1),
  Flying = c(1, 1, 1, 2, 0.5, 1, 0.5, 2, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1),
  Psychic = c(1, 1, 1, 1, 2, 1, 0.5, 1, 1, 1, 0.5, 2, 1, 1, 1, 2, 1, 1),
  Bug = c(1, 2, 1, 1, 0.5, 1, 0.5, 1, 0.5, 1, 2, 1, 1, 2, 1, 2, 1, 1),
  Rock = c(0.5, 0.5, 2, 1, 2, 1, 0.5, 1, 2, 0.5, 1, 0.5, 1, 1, 1, 1, 2, 1),
  Ghost = c(0, 1, 1, 1, 1, 2, 1, 1, 1, 2, 1, 1, 1, 1, 1, 2, 1, 2),
  Dragon = c(1, 0.5, 1, 1, 0.5, 2, 1, 1, 1, 1, 1, 2, 1, 1, 2, 1, 1, 2),
  Dark = c(1, 1, 1, 1, 0.5, 1, 0.5, 1, 1, 1, 0.5, 1, 1, 1, 1, 2, 1, 0.5),
  Steel = c(1, 2, 1, 1, 2, 1, 1, 0.5, 1, 1, 1, 1, 1, 1, 0.5, 0.5, 0.5, 1),
  Fairy = c(1, 1, 1, 1, 1, 1, 0.5, 2, 1, 1, 1, 1, 1, 1, 0.5, 1, 2, 1)
) 

colnames(type_effectiveness) <- gsub("^\\s+|\\s+$", "", colnames(type_effectiveness))

# Function to get effective types for a given defending type
getEffectiveTypes <- function(defender_type) {
  # Filter the type_effectiveness for the selected defender_type
  effectiveness <- type_effectiveness[type_effectiveness$def_type == defender_type, ]
  
  # Get the types with effectiveness greater than 1
  effective_types <- colnames(effectiveness[, effectiveness > 1])
  
  return(effective_types)
}
