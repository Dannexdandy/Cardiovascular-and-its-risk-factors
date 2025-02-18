install.packages("dplyr") 
library("dplyr") 
install.packages("moments") 
library("moments") 
install.packages("janitor") 
library(janitor) 
install.packages("corrplot") 
library(corrplot) 
install.packages("corrplot") 
library(corrplot) 
install.packages("regplot") 
library(regplot) 
library(caTools) 
install.packages("ggcorrplot") 
library(ggcorrplot) 
##Reading the file and separating it by semi colon 
file.choose() 
cardio_d <- read.csv("C:\\Users\\LA\\Downloads\\archive\\cardio_train.csv",sep=";") 
View(cardio_d) 
##Removing the unwanted column id 
cardio_d <- cardio_d[,-1] 
View(cardio_d) 
##Converting the age column from days format to years format 
cardio_d$age <- cardio_d$age/365 
View(cardio_d) 
cardio_d$age <- round(cardio_d$age) 
##Changing some of the variable names for better understanding 
cardio_d <- rename(cardio_d,sytolic=ap_hi,diastolic=ap_lo,glucose=gluc,alchohol_intake=alco,physical_activity=active,cv_disease=cardio,age_years=age) 
cardio_d <- rename(cardio_d,systolic=sytolic) 
##Adding a new column called BMI 
cardio_d <- mutate(cardio_d,Bmi= cardio_d$weight / (cardio_d$height/100)^2) 
cardio_d$Bmi <- round(cardio_d$Bmi) 
##Converting ordinal and nominal columns into categorical data type 
cardio_d$gender <- factor(cardio_d$gender,levels = c(1,2),labels = c("female","male")) 
cardio_d$cholesterol <- factor(cardio_d$cholesterol,ordered=TRUE,levels = c(1,2,3),labels = 
                                 c("normal","high","extremely high")) 
cardio_d$glucose <- factor(cardio_d$glucose,ordered=TRUE,levels = c(1,2,3),labels = 
                             c("normal","high","extremely high")) 
cardio_d$smoke <- factor(cardio_d$smoke,levels = c(0,1),labels = c("no","yes")) 
cardio_d$alchohol_intake <- factor(cardio_d$alchohol,levels = c(0,1),labels = c("no","yes")) 
cardio_d$physical_activity <- factor(cardio_d$physical_activity,levels = c(0,1),labels = 
                                       c("no","yes")) 
cardio_d$cv_disease <- factor(cardio_d$cv_disease,levels = c(0,1),labels = c("no","yes")) 
##Removing unrealistic data from systolic and diastolic blood pressure 
cardio_d$systolic <- subset(cardio_d$systolic,cardio_d$systolic <= 180 & cardio_d$systolic >= 
                              70) 
subset(cardio_d,cardio_d$systolic <= 180 & cardio_d$systolic >= 70) 
View(cardio_d$systolic) 

cardio_d <- subset(cardio_d,cardio_d$systolic <= 180 & cardio_d$systolic >= 70) 
min(cardio_d$systolic) 
max(cardio_d$systolic) 
cardio_d <- subset(cardio_d,cardio_d$diastolic <= 120 & cardio_d$diastolic >= 40) 
min(cardio_d$diastolic) 
max(cardio_d$diastolic) 
summary(cardio_d$age) 
##Exploring the age variable 
hist(cardio_d$age_years,col = "blue",main = "Age distribution of patients",xlab = 
       "Age(years)",ylab = "Frequency of patients", xlim = c(30,70),ylim=c(1000,8000),xaxt="n") 
axis(side=1, at=seq(30,70, by=5)) 
boxplot(cardio_d$age_years) 
summary(cardio_d$age_years) 
skewness(cardio_d$age_years) 
##Exploring the height variable 
hist(cardio_d$height,col = "blue",main = "Height distribution of patients",xlab = 
       "Height(cm)",ylab = "count",xlim = c(130,200),ylim = c(0,35000),xaxt="n") 
axis(side = 1,at=seq(130,200, by=5)) 
boxplot(cardio_d$height) 
summary(cardio_d$height) 
skewness(cardio_d$height) 
##Exploring the weight variable 
hist(cardio_d$weight,col = "blue",main = "weight distribution of patients",xlab = 
       "weight(kg)",ylab = "count",xlim = c(40,150),ylim = c(0,25000)) 
boxplot(cardio_d$weight) 
summary(cardio_d$weight) 
skewness(cardio_d$weight) 
##Exploring the systolic variable 
hist(cardio_d$systolic, col = "blue",main = "Sytolic level of patients",xlab = "sytolic",ylab = 
       "count",xlim = c(60,200),ylim = c(0,30000)) 
boxplot(cardio_d$systolic) 
summary(cardio_d$systolic) 
skewness(cardio_d$systolic) 
##Exploring the diastolic variable 
hist(cardio_d$diastolic, col = "blue",main = "diastolic level of patients",xlab = 
       "diastolic(mmHg)",ylab = "count") 
boxplot(cardio_d$diastolic) 
summary(cardio_d$diastolic) 
skewness(cardio_d$diastolic) 
##Exploring the Bmi variable 
hist(cardio_d$Bmi, col = "blue",main = "BMi of patients",xlab = "BMI",ylab = 
       "count",xlim=c(0,60),breaks = 100) 
boxplot(cardio_d$Bmi) 
summary(cardio_d$Bmi) 
skewness(cardio_d$Bmi) 
##Exploring the cholesterol variable 
barplot(sort(table(cardio_d$cholesterol),decreasing = T),col=c("blue","orange"),main = 
          "Cholesterol level distribution") 
summary(cardio_d$cholesterol) 
##Exploring the cardiovascular disease variable 
barplot(sort(table(cardio_d$cv_disease),decreasing = T),col=c("blue","orange"),main = 
          "Cardiovascular disease", ylim = c(0,35000)) 
##Exploring the glucose variable 
barplot(sort(table(cardio_d$glucose),decreasing = T),col=c("blue","orange"),main="Glucose 
level",ylim = c(0,60000)) 
##Exploring the smoke variable 
barplot(sort(table(cardio_d$smoke),decreasing = T),col = c("blue","orange"),main = "smoking 
event",ylim = c(0,70000)) 
##Exploring alcohol intake 
barplot(sort(table(cardio_d$alchohol_intake),decreasing = T),col = 
          c("blue","orange"),main="alchohol intake") 
##Exploring the physical activity 
barplot(sort(table(cardio_d$physical_activity),decreasing = T),col = c("blue","orange"),main = 
          "Physical activity") 
summary(cardio_d) 
dim(cardio_d) 
str(cardio_d) 
##Exploring gender and cardiovascular disease 
tbl <- with(cardio_d,table(cv_disease,gender)) 
barplot(tbl,beside = TRUE, legend=TRUE, col = c("blue","orange"),xlab="Gender", ylab = 
          "count",main = "Gender distribution against cardiovascular disease") 
tabyl(cardio_d,gender) %>% adorn_percentages("col") %>% adorn_pct_formatting(digits = 1) 
tabyl(cardio_d,gender,cv_disease) %>% adorn_percentages("row") %>% 
  adorn_pct_formatting(digits = 1) 
##Exploring cholesterol and cardiovascular disease 
tbl2 <- with(cardio_d,table(cv_disease,cholesterol)) 
barplot(tbl2,beside = TRUE, legend=TRUE, col = c("blue","orange"),xlab="Cholesterol", ylab = 
          "count",main = "Cholesterol level in patients and diagnosis of cadiovascular disease") 
##Exploring glucose and cardiovascular disease 
tbl3 <- with(cardio_d,table(cv_disease,glucose)) 
barplot(tbl3,beside = TRUE, legend=TRUE, col = c("blue","orange"),xlab="Glucose", ylab = 
          "count",main = "glucose level in patients and diagnosis of cardiovascular disease") 
##Exploring smoking and cardiovascular disease 
tbl4 <- with(cardio_d,table(cv_disease,smoke)) 
barplot(tbl4,beside = TRUE, legend=TRUE, col = c("blue","orange"),xlab="Smoke", ylab = 
          "count",main = "smoke event in patients and diagnosis of cardiovascular disease") 
##Exploring alcohol intake and cardiovascular disease 
tbl5 <- with(cardio_d,table(cv_disease,alchohol_intake)) 
barplot(tbl5,beside = TRUE, legend=TRUE, col = c("blue","orange"),xlab="Alchohol intake", 
        ylab = "count",main = "alchohol intake of patients and diagnosis of cardiovascular disease") 
##Exploring physical activity and cardiovascular disease 
tbl6 <- with(cardio_d,table(cv_disease,physical_activity)) 
barplot(tbl6,beside = TRUE, legend=TRUE, col = c("blue","orange"),xlab="Physical activity", 
        ylab = "count",main = "physical activity of patients and diagnosis of cardiovascular disease") 
##Correlation 
cardio_numerical <- subset(cardio_d, select = c(age_years,height,weight,systolic,diastolic,Bmi)) 
view(cardio_numerical) 
cardio_numerical 
corr <- cor(cardio_numerical,method = c("pearson")) 
corrplot(corr) 
?corrplot 
corrplot(corr,method = c("shade")) 
ggcorrplot(corr, hc.order = TRUE, type = "lower",lab = TRUE) 
corr <- cor(cardio_numerical,method = c("pearson")) 
nam <- cor(cardio_numerical,method = c("pearson")) 
nam 
cor(bmi,weight) 
##scatter plot 
plot(cardio_d$weight,cardio_d$Bmi,xlab = "weight",ylab = "Bmi",xlim = c(40,140),ylim = 
       c(10,50)) 
summary(cardio_d$weight) 
cor.test(weight) 
plot(cardio_d$diastolic,cardio_d$systolic,xlab = "diastolic",ylab = "systolic") 
regplot(cardio_d,plots = c(cardio_d$bmi,cardio_d$weight)) 
?regplot 
##Logistic regression  
##Splitting int test and train 
set.seed(101) 
sample <- sample.split(cardio_d$cv_disease,SplitRatio = 0.7) 
train <- subset(cardio_d,sample==T) 
test <- subset(cardio_d,sample==F) 
model <- glm(cv_disease ~ ., family = binomial(link = "logit"),data = train) 
summary(model) 
new_step_model <- step(model) 
summary(new_step_model) 
test$predicted_cvdisease <- predict(model,newdata = test,type="response") 
hist(test$predicted_cvdisease) 
##Confusion matrix 
table(test$cv_disease,test$predicted_cvdisease > 0.5) 
step(model) 
caret::varImp(model) 
View(cardio_d) 
roc1 <- roc(test$cv_disease,test$predicted_cvdisease) 
plot(roc1,col="brown",lty=2,lwd=4) 
auc(roc1)
