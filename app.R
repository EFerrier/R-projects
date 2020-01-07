#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# useful github reference
# best site https://shiny.rstudio.com/reference/shiny/latest/fluidPage.html
# other sites
# https://medium.freecodecamp.org/build-your-first-web-app-dashboard-using-shiny-and-r-ec433c9f3f6c
# https://github.com/amrrs/sample_revenue_dashboard_shiny/blob/master/app.R
# https://github.com/amrrs/sample_revenue_dashboard_shiny

library(ggplot2)
library(shiny)
library(shinyjs)
library(readxl)

#HY_EN_11808_G10_00_NONE_IT10000390895_REPORT <- read_excel("HY-EN-11808_G10_00_NONE_IT10000390895_REPORT.xlsx", 
                                                          # col_names = c("Sample","Torque","Time","Comment"), col_types = "numeric", skip = 23, n_max = 10)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("RightFit Design Verification Data Dashboard"),
      
      # Show a plot of the generated distribution
   sidebarLayout( 
     #sidebarPanel(selectInput("test request", "Test Request", list("HY-EN-11808_G1"))
      sidebarPanel(selectInput("test_request", "Test Request", list("HY-EN-11808_G1_00","HY-EN-11808_G10_00"))
        ),
        
   mainPanel(
         plotOutput("Torque")
      )
   )
  )


# Define server logic required to draw a histogram
server <- function(input, output) {
   
   ##output$Torque <- renderPlot({##
     #ggplot(data = HY_EN_11808_G10_00_NONE_IT10000390895_REPORT, aes(x=Sample, y=Torque)) + geom_point(col="blue", size=2)
    ## ggplot(data = df.temp, aes(x=Sample, y=Torque)) + geom_point(col="blue", size=2) + geom_vline(xintercept=c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10), color="white") + scale_x_discrete(limits=1:10, labels = c(1:10))##
    # when dataframe is figured out with group name, use geom_dotplot to plot groups
    datasetInput <- reactive({
      switch(input$test_request,
             "HY-EN-11808_G1_00" = data[[1]],
             "HY-EN-11808_G10_00" = data[[2]])
    })
    
    output$Torque <- renderPlot({
      ggplot(data = datasetInput, aes(x=Sample, y=Torque)) + geom_point(col="blue", size=2) + geom_vline(xintercept=c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10), color="white") + scale_x_discrete(limits=1:10, labels = c(1:10))
    })
}

# try this to fix reactive plot https://stackoverflow.com/questions/51407721/shiny-r-error-in-data-must-be-a-data-frame-or-other-object-coercible-by

# Run the application 
shinyApp(ui = ui, server = server)

