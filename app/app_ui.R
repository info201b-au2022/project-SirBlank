#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)
library(bslib)

source("tabs/tab_panel_intro.R")
source("tabs/tab_panel_chart1.R")
source("tabs/tab_panel_chart2.R")
source("tabs/tab_panel_chart3.R")
source("tabs/tab_panel_summary.R")
source("tabs/tab_panel_report.R")

custom_theme <- bs_theme(
  version = 5,
  bg = "#FFF6E1",
  fg = "#450F0F",
  primary = "#0199F8",
  secondary = "#FF374B",
  base_font = font_google("Open Sans")
)

ui <- navbarPage(
  theme = custom_theme,
  
  
  
  title = "Rural Health Disparities",
  position = "fixed-top",

  
  
  # A simple footer
  footer = list(
    tags$style(type = "text/css", "body {padding-top: 70px;}"),
    hr(),
    column(12, p("  Data Science Project | Final Deliverable | INFO 201 | Autumn 2022 | Alex Cao, Teerth Mehta, Sunghee Park, Amber Wu")),
    hr()
  ),

  # The project introduction
  tab_panel_introduction,

  # The three charts
  tab_panel_chart1,
  tab_panel_chart2,
  tab_panel_chart3,

  # The project summary
  tab_panel_summary,

  # The project report
  tab_panel_report
)


