library(shiny)
shinyServer(function(input, output) {
  mtcars$mpgsp <- ifelse(mtcars$mpg - 20 > 0, mtcars$mpg - 20, 0)
  event1 <- lm(hp ~ mpg, data = mtcars)
  event2 <- lm(hp ~ mpgsp + mpg, data = mtcars)
  event3 <- lm(hp ~ mpgsp + mpg, data = mtcars)
  
  event1pred <- reactive({
    mpgInput <- input$sliderMPG
    predict(event1, newdata = data.frame(mpg = mpgInput))
  })
  
  event2pred <- reactive({
    mpgInput <- input$sliderMPG
    predict(event2, newdata = 
              data.frame(mpg = mpgInput,
                         mpgsp = ifelse(mpgInput - 20 > 0,
                                        mpgInput - 20, 0)))
  })
 
  event3pred <- reactive({
    mpgInput <- input$sliderMPG
    predict(event3, newdata = 
              data.frame(mpg = mpgInput,
                         mpgsp = ifelse(mpgInput - 20 > 0,
                                        mpgInput - 20, 0)))
  })
  output$plot1 <- renderPlot({
    mpgInput <- input$sliderMPG
    
    plot(mtcars$mpg, mtcars$hp, xlab = "Timeline", 
         ylab = "Impact on Economy", bty = "n", pch = 16,
         xlim = c(10, 35), ylim = c(50, 350))
   
  })
  
  output$pred1 <- renderText({
    event1pred()
  })
  
  output$pred2 <- renderText({
    event2pred()
  })    
    output$pred2 <- renderText({
      event3pred()
  })
})