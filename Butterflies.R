# Butterflies analysis
# Amal Almutairy
# 14.10.2020
# Small case study to analyse 4 diffrent kinds of Butterflies in a garden
library(tidyverse)


# Read Butterflies data:
Butterflies <- read.csv("~/DataProject/Misk-Amal-2020/Butterflies.csv") 

# Butterflies Data:
Butterflies <- c(Milbert = 300, Zebra = 45, Monarch = 200, Julia = 80)
wingspan <- c(4.2, 5, 8.6, 4)


# Examine the data:
str(Butterflies)
summary(Butterflies)

# In a Garden I saw 4 spices of butterflies, which were:
# 1- Milbert:
Milbert <- 300

# the wingspan of this spices is:
Milbert_wingspan <- 4.2


# And a Zebra:
Zebra <- 45

# And the wingspan of this spices is:
Zebra_wingspan <- 5

# And Monarch
Monarch <- 200

# the wingspan of this spices is:
Monarch_wingspan <- 8.6 

# And Julia:
Julia <- 80

# And the wingspan of this spices is:
Julia_wingspan <- 4



# I collected a sample of the butterflies:
# Noticed that in Site I, Milbert and Monarch are equal in number:



# The mean of the wingspan in both sites is:
mean(wingspan)


 
# Descriptive statistics 



Butterflies %>% 
  slice_max(rate, n = 1)


# Summary 
Butterflies %>% 
  filter(origin) 
