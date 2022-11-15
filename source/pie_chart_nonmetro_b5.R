library(tidyverse)
library(dplyr)
library(stringr)

library(readr)
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
  mutate("proportion" = num / nonmetro_count$num) %>% 
  mutate("metro_nonmetro" = "Nonmetropolitan")

# pie chart:  "Health Professional Shortage Area in Nonmetropolitan"
pie_nonmetro_data <- c("None of county" = 0.0239*100, "Part of county" = 0.2415*100, "Whole county" = 0.7346*100 )
pctg <- round(pie_nonmetro_data/sum(pie_nonmetro_data)*100, 2)
label <- paste(names(pie_nonmetro_data), pctg, "%")

chart_3_nonmetro <- pie(pie_nonmetro_data, clockwise = TRUE, main = "Health Professional Shortage Area in Nonmetropolitan",
                    labels = label,
                    radius = 1)
