# Pokémon Assistant

## Functionality 
**Pokémon Search:**
  Search Pokémon by Name and various other filters.
  Filters include: Type, Generation and if the Pokémon is legendary or not.

**Pokémon Plot:**
  See how stats of your selected Pokémon compare with other Pokémon of the same type and other types on a boxplot. You can compare different stats of your selected Pokémon like speed, attack, etc. The red dot on      the plot is where the selected stat of the Pokémon you selected lies in comparison to the remaining Pokémon of the same type.
  To learn more about interpreting a boxplot refer to: https://builtin.com/data-science/boxplot

**Battle Recommendation System:**
  Get a better idea on which Pokémon to use for your Pokémon battles. Currently this feature only considers type advantages and multipliers of Pokémon. The table with recommended Pokémon lets you order the Pokémon based on any of the columns.

## Run Application 
```
if (!require("shiny")) install.packages("shiny")
library("shiny")
shiny::runGitHub("pokemon_assistant","avinxxsh")
```

# Shinyapp.io link
https://avinxxsh.shinyapps.io/r_shiny_project/

### Resources and Information 
  The dataset used consists of 721 Pokémon upto gen 6, providing details such as their name, primary and secondary types, as well as statistics like HP, Attack, Defense, Special Attack, Special Defense, and Speed
  
  Dataset: https://www.kaggle.com/datasets/abcsds/pokemon/data
