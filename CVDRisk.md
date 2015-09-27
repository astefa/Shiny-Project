CVDRisk App
========================================================
author: 
date: 09/26/2015
autosize: true

Background
========================================================

- The Framingham Heart Study is an ongoing longitudinal cardiovascular health study focusing on residents of Framingham, Massachusetts.
- Data from this study have been used to develop 10-year risk functions for developing cardiovascular disease, most recently in 2008.
- These risk functions have been good tools for primary care physicians to identify patients who are particularly at risk for developing heart disease.

Motivation
========================================================

- It is important for the general public to have access to important and informative research results that could impact personal health.
- As the population has aged, rates of cardiovascular disease have risen.
- It has thus become that much more important to identify at-risk individuals early and try to prevent cardiovascular disease.
- Easy access to this risk score will increase the information available to individuals and help them in making health decisions.
- This is especially important for individuals who may not get routine checkups.

CVD Risk App Design
========================================================

- Simple layout and easy to use.
- Few inputs, which are requested in the sidebar panel (age, sex, total cholesterol, HDL cholesterol, systolic blood pressure, whether the individual is being treated for high blood pressure, and smoking status)
- Outputs calculated 10-year risk of developing cardiovascular disease directly into the main panel using cvdrisk function.

cvdrisk Function Example
========================================================

- Female smoker, 45 years old, 230 total cholesterol, 55 HDL, 130 SBP, not on blood pressure treatment




```r
cvdrisk("Female", 45, 230, 55, 130, "No", "Smoker")
```

```
[1] "Your 10-year risk of developing cardiovascular disease is 6%."
```
