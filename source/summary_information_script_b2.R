library(tidyverse)
library(dplyr)
library(data.table)

#loading data sets

medical_debt <- read_csv("https://raw.githubusercontent.com/info201b-au2022/project-SirBlank/main/data/Medical_Debt.csv")
health_professional_shortage_area <- read_csv("https://raw.githubusercontent.com/info201b-au2022/project-SirBlank/main/data/Health_Professional_Shortage_Areas__Primary_Care_by_County_3.csv")
life_expectancy_at_birth <- read_csv("https://raw.githubusercontent.com/info201b-au2022/project-SirBlank/main/data/Life_Expectancy_at_Birth.csv")
rural_hospital_closures <- read_csv("https://raw.githubusercontent.com/info201b-au2022/project-SirBlank/main/data/Rural_Hospital_Closures.csv")
state_to_abbreviation <- read_csv("https://raw.githubusercontent.com/info201b-au2022/project-SirBlank/main/data/state_to_abbreviation.csv")


# Joining metro_nonmetro column from health_professional_shortage_area to medical_debt 

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

medical_debt$Share_with_Medical_Debt_in_Collections <- as.numeric(medical_debt$Share_with_Medical_Debt_in_Collections)

medical_debt$Share_with_Medical_Debt_in_Collections <- round(medical_debt$Share_with_Medical_Debt_in_Collections, digit = 3)
medical_debt$Share_with_Medical_Debt_in_Collections <- medical_debt$Share_with_Medical_Debt_in_Collections * 100

medical_debt[medical_debt == "Nonmetropolitan"] <- "Non-metropolitan"

#Joining metro_nonmetro column from health_professional_shortage_area to life_expectancy_at_birth
colnames(life_expectancy_at_birth)[2] = "county_name"

life_expectancy_at_birth <- life_expectancy_at_birth %>%
  separate(col = county_name, into = c("A", "state_name"), sep = "[(]", remove = FALSE)

life_expectancy_at_birth$A <- NULL

life_expectancy_at_birth$state_name <- gsub("[)]", "", life_expectancy_at_birth$state_name)

life_expectancy_at_birth$county_name <- gsub("\\s* \\([^\\)]+\\)", "", life_expectancy_at_birth$county_name)

life_expectancy_at_birth <- merge(x = life_expectancy_at_birth, y = health_professional_shortage_area, by = c("county_name", "state_name"), all.x = TRUE)

life_expectancy_at_birth <- life_expectancy_at_birth[, c(1, 2, 11, 3, 4, 5, 6, 7, 8, 9, 10, 12, 13, 14, 15)]

life_expectancy_at_birth$val <- as.numeric(life_expectancy_at_birth$val)


# Values

num_nonmetro <- sum(health_professional_shortage_area$metro_nonmetro == "Nonmetropolitan")
#num_nonmetro

num_metro <- sum(health_professional_shortage_area$metro_nonmetro == "Metropolitan")
#num_metro

avg_medical_debt_metro <- medical_debt %>%
  filter(metro_nonmetro == "Metropolitan") %>%
  summarize(avg_debt = mean(Share_with_Medical_Debt_in_Collections, na.rm = TRUE))
avg_medical_debt_metro <- round(avg_medical_debt_metro, 1)
#avg_medical_debt_metro

avg_medical_debt_nonmetro <- medical_debt %>%
  filter(metro_nonmetro == "Non-metropolitan") %>%
  summarize(avg_debt = mean(Share_with_Medical_Debt_in_Collections, na.rm = TRUE))
avg_medical_debt_nonmetro <- round(avg_medical_debt_nonmetro, 1)
#avg_medical_debt_nonmetro

num_rural_hospital_closure <- nrow(rural_hospital_closures)
num_rural_hospital_closure

num_counties_full_health_professional_shortage <- sum(health_professional_shortage_area$value == "Whole county is shortage area")
num_counties_full_health_professional_shortage

num_metro_counties_full_health_professional_shortage <- health_professional_shortage_area %>%
  filter(metro_nonmetro == "Metropolitan") %>%
  summarize(num = sum(value == "Whole county is shortage area"))
num_metro_counties_full_health_professional_shortage

num_nonmetro_counties_full_health_professional_shortage <- health_professional_shortage_area %>%
  filter(metro_nonmetro == "Nonmetropolitan") %>%
  summarize(num = sum(value == "Whole county is shortage area"))
num_nonmetro_counties_full_health_professional_shortage

avg_metro_life_expectancy <- life_expectancy_at_birth %>%
  filter(metro_nonmetro == "Metropolitan") %>%
  filter(age_name == "<1 year") %>%
  summarize(avg = mean(val, na.rm = TRUE))
avg_metro_life_expectancy <- round(avg_metro_life_expectancy, 1)
avg_metro_life_expectancy

avg_nonmetro_life_expectancy <- life_expectancy_at_birth %>%
  filter(metro_nonmetro == "Nonmetropolitan") %>%
  filter(age_name == "<1 year") %>%
  summarize(avg = mean(val, na.rm = TRUE))
avg_nonmetro_life_expectancy <- round(avg_nonmetro_life_expectancy, 1)
avg_nonmetro_life_expectancy

# summary_info

summary_info <- list(num_metro, 
                     num_nonmetro, 
                     avg_medical_debt_metro$avg_debt, 
                     avg_medical_debt_nonmetro$avg_debt, 
                     num_rural_hospital_closure, 
                     num_metro_counties_full_health_professional_shortage$num, 
                     num_nonmetro_counties_full_health_professional_shortage$num, 
                     avg_metro_life_expectancy$avg, 
                     avg_nonmetro_life_expectancy$avg)
summary_info

