# tab_panel_summary

library(shiny)
library(bslib)
library(plotly)
library(tidyverse)
library(thematic)

thematic::thematic_shiny()
tab_panel_summary <-tabPanel(
    "Summary",
    column(12, h1("Summary"), align = "center"),
    br(),
    sidebarLayout(position = "right",
    mainPanel(
      p("To address our three main questions, we explored three variables that are related to one's physical well-being and access to healthcare services: life expectancy, medical debt, and health professional shortages. 
        We then compared these variables between metropolitan and non-metropolitan counties and concluded these three summary takeaways from our interactive charts:"),
      tags$ul(
        tags$li("Nonmetropolitan areas or less metropolitan states, particularly in the midwestern and southern states, have lower level of insurance coverage and have a higher median of medical debt when compared to metropolitan counties."),
        tags$li("Nonmetropolitan counties have a higher percentage of primary care health professional shortages when compared to metropolitan counties."),
        tags$li("Nonmetropolitan counties have an overall higher life expectancy at birth when compated to metropolitan counties.")
      ),
      width = 6
    
    ),
    sidebarPanel(
      # fluidRow(
      #   splitLayout(cellWidths = c("50%", "50%"), plotOutput("non_metro"), plotOutput("metro"))
      # )
      plotlyOutput("non_metro", width = "100%", height = "400px"),
      plotlyOutput("metro", width = "100%", height = "400px"),
      width = 6
    )
    )
)

