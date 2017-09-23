#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Old Faithful Geyser Data"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
        h3("Documentation"),
        helpText("This Shiny app is the demonstration of its functionality
                 using the faithful data (Old Faithful).
                 First it draws the histogram of waiting time based on the number of bins.
                 Bin size is the  user input. Second graph gives the prediction of eruption period based on the 
                 user input for the waiting time. Model is calculated reactively, in other words, only when 
                 the user input for the waiting time is updated. Predicted eruption time will be the output. 
                 Model fit can be turned on or off based on the user input."), 
        sliderInput("bins","Number of bins:", min = 1,max = 50,value = 30),
       sliderInput("sliderWaiting", "What is the geyser waiting time?", 40, 100, value = 50),
       checkboxInput("showModel", "Show/Hide Model", value = TRUE),
       
       h3("Predicted Eruption Period: "),
       textOutput("pred")
    ),
    
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot"),
       
       plotOutput("plot")
       
  )
  )
))
