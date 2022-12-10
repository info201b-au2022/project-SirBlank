library(tidyverse)
library(dplyr)
library(stringr)
library(plotly)
library(readr)
source("../source/pie_chart_nonmetro_b5.R")

Health_Professional_Shortage_Areas_Primary_Care_by_County_3_ <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-SirBlank/main/data/Health_Professional_Shortage_Areas__Primary_Care_by_County_3.csv")



metro_nonmetro_hpsap <- Health_Professional_Shortage_Areas_Primary_Care_by_County_3_ %>% 
  group_by(metro_nonmetro)

metro_count <- metro_nonmetro_hpsap %>% 
  filter(metro_nonmetro == "Metropolitan") %>% 
  summarize(num = n())

metro_hpsap <- metro_nonmetro_hpsap %>% 
  filter(metro_nonmetro == "Metropolitan") %>% 
  group_by(value) %>% 
  summarize(num = n()) %>% 
  mutate("proportion" = num / metro_count$num * 100) %>% 
  mutate("metro_nonmetro" = "Metropolitan")

pie_metro_data <- data.frame(
  group = metro_hpsap$value,
  value = metro_hpsap$proportion,
  labels = paste(round(metro_hpsap$proportion, 2), "%"),
  metro_nonmetro = nonmetro_hpsap$metro_nonmetro
)

chart_3_metro <- ggplot(pie_metro_data, aes(x="", y = value, fill = group)) +
  geom_bar(stat="identity", width=1, color="white") +
  coord_polar("y", start = 0) + 
  ggtitle("Health Professional Shortage Area in Metropolitan") +
  geom_text(aes(label = labels), position = position_stack(vjust = 0.5)) +
  theme_void()

chart_3_metro <- plot_ly(pie_metro_data,
                         labels = ~group,
                         values = ~value,
                         type = 'pie')

chart_3_metro <- chart_3_metro %>% 
  layout(title = 'Health Professional Shortage Area in Metropolitan') %>% 
  add_trace(hovertemplate = "%{label}: <br>Percentage: %{percent}")

chart_3_metro






