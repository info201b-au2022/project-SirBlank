library(tidyverse)
library(ggplot2)
# -------- Wrangling data from different datasets to turn into valuable info
# Original dataset on medical debt
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
# Identifying and renaming columns of interes
# for medical debt
working_medical_debt <- medical_debt %>%
  select(NAME, 
         Share.with.Medical.Debt.in.Collections, 
         Median.Medical.Debt.in.Collections..All
  ) %>%
  rename(location_name = NAME, 
         pct_medical_debt = Share.with.Medical.Debt.in.Collections, 
         med_medical_debt = Median.Medical.Debt.in.Collections..All
  )
# Joining final dataset
working_data_set <- left_join(working_medical_debt, 
                              working_rurality, 
                              by = 'location_name'
                    )
# Filtering out NA values
working_data_set <- working_data_set %>%
  filter(med_medical_debt != "n/a*") %>%
  filter(!is.na(metro_nonmetro))
# Turning medical debt values into integers
working_data_set <- working_data_set %>%
  mutate(med_medical_debt = as.integer(med_medical_debt))
# ----- Graph Data
# Calculate average medical debt for non-metro and metro
avg_med_debt <- working_data_set %>%
  group_by(metro_nonmetro) %>%
  summarize(avg_debt = mean(med_medical_debt))
# Final graph produced
ggplot(data = avg_med_debt, aes(x = as.factor(metro_nonmetro), 
                                y = avg_debt, 
                                fill = metro_nonmetro)) + 
  geom_bar(stat = "identity") +
  scale_fill_manual(values = c("blue", "red")) +
  labs(x = "County Designation",
       y = "Average Medical Debt ($)",
       title = "Average Medical Debt in Metro vs Non-Metro Areas",
       fill = "County Classification") +
  geom_text(aes(label = round(avg_debt, digits = 2), vjust = -1))

