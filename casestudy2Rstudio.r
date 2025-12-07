library(readr)
data <- read_csv("~/Downloads/bina_az.csv")
View(data)
'''
1. Remove “X1” columns and assign it to “newdata”.
'''
newdata <- data %>% select(-N)

'''
2. Move variable “ID” to first column.
'''
newdata %>% relocate(ID , before. = nov)

'''
3. Select Address columns.
'''
newdata %>% select(Adres_1)

'''
4. Create new variable. Name it “newcol” and the value is “sahe” divided by “otaq”.
Keep only newcreated variable.
'''
library(dplyr)

newdata <- newdata %>% mutate(newcol = as.numeric(sahe) / as.numeric(otaq)) 


'''
5. What is the maximum price of “kohne tikili”?
'''
newdata$max_price <- newdata %>% filter(nov == "Köhnə tikili") %>% summarise(max_price = max(qiymet))


'''
6. Find unique addresses in the "address" column.
'''
unique_addresses <-newdata %>%
  distinct(Adres_1,Adres_2,Adres_3,Adres_4,Adres_5)

'''
7. Show frequency of 'otaq' column for new houses (Yeni tikili) having price more
than 500 000.
'''
newdata %>% filter(nov == 'Yeni tikili' & qiymet > 500000 ) %>% count(otaq)

'''
8. Calculate average price of houses having 'kupça' and an area more than 200m2
'''
kupca_var <- newdata %>% filter(kupca == 'var') %>% filter(sahe >= 200)
mean_price <- mean(kupca_var$qiymet, na.rm = TRUE)

'''
9. Calculate price range of houses having 4 rooms.
'''
four_room <- newdata %>% filter(otaq == 4)
options(scipen = 999)
price_range <- range(four_room$qiymet, na.rm = TRUE)

'''
10.How many “mülkiyyətçi” placed an ad for a "Yeni tikili" with an area more than 100m2?
'''
persons_count <- newdata %>% filter(nov == 'Yeni tikili', sahe > 100, elani_yerlesdiren == 'mülkiyyətçi') %>% count()
