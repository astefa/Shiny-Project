### BACKGROUND

# This server program contains instructions on how to convert the inputs given in the
# ui program into a 10-year risk of developing cardiovascular disease. The function
# outlined below produces a score that is then translated into a risk probability.
# The risk function itself was developed as a part of the ongoing Framingham Heart Study. 
# 
# Ref:
# 
# D'Agostino, R.B.; Sr., Vasan, R.S., Pencina, M.J., Wolf, P.A., Cobain, M., Massaro, 
# J.M., Kannel, W.B. (22 January 2008). "General cardiovascular risk profile for use in
# primary care: the Framingham Heart Study". Circulation 117 (6): 743-753. 
# doi:10.1161/circulationaha.107.699579
# 
# http://www.nhlbi.nih.gov/health-pro/guidelines/current/cholesterol-guidelines/
#        quick-desk-reference-html/10-year-risk-framingham-table

### shinyServer FUNCTION

# Takes the following inputs: age, sex, total cholesterol, HDL cholesterol, systolic
# blood pressure, whether user is currently being treated for high blood pressure,
# and smoking status. Outputs a 10-year risk of developing cardiovascular disease as text.

### cvdrisk FUNCTION

# Using the above outputs and the Framingham CVD risk score formula, this function
# converts the inputs into a 10-year risk of developing cardiovascular disease as text.

library(shiny)

# Function generating risk score and meaning
cvdrisk = function(gen, age, chol, hdl, systolic, trt, smoke){
    score = 0
    risk = "0%"
    
    if(gen == "Male"){
        # age
        if(age <= 34){
            score = score - 9
        }
        else if(age <= 39){
            score = score - 4
        }
        else if(age <= 44){
            score = score + 0
        }
        else if(age <= 49){
            score = score + 3
        }
        else if(age <= 54){
            score = score + 6
        }
        else if(age <= 59){
            score = score + 8
        }
        else if(age <= 64){
            score = score + 10
        }
        else if(age <= 69){
            score = score + 11
        }
        else if(age <= 74){
            score = score + 12
        }
        else if(age <= 79){
            score = score + 13
        }
        
        # total cholesterol
        if(chol < 160){
            score = score + 0
        }
        else if(chol < 200){
            if(age <= 39){
                score = score + 4
            }
            else if(age <= 49){
                score = score + 3
            }
            else if(age <= 59){
                score = score + 2
            }
            else if(age <= 69){
                score = score + 1
            }
            else if(age <= 79){
                score = score + 0
            }
        }
        else if(chol < 240){
            if(age <= 39){
                score = score + 7
            }
            else if(age <= 49){
                score = score + 5
            }
            else if(age <= 59){
                score = score + 3
            }
            else if(age <= 69){
                score = score + 1
            }
            else if(age <= 79){
                score = score + 0
            }
        }
        else if(chol < 280){
            if(age <= 39){
                score = score + 9
            }
            else if(age <= 49){
                score = score + 6
            }
            else if(age <= 59){
                score = score + 4
            }
            else if(age <= 69){
                score = score + 2
            }
            else if(age <= 79){
                score = score + 1
            }
        }
        else if(chol >= 280){
            if(age <= 39){
                score = score + 11
            }
            else if(age <= 49){
                score = score + 8
            }
            else if(age <= 59){
                score = score + 5
            }
            else if(age <= 69){
                score = score + 3
            }
            else if(age <= 79){
                score = score + 1
            }
        }
        
        # smoking
        if(smoke == "Smoker"){
            if(age <= 39){
                score = score + 8
            }
            else if(age <= 49){
                score = score + 5
            }
            else if(age <= 59){
                score = score + 3
            }
            else if(age <= 69){
                score = score + 1
            }
            else if(age <= 79){
                score = score + 1
            }
        }
        
        # hdl
        if(hdl >= 60){
            score = score - 1
        }
        else if(hdl >= 50){
            score = score + 0
        }
        else if(hdl >= 40){
            score = score + 1
        }
        else if(hdl < 40){
            score = score + 2
        }
        
        # systolic
        if(trt == "Yes"){
            if(systolic < 120){
                score = score + 0
            }
            else if(systolic < 130){
                score = score + 1
            }
            else if(systolic < 140){
                score = score + 2
            }
            else if(systolic < 150){
                score = score + 2
            }
            else if(systolic >= 150){
                score = score + 3
            }
        }
        else if(trt == "No"){
            if(systolic < 120){
                score = score + 0
            }
            else if(systolic < 130){
                score = score + 0
            }
            else if(systolic < 140){
                score = score + 1
            }
            else if(systolic < 160){
                score = score + 1
            }
            else if(systolic >= 160){
                score = score + 2
            }
        }
        
        # calculate risk
        if(score < 0){
            risk = "< 1%"
        }
        else if(score < 5){
            risk = "1%"
        }
        else if(score < 7){
            risk = "2%"
        }
        else if(score == 7){
            risk = "3%"
        }
        else if(score == 8){
            risk = "4%"
        }
        else if(score == 9){
            risk = "5%"
        }
        else if(score == 10){
            risk = "6%"
        }
        else if(score == 11){
            risk = "8%"
        }
        else if(score == 12){
            risk = "10%"
        }
        else if(score == 13){
            risk = "12%"
        }
        else if(score == 14){
            risk = "16%"
        }
        else if(score == 15){
            risk = "20%"
        }
        else if(score == 16){
            risk = "25%"
        }
        else if(score >= 17){
            risk = "> 30%"
        }
    }    
    
    # program risk score for women
    else if(gen == "Female"){
        # age
        if(age <= 34){
            score = score - 7
        }
        else if(age <= 39){
            score = score - 3
        }
        else if(age <= 44){
            score = score + 0
        }
        else if(age <= 49){
            score = score + 3
        }
        else if(age <= 54){
            score = score + 6
        }
        else if(age <= 59){
            score = score + 8
        }
        else if(age <= 64){
            score = score + 10
        }
        else if(age <= 69){
            score = score + 12
        }
        else if(age <= 74){
            score = score + 14
        }
        else if(age <= 79){
            score = score + 16
        }
        
        # total cholesterol
        if(chol < 160){
            score = score + 0
        }
        else if(chol < 200){
            if(age <= 39){
                score = score + 4
            }
            else if(age <= 49){
                score = score + 3
            }
            else if(age <= 59){
                score = score + 2
            }
            else if(age <= 69){
                score = score + 1
            }
            else if(age <= 79){
                score = score + 1
            }
        }
        else if(chol < 240){
            if(age <= 39){
                score = score + 8
            }
            else if(age <= 49){
                score = score + 6
            }
            else if(age <= 59){
                score = score + 4
            }
            else if(age <= 69){
                score = score + 2
            }
            else if(age <= 79){
                score = score + 1
            }
        }
        else if(chol < 280){
            if(age <= 39){
                score = score + 11
            }
            else if(age <= 49){
                score = score + 8
            }
            else if(age <= 59){
                score = score + 5
            }
            else if(age <= 69){
                score = score + 3
            }
            else if(age <= 79){
                score = score + 2
            }
        }
        else if(chol >= 280){
            if(age <= 39){
                score = score + 13
            }
            else if(age <= 49){
                score = score + 10
            }
            else if(age <= 59){
                score = score + 7
            }
            else if(age <= 69){
                score = score + 4
            }
            else if(age <= 79){
                score = score + 2
            }
        }
        
        # smoking
        if(smoke == "Smoker"){
            if(age <= 39){
                score = score + 9
            }
            else if(age <= 49){
                score = score + 7
            }
            else if(age <= 59){
                score = score + 4
            }
            else if(age <= 69){
                score = score + 2
            }
            else if(age <= 79){
                score = score + 1
            }
        }
        
        # hdl
        if(hdl >= 60){
            score = score - 1
        }
        else if(hdl >= 50){
            score = score + 0
        }
        else if(hdl >= 40){
            score = score + 1
        }
        else if(hdl < 40){
            score = score + 2
        }
        
        # systolic
        if(trt == "Yes"){
            if(systolic < 120){
                score = score + 0
            }
            else if(systolic < 130){
                score = score + 3
            }
            else if(systolic < 140){
                score = score + 4
            }
            else if(systolic < 160){
                score = score + 5
            }
            else if(systolic >= 160){
                score = score + 6
            }
        }
        else if(trt == "No"){
            if(systolic < 120){
                score = score + 0
            }
            else if(systolic < 130){
                score = score + 1
            }
            else if(systolic < 140){
                score = score + 2
            }
            else if(systolic < 160){
                score = score + 3
            }
            else if(systolic >= 160){
                score = score + 4
            }
        }
        
        if(score < 9){
            risk = "< 1%"
        }
        else if(score < 13){
            risk = "1%"
        }
        else if(score < 15){
            risk = "2%"
        }
        else if(score == 15){
            risk = "3%"
        }
        else if(score == 16){
            risk = "4%"
        }
        else if(score == 17){
            risk = "5%"
        }
        else if(score == 18){
            risk = "6%"
        }
        else if(score == 19){
            risk = "8%"
        }
        else if(score == 20){
            risk = "11%"
        }
        else if(score == 21){
            risk = "14%"
        }
        else if(score == 22){
            risk = "17%"
        }
        else if(score == 23){
            risk = "22%"
        }
        else if(score == 24){
            risk = "27%"
        }
        else if(score >= 25){
            risk = "> 30%"
        }
    }
    
    r = paste("Your 10-year risk of developing cardiovascular disease is ", risk, ".", sep = "")
    r
}


# Define server logic required to produce a 
# 10 year risk of developing cardiovascular disease. 
shinyServer(function(input, output) {
    
    # Outputting a 10 year risk
    
    output$chdrisk <- renderText({
        
        risktext = cvdrisk(input$gender, input$age, input$chol, input$hdl, 
                           input$systolic, input$trt, input$smoke)
        risktext    
        
    })
})