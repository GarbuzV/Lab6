library(shiny)
library(car)
shinyServer(function(input, output) {
  
  values <- reactiveValues()
  observe({
    input$action_Calc
    values$int <- isolate({
      input$num_principal * input$slider_intrate *
        recode(input$select_time, "1 = '1'; 2 = '0.25'; 
               3 = '0.08333333'")/100 * input$slider_num  
    })
    values$amt <- isolate(input$num_principal) + values$int
    })
  
  output$text_principal <- renderText({
    input$action_Calc
    paste("Number: (in $)", isolate(input$num_principal))
  })
  
  output$text_intrate <- renderText({
    input$action_Calc
    paste("Percentage: ", isolate(input$slider_intrate), 
          "%")
  })
  
  output$text_num <- renderText({
    input$action_Calc
    paste("Time period ", isolate(input$slider_num),
          recode(isolate(input$select_time),
                 "1 = 'Years'; 2 = 'Months'")
    )
  })
  output$text_int <- renderText({
    if(input$action_Calc == 0) ""
    else
      paste("Calculated values:", values$int)
  })
  
  output$text_amt <- renderText({
    if(input$action_Calc == 0) ""
    else 
      paste("The entered value + percentage:", values$amt)
  })
  
})