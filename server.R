library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
 
    output$distPlot <- renderPlot({
    # generate bins based on input$bins from ui.R
        waiting_time    <- faithful[, 2] 
        bins <- seq(min(waiting_time), max(waiting_time), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(waiting_time, breaks = bins, col = 'darkgray', border = 'white')
    })
    
    model <- lm(eruptions ~ waiting, data = faithful)

    modelpred <- reactive({
        waitingInput <- input$sliderWaiting
        predict(model, newdata = data.frame(waiting = waitingInput))
    })

    output$plot <- renderPlot({

        waitingInput <- input$sliderWaiting

        plot(faithful$waiting, faithful$eruptions, xlab = "Waiting Time",
             ylab = "Eruption Period", bty = "n", pch = 16,
             xlim = c(40, 100), ylim = c(0, 6))

        if(input$showModel){
            abline(model, col = "red", lwd = 2)
        }

        output$pred <- renderText({
            paste("Eruption Period is",round(modelpred(),2),"minutes.")
            
        })
    })
})
