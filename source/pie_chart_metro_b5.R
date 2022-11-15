#Research Question
# What is the relationshp between health professional shortages and
# rural hospital shortages? 
library(tidyverse)
library(dplyr)
library(stringr)

library(readr)
Health_Professional_Shortage_Areas_Primary_Care_by_County_3_ <- read_csv("Documents/info201/data/Health Professional Shortage Areas_ Primary Care, by County (3).csv")
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
  mutate("proportion" = num / metro_count$num) %>% 
  mutate("metro_nonmetro" = "Metropolitan")



# piechart: "Health Professional Shortage Area in Metropolitan"
pie_metro_data <- c("None of county" = 0.09*100, "Part of county" = 0.438*100, "Whole county" = 0.472*100 )
pctg_m <- round(pie_metro_data/sum(pie_metro_data)*100, 2)
label_m <- paste(names(pie_metro_data), pctg_m, "%")

pie_metro <- pie(pie_metro_data, clockwise = TRUE, main = "Health Professional Shortage Area in Metropolitan",
    labels = label_m,
    radius = 1)











