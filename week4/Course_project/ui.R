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
shinyUI(
    fluidPage(
        # Application title
        titlePanel("Central Limit Theorem in action"),
        h5("We investigate the exponential distribution and compare it with Central Limit Theorem."),
        h5("The exponential distribution has been simulated in R with rexp(n, lambda) where lambda is the rate parameter. The mean of exponential distribution is 1/lambda and the standard deviation is also 1/lambda. We investigate the behavior of distribution of averages for 10-50 exponentials. Up to one thousand simulations being executed."),
        # Sidebar layout
        sidebarLayout(
            sidebarPanel(
                h3("Parameters of the experiment."),
                sliderInput("lambda",
                            "Lambda:",
                            min = 0.1,
                            max = 0.9,
                            value = 0.2),
                sliderInput("simulations",
                            "Number of simulations:",
                            min = 10,
                            max = 1000,
                            value = 100),
                sliderInput("n",
                            "Number of exponentials per simulation:",
                            min = 10,
                            max = 50,
                            value = 40)
            ),
            
            # Show a plot of the generated distribution
            mainPanel(
                tabsetPanel(type = "tabs", 
                            tabPanel("Density distribution of means",
                                     br(),
                                     plotOutput("plot1")), 
                            tabPanel("Density distribution of variances",
                                     br(),
                                     plotOutput("plot2"))
                )
            )
        )
    )
)
