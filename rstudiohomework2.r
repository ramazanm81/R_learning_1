#Disclaimer: Data scraped from bina.az. While data is real, case study modified for educational purposes. Answer the following questions:
library(dplyr)

  
#1. Rename “barter_mumkundurmu” column to “Barter” and “sign” column to “Valyuta” then assign dataset to “new_turbo_data”.
library(readr)
data2 <- read_csv("~/Downloads/turbo_az (1).csv")
View(data2)

new_turbo_data <- rename(data2,Barter = barter_mumkundurmu,Valyuta = sign)
View(new_turbo_data)


#2. Find maximum price of new "Lexus" cars.
new_lexus <- new_turbo_data %>% filter(Marka == "Lexus", Yeni == "Bəli") %>% summarise(Max_Price = max(Qiymet))
View(new_lexus)


#3. Which car ("marka") has the maximum price?
new_turbo_data %>% filter(Qiymet == max(Qiymet) )



#4. Which color is most frequent for BMW?
new_turbo_data %>% filter(Marka == "BMW") %>% count(Reng, sort = TRUE)


#5. How many black "Porsche" cars are new?
new_turbo_data %>% filter(Marka == "Porshe") %>% summarise(Count = n())


#6. What is the maximum price of "Mercedes" cars if the currency is "AZN" and "Oturucu" is "Tam"?
new_turbo_data %>% filter(Marka == "Mercedes", Oturucu == "Tam") %>% filter(Qiymet == max(Qiymet) )


#7. How many new cars are "Mercedes" brand and "E220" model?

new_turbo_data %>% filter(Marka == "Mercedes",Model == "E 220" ) %>% summarise(count = n())


#8. How many unique colors are in dataset?
new_turbo_data %>% summarise(color = n_distinct(Reng))

 
#9. What is the median price for black "Opel" cars?
new_turbo_data$Qiymet <- as.numeric(new_turbo_data$Qiymet)
new_turbo_data %>% filter(Marka == "Opel") %>% median(Qiymet, na.rm = TRUE)
str(new_turbo_data$Qiymet)

#10. How many Nissan cars are "Offroader / SUV”?
new_turbo_data %>% filter( Marka == "Nissan", Ban_novu == "Offroader / SUV") %>% summarise(count = n())
