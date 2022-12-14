library(tidyverse)
library(dplyr)
library(stringr)
library(plotly)

library(readr)
source("../source/pie_chart_metro_b5.R")
Health_Professional_Shortage_Areas_Primary_Care_by_County_3_ <- read_csv("https://raw.githubusercontent.com/info201b-au2022/project-SirBlank/main/data/Health_Professional_Shortage_Areas__Primary_Care_by_County_3.csv")

metro_nonmetro_hpsap <- Health_Professional_Shortage_Areas_Primary_Care_by_County_3_ %>% 
  group_by(metro_nonmetro)

nonmetro_count <- metro_nonmetro_hpsap %>% 
  filter(metro_nonmetro == "Nonmetropolitan") %>% 
  summarize(num = n())

nonmetro_hpsap <- metro_nonmetro_hpsap %>% 
  filter(metro_nonmetro == "Nonmetropolitan") %>% 
  group_by(value) %>% 
  summarize(num = n()) %>% 
  mutate("proportion" = num / nonmetro_count$num * 100) %>% 
  mutate("metro_nonmetro" = "Nonmetropolitan")

pie_nonmetro_data <- data.frame(
  group = nonmetro_hpsap$value,
  value = nonmetro_hpsap$proportion,
  labels = paste(round(nonmetro_hpsap$proportion, 2), "%"),
  metro_nonmetro = nonmetro_hpsap$metro_nonmetro
)

# chart_3_nonmetro <- ggplot(pie_nonmetro_data, aes(x="", y = value, fill = group)) +
#   geom_bar(stat="identity", width=1, color="white") +
#   ggtitle("Health Professional Shortage Area in Nonmetropolitan") +
#   geom_text(aes(label = labels), position = position_stack(vjust = 0.5)) +
#   coord_polar("y", start = 0) +
#   theme_void()


chart_3_nonmetro <- plot_ly(pie_nonmetro_data,
                         labels = ~group,
                         values = ~value,
                         type = 'pie')

chart_3_nonmetro <- chart_3_nonmetro %>% 
  layout(title = 'Health Professional Shortage Area in Nonmetropolitan') %>% 
  add_trace(
    type = "pie",
    hovertemplate = "%{label}: <br>Percentage: %{percent}")

chart_3_nonmetro






