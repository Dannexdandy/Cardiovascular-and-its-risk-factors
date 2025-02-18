# Cardiovascular-and-its-risk-factors
# Description

This study aims to understand the relationship between cardiovascular disease and its risk 
factors. This study shows that most of the variables can be used to predict the presence of 
cardiovascular disease in a patient. 

# Problem objective
There are some statistical questions to examine the various risk factors causing cardiovascular 
disease. The following questions are to be answered in this report. 
1. What are the key indicators that cause cardiovascular disease. 
2. The prevalence of cardiovascular disease by gender and calculate the percentage ratio. 
3. The relationship between systolic and diastolic blood pressure. 
4. The relationship between BMI (Body mass index) and weight. 
5. The best predictors for cardiovascular disease.

# Dataset description
1.Age | Objective Feature | age | int (days)
2. Height | Objective Feature | height | int (cm) |
3. Weight | Objective Feature | weight | float (kg) |
4. Gender | Objective Feature | gender | categorical code |
5. Systolic blood pressure | Examination Feature | ap_hi | int |
6. Diastolic blood pressure | Examination Feature | ap_lo | int |
7. Cholesterol | Examination Feature | cholesterol | 1: normal, 2: above normal, 3: well above normal |
8. Glucose | Examination Feature | gluc | 1: normal, 2: above normal, 3: well above normal |
9. Smoking | Subjective Feature | smoke | binary |
10. Alcohol intake | Subjective Feature | alco | binary |
11. Physical activity | Subjective Feature | active | binary |
12. Presence or absence of cardiovascular disease | Target Variable | cardio | binary |

# Methodology 
The following statistical techniques are used to analyze the dataset and extract insightful 
information from them to reach the desired objectives. 

1. Exploratory Data Analysis 
Exploratory data analysis (EDA) is the first step in any research analysis. At this stage, I will 
examine the summary of the variables, and show the distribution of the data and generate 
reasonable insights from the data. 
Descriptive statistics have been used to explore the different variables in my dataset. In addition, 
charts such as histogram, boxplot, bar plot have been created to understand the distribution of the 
data. The descriptive analysis will help to visualize and comprehend trends, outliers and patterns 
in our data and will help to know the key indicators that cause cardiovascular disease.

2. Correlation Analysis 
A correlation matrix is used to display the correlation among different variables. I will use 
Pearson’s correlation coefficient to know the correlation among several variables such as systolic 
and diastolic blood pressure and correlations between BMI and weight. I will also use scatter plot 
to investigate the linear trend and relationships amongst the variables.

3. Logistic regression 
Logistic regression is used to check the best predictor for the cardiovascular disease variable. 
Then it will help to showcase the variable importance of the other variables and it will help to 
access the model fit in order to know the predictive power of the model. The accuracy, recall and 
precision will be known plus the area under curve.

# Acknowlegement
The dataset has been referred from Kaggle:https://www.kaggle.com/datasets/sulianova/cardiovascular-disease-dataset
