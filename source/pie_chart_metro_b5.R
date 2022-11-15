library(tidyverse)
library(dplyr)
library(stringr)

library(readr)
Health_Professional_Shortage_Areas_Primary_Care_by_County_3_ <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-SirBlank/main/data/Health_Professional_Shortage_Areas__Primary_Care_by_County_3.csv")
View(Health_Professional_Shortage_Areas_Primary_Care_by_County_3_)


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
  value = metro_hpsap$proportion
)

chart_3_metro <- ggplot(pie_metro_data, aes(x="", y = value, fill = group)) +
  geom_bar(stat="identity", width=1, color="white") +
  ggtitle("Health Professional Shortage Area in Nonmetropolitan") +
  coord_polar("y", start = 0) +
  theme_void()






