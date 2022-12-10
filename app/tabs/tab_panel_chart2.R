# tab_panel_chart2

library(shiny)
library(plotly)
library(ggplot2)
library(thematic)


checkBox <- radioButtons(
  "checkbox",
  label = p("Metro/Nonmetropolitan"),
  choices = c("Metropolitan" = "Metropolitan", "Nonmetropolitan" = "Nonmetropolitan"),
  selected = "Metropolitan" # how do you select two of them at first
)

thematic::thematic_shiny()
tab_panel_chart2 <-tabPanel(
    "Chart 2",
    column(12, h3("Difference in HSPA between Metropolitan and Nonmetropolitan Counties"), align = "center"),
    br(),
    fluidPage(
      sidebarLayout(
        sidebarPanel(
          checkBox
        ),
        mainPanel(
          plotlyOutput("pie_chart") 
        )
      ),
      p("The two pie charts are intended to answer our second research question: How do metropolitan counties compare to nonmetropolitan counties in the United States in regards to HPSA, Health Professional Shortage Area?",
        "The charts show the relationship between the HPSA, the Health Professional Shortage Area,",
        "and metropolitan and nonmetropolitan areas. The chart reveals that in nonmetropolitan areas,",
        "73.46% of the counties are HPSA in the whole county, and 24.15% of the counties are HPSA",
        "in part of the county, and only 2.39% is not a health professional shortage area. However,",
        "in the metropolitan area, only 47.2% of the counties are HPSA in the whole county,",
        "43.8% of the counties are HPSA in part of the county, and 9% is not a HPSA.",
        "From the data, we are able to conclude that the nonmetropolitan area has a higher",
        "rate of Health Professional Shortage Area than metropolitan area. ")
    )
)
    

