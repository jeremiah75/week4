
require(shiny)
require(ggplot2)
require(datasets)

df <- read.csv("enol.csv", header = TRUE)
chemical <- c("pH","TotalAcidity","TotalSolubleSolids","MalicAcid")
physical<- c("GrapeWeight")
ChemicalVar <- df[chemical]
PhysicalVar <- df[physical]

shinyServer(function(input, output){

    output$timeSeries <- renderPlot({
      p <- ggplot(
              df,
              aes_string( x = 'Year', y = input$parameter, colour = "Vineyard")) +
        geom_line(size=1.25) + geom_point(size=4) +
          ylab(input$parameter) + 
            scale_color_brewer(type="qual",palette='Set1') +
        theme(axis.title.x=element_text(size=18,face="bold.italic"), 
                axis.title.y=element_text(size=18,face="bold.italic"),
                axis.text.x=element_text(size=16), 
                axis.text.y=element_text(size=16,angle=30)) +
        theme(legend.position="top",
              legend.text = element_text(size = 18),
              legend.title = element_text(size=20,face = "italic"))
      
      print(p)
    })
    datasetInput <- reactive({
      switch(input$dataset,
             "ChemicalVar" = ChemicalVar,
             "PhysicalVar" = PhysicalVar)
    })
    output$caption <- renderText({
      input$caption
    })
    output$summary <- renderPrint({
      dataset <- datasetInput()
      summary(dataset)
    })
    output$view <- renderTable({
      head(datasetInput(), n = input$obs)
    })
  }
)