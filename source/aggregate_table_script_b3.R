library(tidyverse)
library(dplyr)
library(data.table)

#loading data sets

medical_debt <- read_csv("https://raw.githubusercontent.com/info201b-au2022/project-SirBlank/main/data/Medical_Debt.csv")
health_professional_shortage_area <- read_csv("https://raw.githubusercontent.com/info201b-au2022/project-SirBlank/main/data/Health_Professional_Shortage_Areas__Primary_Care_by_County_3.csv")
life_expectancy_at_birth <- read_csv("https://raw.githubusercontent.com/info201b-au2022/project-SirBlank/main/data/Life_Expectancy_at_Birth.csv")
rural_hospital_closures <- read_csv("https://raw.githubusercontent.com/info201b-au2022/project-SirBlank/main/data/Rural_Hospital_Closures.csv")
state_to_abbreviation <- read_csv("https://raw.githubusercontent.com/info201b-au2022/project-SirBlank/main/data/state_to_abbreviation.csv")
# load_medical_debt <- function() {
#   filename <- "https://raw.githubusercontent.com/info201b-au2022/project-SirBlank/main/data/Medical_Debt.csv"
#   df <- read_csv(filename)
#   return(df)
# }
# 
# load_health_professional_shortage_area <- function() {
#   filename <- "https://raw.githubusercontent.com/info201b-au2022/project-SirBlank/main/data/Health_Professional_Shortage_Areas__Primary_Care_by_County_3.csv"
#   df <- read_csv(filename)
#   return(df)
# }
# 
# load_life_expectancy_at_birth <- function() {
#   filename <- "https://raw.githubusercontent.com/info201b-au2022/project-SirBlank/main/data/Life_Expectancy_at_Birth.csv"
#   df <- read_csv(filename)
#   return(df)
# }
# 
# load_rural_hospital_closures <- function() {
#   filename <- "https://raw.githubusercontent.com/info201b-au2022/project-SirBlank/main/data/Rural_Hospital_Closures.csv"
#   df <- read_csv(filename)
#   return(df)
# }
# 
# load_state_to_abbreviation <- function() {
#   filename <- "https://raw.githubusercontent.com/info201b-au2022/project-SirBlank/main/data/state_to_abbreviation.csv"
#   df <- read_csv(filename)
#   return(df)
# }


#Joining metro_nonmetro column from health_professional_shortage_area to medical_debt 
medical_debt <- medical_debt %>%
  rename("county_name" = "NAME")

state_to_abbreviation <- state_to_abbreviation %>%
  rename("state_abbr" = "code")

medical_debt$county_name <- gsub(",.*", "", medical_debt$county_name)

health_professional_shortage_area$state_name <- state_to_abbreviation$state[match(health_professional_shortage_area$state_abbr, state_to_abbreviation$state_abbr)]
health_professional_shortage_area <- health_professional_shortage_area[, c(1, 2, 3, 7, 4, 5, 6)]

medical_debt <- merge(x = medical_debt, y = health_professional_shortage_area, by = c("county_name", "state_name"), all.x = TRUE)

medical_debt$year <- NULL
medical_debt$geoId <- NULL
medical_debt$value <- NULL

medical_debt <- medical_debt[, c(17, 1, 2, 18, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16)]

colnames(medical_debt)[which(names(medical_debt) == "Share with Medical Debt in Collections")] <- "Share_with_Medical_Debt_in_Collections"

medical_debt$Share_with_Medical_Debt_in_Collections <- stringr::str_replace(medical_debt$Share_with_Medical_Debt_in_Collections, "\\*", "")
medical_debt$Share_with_Medical_Debt_in_Collections <- stringr::str_replace(medical_debt$Share_with_Medical_Debt_in_Collections, "/", "")

medical_debt[medical_debt == "na"] <- NA
medical_debt[medical_debt == 0] <- NA


#Joining metro_nonmetro column from health_professional_shortage_area to life_expectancy_at_birth
colnames(life_expectancy_at_birth)[2] = "county_name"

life_expectancy_at_birth <- life_expectancy_at_birth %>%
  separate(col = county_name, into = c("A", "state_name"), sep = "[(]", remove = FALSE)

life_expectancy_at_birth$A <- NULL

life_expectancy_at_birth$state_name <- gsub("[)]", "", life_expectancy_at_birth$state_name)

life_expectancy_at_birth$county_name <- gsub("\\s* \\([^\\)]+\\)", "", life_expectancy_at_birth$county_name)

life_expectancy_at_birth <- merge(x = life_expectancy_at_birth, y = health_professional_shortage_area, by = c("county_name", "state_name"), all.x = TRUE)

life_expectancy_at_birth <- life_expectancy_at_birth[, c(1, 2, 11, 3, 4, 5, 6, 7, 8, 9, 10, 12, 13, 14, 15)]


#Values

counties_with_highest_medical_debt <- medical_debt %>%
  group_by(county_name, state_name) %>%
  arrange(desc(Share_with_Medical_Debt_in_Collections)) %>%
  select(metro_nonmetro, county_name, state_name, Share_with_Medical_Debt_in_Collections)
  #slice(1:10)
counties_with_highest_medical_debt <- counties_with_highest_medical_debt[1:10, ]
counties_with_highest_medical_debt

counties_with_lowest_life_expectancy <- life_expectancy_at_birth %>%
  #group_by(county_name, state_name) %>%
  filter(age_name == "<1 year") %>%
  arrange(val, na.rm = TRUE) %>%
  select(metro_nonmetro, county_name, state_name, val) %>%
  slice(1:10)
  
counties_with_lowest_life_expectancy


#tables

medical_debt_DT <- setDT(counties_with_highest_medical_debt)
setnames(medical_debt_DT, 1, "Metropolitan or Non-metropolitan")
setnames(medical_debt_DT, 2, "County")
setnames(medical_debt_DT, 3, "State")
setnames(medical_debt_DT, 4, "Share with Medical Debt")
#View(medical_debt_DT)

medical_debt_table <- table(counties_with_highest_medical_debt)
#View(medical_debt_table)

life_expectancy_DT <- setDT(counties_with_lowest_life_expectancy)
#View(life_expectancy_DT)

life_expectancy_table <- table(counties_with_lowest_life_expectancy)
#View(life_expectancy_table)
