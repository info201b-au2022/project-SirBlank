library(dplyr)
library(stringr)
library(ggplot2)

df <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-SirBlank/main/data/Life_Expectancy_at_Birth.csv")
View(df)

df_2 <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-SirBlank/main/data/Health_Professional_Shortage_Areas__Primary_Care_by_County_3.csv")
View(df_2)

df_3 <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-SirBlank/main/data/state_to_abbreviation.csv")
View(df_3)

df_4 <- left_join(df_2, df_3, by = c("state_abbr" = "code"))
View(df_4)

df_4 <- mutate(
  df_4,
  county_state = paste(county_name,"(",state,")"),
  )
View(df_4)

final_df <- full_join(df, df_4, by = c("location_name" = "state" ))
View(final_df)

final_df <- na.omit(final_df)
final_df <- subset(final_df, select = -c(county_state))

final_final_df <- filter(final_df, age_name == "<1 year")
View(final_final_df)

metro <- final_final_df%>%
  filter(metro_nonmetro == "Metropolitan")%>%
  summarize(
    mean_val = mean(val)
  )

nonmetro <- final_final_df%>%
  filter(metro_nonmetro == "Nonmetropolitan")%>%
  summarize(
    mean_val = mean(val)
  )




life_expectancy_boxplot <- ggplot(final_final_df, aes(as.factor(x=metro_nonmetro), y=val,fill = metro_nonmetro)) +
  geom_boxplot()+
  xlab("County Designation") +
  ylab("Life expectancy for <1 year old") +
  scale_fill_manual(values = c("blue", "red")) +
  ggtitle("A boxplot that compare life expectancy between metro and nonmetro county")

