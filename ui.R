library(shiny)
shinyUI(fluidPage(
  titlePanel("Calculator"),
  sidebarLayout(
    sidebarPanel(
      numericInput("num_principal",
                   label = h6("Enter the number (in $)"),
                   value = 1000),
      br(),            
      sliderInput("slider_intrate",
                  label = h6("Enter the percentage (in %)"),
                  min = 0, max = 20, value = 5),
      
      br(),            
      sliderInput("slider_num",
                  label = h6("Enter a periods"),
                  min = 0, max = 50, value = 5),
      selectInput("select_time",
                  label = h6(""),
                  choices = list("Years" = 1,
                                 "Months" =2),
                  selected = 1 
      ), 
      br(),
      br(),            
      actionButton("action_Calc", label = "Calculate")        
      ),
    mainPanel("",p(h5("Your entered values:")),
                 textOutput("text_principal"),
                 textOutput("text_intrate"),
                 textOutput("text_num"),
                 textOutput("text_time"),
                 br(),
                 p(h5("Calculated values:")),
                 textOutput("text_int"),
                 textOutput("text_amt")
                 )
                 )
                 ))