#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(bslib)
library(plotly)
library(tidyverse)
library(stringr)
library(rjson)
library(RColorBrewer)
library(openintro)


# chart 1 data wrangling

medical_debt <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-SirBlank/main/data/Medical_Debt.csv")
# Dataset with metro non-metro classifications
rurality <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-SirBlank/main/data/Health_Professional_Shortage_Areas__Primary_Care_by_County_3.csv")
# Reformat location names for easy join between datasets
rurality <- rurality %>%
  mutate(state_name = state.name[match(rurality$state_abbr, state.abb)]) %>%
  mutate(location_name = paste(county_name, ", ", state_name, sep = ""))
# Specific columns of interest for join filtered in from rurality dataset
working_rurality <- rurality %>%
  select(location_name, metro_nonmetro)
# Identifying and renaming columns of interest
# for medical debt along with GEOID
working_medical_debt <- medical_debt %>%
  select(NAME, 
         X..population.without.health.insurance..2019..ACS.,
         Average.household.income..2019..ACS.,
         Median.Medical.Debt.in.Collections..All,
         state_name
  ) %>%
  rename(location_name = NAME, 
         without_insurance = X..population.without.health.insurance..2019..ACS., 
         med_medical_debt = Median.Medical.Debt.in.Collections..All,
         income = Average.household.income..2019..ACS.
  )


working_medical_debt <- left_join(working_medical_debt, rurality, by = "location_name")

working_medical_debt$metro_nonmetro <- ifelse(working_medical_debt$metro_nonmetro =="Metropolitan",1,0)
working_medical_debt <- working_medical_debt %>%
  mutate(med_medical_debt = as.integer(med_medical_debt)) %>%
  group_by(state_abbr) %>%
  summarise(urbanicity = mean(metro_nonmetro, na.rm = TRUE),
            income = mean(income, na.rm = TRUE),
            without_insurance_mean = mean(without_insurance, na.rm = TRUE),
            medical_debt = mean(med_medical_debt, na.rm = TRUE))


colnames(working_medical_debt) <- c(
  "States",
  "Urbanicity as a Proportion of Metro Areas",
  "Incomes",
  "Without Insurance Coverage",
  "Median Amount of Medical Debt"
)



# chart 2 data wrangling
hpsap_data <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-SirBlank/main/data/Health_Professional_Shortage_Areas__Primary_Care_by_County_3.csv")

metro_nonmetro_hpsap <- hpsap_data %>% 
  group_by(metro_nonmetro)

nonmetro_count <- metro_nonmetro_hpsap %>% 
  filter(metro_nonmetro == "Nonmetropolitan") %>% 
  summarize(num = n())

nonmetro_hpsap <- metro_nonmetro_hpsap %>% 
  filter(metro_nonmetro == "Nonmetropolitan") %>% 
  group_by(value) %>% 
  summarize(num = n()) %>% 
  mutate("proportion" = num / nonmetro_count$num * 100) %>% 
  mutate("Nonmetropolitan" = "Nonmetropolitan")

metro_count <- metro_nonmetro_hpsap %>% 
  filter(metro_nonmetro == "Metropolitan") %>% 
  summarize(num = n())

metro_hpsap <- metro_nonmetro_hpsap %>% 
  filter(metro_nonmetro == "Metropolitan") %>% 
  group_by(value) %>% 
  summarize(num = n()) %>% 
  mutate("proportion" = num / metro_count$num * 100) %>% 
  mutate("Metropolitan" = "Metropolitan")

pie_metro_data <- data.frame(
  group = metro_hpsap$value,
  value = metro_hpsap$proportion,
  labels = paste(round(metro_hpsap$proportion, 2), "%"),
  metro_nonmetro = metro_hpsap$Metropolitan
)

pie_nonmetro_data <- data.frame(
  group = nonmetro_hpsap$value,
  value = nonmetro_hpsap$proportion,
  labels = paste(round(nonmetro_hpsap$proportion, 2), "%"),
  metro_nonmetro = nonmetro_hpsap$Nonmetropolitan
)

pie_data <- data.frame(
  rbind(pie_metro_data, pie_nonmetro_data)
)

# chart 3 data wrangling 
life_expectancy_at_birth <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-SirBlank/main/data/Life_Expectancy_at_Birth.csv")
health_professional_shortage_area <- read_csv("https://raw.githubusercontent.com/info201b-au2022/project-SirBlank/main/data/Health_Professional_Shortage_Areas__Primary_Care_by_County_3.csv")
state_to_abbreviation <- read_csv("https://raw.githubusercontent.com/info201b-au2022/project-SirBlank/main/data/state_to_abbreviation.csv")

state_to_abbreviation <- state_to_abbreviation %>%
  rename("state_abbr" = "code")

health_professional_shortage_area$state_name <- state_to_abbreviation$state[match(health_professional_shortage_area$state_abbr, state_to_abbreviation$state_abbr)]
health_professional_shortage_area <- health_professional_shortage_area[, c(1, 2, 3, 7, 4, 5, 6)]

colnames(life_expectancy_at_birth)[2] = "county_name"

life_expectancy_at_birth <- life_expectancy_at_birth %>%
  separate(col = county_name, into = c("A", "state_name"), sep = "[(]", remove = FALSE)

life_expectancy_at_birth$A <- NULL

life_expectancy_at_birth$state_name <- gsub("[)]", "", life_expectancy_at_birth$state_name)

life_expectancy_at_birth$county_name <- gsub("\\s* \\([^\\)]+\\)", "", life_expectancy_at_birth$county_name)

life_expectancy_at_birth <- merge(x = life_expectancy_at_birth, y = health_professional_shortage_area, by = c("county_name", "state_name"), all.x = TRUE)

life_expectancy_at_birth <- life_expectancy_at_birth[, c(1, 2, 11, 3, 4, 5, 6, 7, 8, 9, 10, 12, 13, 14, 15)]

test_data <- life_expectancy_at_birth %>%
  filter(race_name == "Total", age_name == "<1 year")

# calculate average life expectancy for metro and nonmetro counties
mean_metro <- test_data %>%
  filter(metro_nonmetro == "Metropolitan") %>%
  summarize(mean = mean(val))
mean_metro

mean_nonmetro <- test_data %>%
  filter(metro_nonmetro == "Nonmetropolitan") %>%
  summarize(mean = mean(val, na.rm = TRUE))
mean_nonmetro

# server
server <- function(input, output) {
  
  # chart 1
  output$inequities_map <- renderPlotly({
    fig <- plot_geo(data = working_medical_debt)
    if (input$interest == "Without Insurance Coverage") {
      fig <- fig %>% add_trace(
        z = ~working_medical_debt[[input$interest]],
        locations = ~States,
        locationmode = "USA-states",
        color = ~working_medical_debt[[input$interest]],
        colors = "Reds",
        hovertemplate = paste0("Proportion without insurance in",
                               working_medical_debt[["States"]],
                               ": ",
                               "<br>",
                               round(working_medical_debt[[input$interest]],
                                     digits = 2),
                               "<extra></extra>")
      ) %>%
        colorbar(title = "Insurance Coverage") %>%
        layout(
          geo = list(scope = "usa"),
          title = paste0("US State Distribution of ", input$interest),
          paper_bgcolor = "#FFF6E1",
          plot_bgcolor = "#FFF6E1"
        )
    } else if (input$interest == "Median Amount of Medical Debt") {
      fig <- fig %>% add_trace(
        z = ~working_medical_debt[[input$interest]],
        locations = ~States,
        locationmode = "USA-states",
        color = ~working_medical_debt[[input$interest]],
        colors = "Reds",
        hovertemplate = paste0("Median Medical Debt in ", 
                               working_medical_debt[["States"]],
                               " ($): ", 
                               "<br>",
                               round(working_medical_debt[[input$interest]],
                                     digits = 2),
                               "<extra></extra>")
      ) %>%
        colorbar(title = "Medical Debt") %>%
        layout(
          geo = list(scope = "usa"),
          title = paste0("US State Distribution of ", input$interest),
          paper_bgcolor = "#FFF6E1",
          plot_bgcolor = "#FFF6E1"
        )
    } else if (input$interest == "Urbanicity as a Proportion of Metro Areas") {
      fig <- fig %>% add_trace(
        z = ~working_medical_debt[[input$interest]],
        locations = ~States,
        locationmode = "USA-states",
        color = ~working_medical_debt[[input$interest]],
        colors = "Reds",
        hovertemplate = paste0("Urbanicity as a Prop of Metro Areas in ",
                               working_medical_debt[["States"]],
                               ": ", 
                               "<br>",
                               round(working_medical_debt[[input$interest]],
                                     digits = 2),
                               "<extra></extra>")
      ) %>%
        colorbar(title = "Urbanicity") %>%
        layout(
          geo = list(scope = "usa"),
          title = paste0("US State Distribution of ", input$interest),
          paper_bgcolor = "#FFF6E1",
          plot_bgcolor = "#FFF6E1"
        )
    } else {
      fig <- fig %>% add_trace(
        z = ~working_medical_debt[[input$interest]],
        locations = ~States,
        locationmode = "USA-states",
        color = ~working_medical_debt[[input$interest]],
        colors = "Reds",
        hovertemplate = paste0("Average Income in ",
                               working_medical_debt[["States"]],
                               " ($): ", 
                               "<br>",
                               round(working_medical_debt[[input$interest]],
                                     digits = 2),
                               "<extra></extra>")
      ) %>%
        colorbar(title = "Income") %>%
        layout(
          geo = list(scope = "usa"),
          title = paste0("US State Distribution of ", input$interest),
          paper_bgcolor = "#FFF6E1",
          plot_bgcolor = "#FFF6E1"
        )
    }
    
    fig <- fig %>%
      layout(paper_bgcolor='rgba(0,0,0,0)',
             plot_bgcolor='rgba(0,0,0,0)')
  })
  
  
  # chart 2
  chart2_filtered <- reactive({
    pie_data %>%
      filter(metro_nonmetro == input$checkbox)
  })
  
  output$pie_chart <- renderPlotly({
    chart_2 <- plot_ly(chart2_filtered(),
                       labels = ~group,
                       values = ~value,
                       type = 'pie'
                       ) %>%
      layout(paper_bgcolor = "#FFF6E1",
             plot_bgcolor = "#FFF6E1")
    
    if (input$checkbox == "Nonmetropolitan") {
      chart_2 <- chart_2 %>%
        layout(title = 'Health Professional Shortage Area in Nonmetropolitan US Counties') %>%
        add_trace(
          type = "pie",
          hovertemplate = "%{label}: <br>Percentage: %{percent}")
    } else if (input$checkbox == "Metropolitan") {
      chart_2 <- chart_2 %>%
        layout(title = 'Health Professional Shortage Area in Metropolitan US Counties') %>%
        add_trace(
          type = "pie",
          hovertemplate = "%{label}: <br>Percentage: %{percent}")
      
    }
  
  })
  
  # chart 3
  test_filtered <- reactive({
    test_data %>%
      filter(metro_nonmetro == input$chart3Input)
  })
  
  output$boxplot <- renderPlotly({
    chart <- plot_ly(
      test_filtered(), y = ~val, type = "box", color = input$chart3Input
    ) %>%
      layout(xaxis = list(title = "", showticklabels = T),
             yaxis = list(title = "Years"),
             paper_bgcolor = "#FFF6E1",
             plot_bgcolor = "#FFF6E1")
    if (input$chart3Input == "Nonmetropolitan") {
      chart <- chart %>%
        layout(title = "Life Expectancy at Birth in Nonmetropolitan US Counties")
    } else {
      chart <- chart %>%
        layout(title = "Life Expectancy at Birth in Metropolitan US Counties")
    }
    return(chart)
  })
  
  #render plots for summary
  output$non_metro <- renderPlotly({
    chart <- plot_ly(pie_nonmetro_data,
                       labels = ~group,
                       values = ~value,
                       type = 'pie'
    ) %>%
      layout(paper_bgcolor = "#FFF6E1",
             plot_bgcolor = "#FFF6E1")
    
      chart <- chart %>%
        layout(title = 'Health Professional Shortage Area in Nonmetropolitan') %>%
        add_trace(
          type = "pie",
          hovertemplate = "%{label}: <br>Percentage: %{percent}")
      return(chart)
  })
  
  output$metro <- renderPlotly({
    chart <- plot_ly(pie_metro_data,
                     labels = ~group,
                     values = ~value,
                     type = 'pie'
    ) %>%
      layout(paper_bgcolor = "#FFF6E1",
             plot_bgcolor = "#FFF6E1")
    
    chart <- chart %>%
      layout(title = 'Health Professional Shortage Area in Metropolitan') %>%
      add_trace(
        type = "pie",
        hovertemplate = "%{label}: <br>Percentage: %{percent}")
    return(chart)
  })
}




