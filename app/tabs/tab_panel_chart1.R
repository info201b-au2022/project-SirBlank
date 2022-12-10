# tab_panel_chart1

library(shiny)
library(ggplot2)
library(dplyr)
library(plotly)

tab_panel_chart1 <-tabPanel(
  "Chart 1",
  fluidPage(
    sidebarLayout(
      sidebarPanel(
        radioButtons(
          inputId = "interest", label = h3("Determinants of Health"),
          choices = list(
            "Without Insurance Coverage",
            "Median Amount of Medical Debt",
            "Incomes",
            "Urbanicity as a Proportion of Metro Areas"
          ),
          selected = "Urbanicity as a Proportion of Metro Areas"
        ),
        "*All variables above help build a complete picture of financial determinants of health however median amount of medical debt is of most interest."
      ),
      mainPanel(
        plotlyOutput("inequities_map"),
        p("These four maps help us answer our second question in regards to 
        differences and inequities between metropolitan and non-metropolitan
        medical debt, and more generally the difference in financial determinants of health
        between these two types communities. For example, looking at general trends throughout
        the four maps, we see that metropolitan areas are largely concentrated on the two coasts
        while non-metropolitan areas are largerly concentrated in the mid-west and south of the
        country (less metropolitan states are lighter on the map).
        This trend is replicated to some extent in income distribution as well 
        because we see that though the mid-west has somewhat higher incomes, the south has
        some of the lowest incomes (lighter states have lower incomes on the map).
        The same trend is somewhat replicated in terms of lack of insurance coverage where many midwestern
        states have higher levels of those without insurance coverage than on the coasts and southern states
        with the least number of metropolitan areas lag the most in this category as well.
        In summary, we see that financial determinants of health lag the most in midwestern 
        and southern majority non-metropolitan states, with medical debt being much higher in these states.")
      )
    )
  )
)


