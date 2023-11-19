library(shiny)
source("ui.R", local = TRUE)
source("server.R", local = TRUE)
source("test.R")

shinyApp(ui = ui, server = server)
