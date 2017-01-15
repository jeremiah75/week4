
require(shiny)

shinyUI(#1
  navbarPage("Red must parameters",#2
             tabPanel("Details",#3.1
                      h2("Enological parameters"),
                      hr(),
                      h3("Description"),
                      helpText("The data was extracted from seven vineyards at harvest time. 
                               The red grape cultivar Vitis vinifera L. Tempranillo was used
                               in this study. The research, developed within the PDO
                               “Ribera del Duero” , was conducted on the Vitis vinífera L. cv.
                               Tempranillo during nine years (2002-2012) in seven vineyard fields.
                               In the next tabPanel, you can view both time series and
                               descriptive statistics of the measured parameters at harvest
                               time."),
                      h3("Data set structure"),
                      p("A data frame with 91 observations on 7 variables."),
                      
                      p("Vineyard's Acronym"),
                      p("Year is the sampling year"),
                      p("pH	 without dimension"),
                      p("Total Acidity in g of tartaric acid/l"),
                      p("Total soluble Solids in Baume degrees"),
                      p("Malic Acid in g/l"),
                      p("Grape Weight in g"),
                      
                      h3("Data source"),
                      
                      p("CONSEJO REGULADOR DE LA DENOMINACION DE ORIGEN RIBERA DEL DUERO. 
                        The Protected Designation of Origin (PDO) area of Ribera del Duero
                        is registered under the PDO label from 1992. It is located along 
                        the Duero valley, in the northern plateau of Spain.")
             ),#3.1
             tabPanel("Time Series and Summary Data",#3.2
                      pageWithSidebar(#3.2.1
                        headerPanel("Time series of several must parameters
                                    at harvest time in Ribera del Duero"),
                        sidebarPanel(#3.2.1.1
                          selectInput("parameter","Select a parameter in the Time Series:",
                                      choices = c("pH","TotalAcidity","TotalSolubleSolids",
                                                  "MalicAcid","GrapeWeight"),
                                      selected = "pH")
                      ),#3.2.1.1
                        mainPanel(#3.2.1.2
                          plotOutput("timeSeries")
                          )#3.2.1.2
                        ),#3.2.1
                      pageWithSidebar(#3.2.2
                        headerPanel("Summary Data of several must parameters
                                    at harvest time in Ribera del Duero"),
                        sidebarPanel(#3.2.2.1
                          textInput("caption", "Caption:", "Data Summary"),
                          selectInput("dataset", "Choose a dataset:", 
                                      choices = c("ChemicalVar", "PhysicalVar"),
                                      selected = "ChemicalVar"),
                          numericInput("obs", "Number of observations to view:", 8)
                            
                          ),#3.2.2.1
                        mainPanel(#3.2.2.2
                          h3(textOutput("caption", container = span)),
                          
                          verbatimTextOutput("summary"), 
                          
                          tableOutput("view")
                          )#3.2.2.2
                        )#3.2.2
                      ),#3.2
             tabPanel("SourceCode",#3.3
                      p("part1-week4-shiny"),
                      a("https://github.com/jeremiah75/week4")
             )#3.3
  )#2
)#1
