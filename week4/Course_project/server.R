#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    
    ex <- reactive({
        lambda <- input$lambda
        n <- input$n
        simulations <- input$simulations
        matrix(data = rexp(n * simulations, lambda), nrow = simulations, ncol = n)
    })

    output$plot1 <- renderPlot({
        exponentialMeans <- data.frame(means = apply(ex(), 1, mean))
        ggplot(exponentialMeans, aes(x = means)) +
            geom_histogram(aes(y = ..density..), binwidth = 0.1,
                           color = "black", fill = "darkblue", alpha = 0.25) +
            geom_vline(aes(xintercept = mean(means)), color = "red", size = 2) +
            geom_density(alpha = 0.25, fill = "green")
    })
    
    output$plot2 <- renderPlot({
        exponentialVars <- data.frame(var = apply(ex(), 1, var))
        ggplot(exponentialVars, aes(x = var)) +
            geom_vline(aes(xintercept = mean(var)), color = "red", size = 2) +
            geom_density(alpha = 0.25, fill = "green")
    })
    
})
