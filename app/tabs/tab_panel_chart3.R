# tab_panel_chart3

library(shiny)

feature_input <- selectInput(
  inputId = "chart3Input",
  label = "Metro/Nonmetropolitan",
  choices = c("Metroplitan" = "Metropolitan", "Nonmetropolitan" = "Nonmetropolitan"),
  selected = "Metropolitan"
)

tab_panel_chart3 <-tabPanel(
    "Chart 3",
    fluidPage(
      titlePanel(column(12, h3("  Difference in Life Expectancy at Birth between Metropolitan and Nonmetropolitan Counties"), align = "left")),
      br(),
      sidebarLayout(
        sidebarPanel(
          feature_input,
          width = 6
          ),
        mainPanel(
          br(),
          plotlyOutput("boxplot"),
          width = 6
        )
      )
    ),
    p("The boxplots are intended to answer our third research question: 
    How does life expectancy differ between metropolitan and non-metropolitan areas? 
    The boxplots reveal that the life expectancy at birth in metropolitan counties has a higher median of 78.084 years than the nonmetropolitan counties' median of 77.097 years.
    It is also important to notice that metropolitan counties have higher first quartile, median, third quartile, maximum, and minimum when compared to nonmetropolitan counties.
    From the interactive chart, we are able to conclude that people residing in metropolitan counties have an overall higher life expectancy at birth than those residing in nonmetropolitan counties.")
      
    )



