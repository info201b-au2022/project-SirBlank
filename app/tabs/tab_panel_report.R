# tab_panel_report

library(shiny)
library("markdown")

tab_panel_report <-tabPanel(
  "Report",

  fluidRow(
    column(
      12,
      includeMarkdown("tabs/report.md")
    )
  )


)

