# This program sets up the user interface for the cvdrisk app. The interface allows users to
# enter information into the CVD risk calculator on the sidebar, and it shows the 
# calculated cardiovascular risk in the main panel.

library(shiny)

# Define UI for application that calculates Framingham 10 Year CHD Risk Score
shinyUI(fluidPage(
    
    # Application title
    titlePanel("10-Year Cardiovascular Disease Risk Assessment"),
    
    # Sidebar with inputs
    sidebarLayout(
        sidebarPanel(
            h5("Please enter the following information:"),
            fluidRow(
                column(10,
            radioButtons("gender", label = h3("Sex"),
                         choices = list("Male" = "Male", "Female" = "Female"),
                         selected = "Male")),
                column(10,
            sliderInput("age",
                        "Age:",
                        min = 20,
                        max = 79,
                        value = 40))),
            fluidRow(
                column(10,
            numericInput("chol", 
                         label = h3("Total Cholesterol"), 
                         value = 190)),
                column(10,
            numericInput("hdl", 
                     label = h3("HDL Cholesterol"), 
                     value = 60))),
            fluidRow(
                column(10,
            numericInput("systolic",
                         label = h3("Systolic Blood Pressure"),
                         value = 120)),
                column(10,
            radioButtons("trt", label = h3("Are you being treated for high blood pressure?"),
                         choices = list("No" = "No", "Yes" = "Yes"),
                         selected = "No"))),
            fluidRow(
                column(10,
            radioButtons("smoke", label = h3("Smoking Status"),
                 choices = list("Smoker" = "Smoker", "Non Smoker" = "Non Smoker"),
                 selected = "Non Smoker")))
        ),
        
        # Show a message indicating 10 year risk of developing CHD
        mainPanel(
            textOutput("chdrisk")
        )
    )  
))