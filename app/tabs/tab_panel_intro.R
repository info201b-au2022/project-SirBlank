# tab_panel_intro

library(shiny)

tab_panel_introduction <-tabPanel(
    "Introduction",
    column(12, h1("Introduction"), align = "center"),
    tags$figure(
      align = "center",
      tags$img(src = "hospital_closings.png",
               height = 300,
               width = 450)
    ),
    # HTML('<img src = "hospital_closings.JPG", height = "300px", width = "450px"
    #      style = "center"/>'),
    column(12, p("140 rural hospitals closed since 2010, and a record 19 closures in 2020 alone."), align = "center", style = "font-size:14px;"),
    h2("Overview"),
    p("According to the Rural Health Information Hub (RHIhub), an information portal funded by the Federal Office of Rural Health Policy that focuses on providing access to rural health resources and improving health for rural Americans, rural communities have a higher incidence of disease and/or disability, higher mortality rates, and lower life expectancies when compared to their urban counterparts.
       For this project, we want to draw attention to the significant health disparities between metropolitan and non-metropolitan counties in the United States. 
       In order to achieve this, we explored how living in rural/non-metropolitan areas can affect people's well-being and access to healthcare, and how they differ compared to those living in metropolitan areas.
       With our findings, we aim to push governments and policy makers to support rural healthcare with additional attention and resources to improve rural health care."),
    h2("Questions we seek to answer:"),
    p("Is there a difference in medical debt between metro and non-metropolitan counties? If so how significant is it?"),
    p("How do metropolitan counties compare to non-metropolitan counties in the United States in regards to HPSA, Health Professional Shortage Area?"),
    p("How does life expectancy differ between metropolitan and non-metropolitan areas?"),
    h2("About the Data Sets"),
    column(12, p("Debt in America 2022"), style = "font-size:23px; font-thickness: 500%; color: #A02D33"),
    p("This data set collected 4% of the nationally representative consumer records from a major credit bureau. The records documented the share with overall, medical, student loan, and auto loan debt of each geographic area (nation, state, county) in the United States."),
    column(12, p("Health Professional Shortage Areas"), style = "font-size:23px; font-thickness: 500%; color: #A02D33"),
    p("This data set compiles Health Professional Shortage Areas scores (HPSAs) of each US county. The HPSA scores are calculated based on the population-to-provider ratio, percent of population below 100% of the Federal Poverty Level (FPL), and the travel time to the nearest source of care (NSC) outside the HPSA designation area of each county."),
    column(12, p("United States Mortality Rates and Life Expectancy by County, Race, and Ethnicity 2000-2019"), style = "font-size:23px; font-thickness: 500%; color: #A02D33"),
    p("This data set contains estimates for mortality rates and life expectancy at the county level in the United States by using population and deaths data from the national Center for Health Statistics."),
    br()
)
