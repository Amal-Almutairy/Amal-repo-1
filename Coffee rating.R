# Coffee ratings analysis
# 10/11/2020
# Amal Almutairy
library(tidyverse)
library(rio)

# Data Source: https://www.kaggle.com/volpatto/coffee-quality-database-from-cqi

# coffee quality database:
View(merged_data_cleaned)
library(readr)
merged_data_cleaned <- read_csv("Coffee/Coffee Quality database/merged_data_cleaned.csv")
Arabica_data_cleaned <- read_csv("Coffee/Coffee Quality database/arabica_data_cleaned.csv")
Robusta_data_cleaned <- read_csv("Coffee/Coffee Quality database/robusta_data_cleaned.csv")


# Get familiar with our data
summary(merged_data_cleaned)
names(merged_data_cleaned)
glimpse(merged_data_cleaned)

# more detail:
attributes(merged_data_cleaned)
typeof(merged_data_cleaned)

# Examine the data:
str(Arabica_data_cleaned)
summary(Arabica_data_cleaned)




# arrange by region


