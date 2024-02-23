library(shiny)

# Define UI for application that draws a histogram
fluidPage(

    # Application title
    titlePanel("Letterboxd movies Dashboard"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            h1("Hello, Shiny!"),
        ),

        # Show a plot of the generated distribution
        mainPanel(
            DT::dataTableOutput("tabela")
        )
    )
)
