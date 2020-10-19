# Butterflies analysis
# Amal Almutairy
# 14.10.2020
# Small case study to analyze 4 different kinds of Butterflies in the world
library(tidyverse)
library(DT)
library(ggplot2) 
library(RColorBrewer)
library(dplyr)


# Read Butterflies data:
Butterflies <- read.csv("~/DataProject/Misk-Amal-2020/Butterflies.csv") 



# In a Garden I saw 4 spices of butterflies, which were:
# A Milbert
# Zebra
# Monarch
# And Julia


# Butterflies Data in site 1:
site1 <- filter(Butterflies, Butterflies$Site == "Site I")
ButterfliesSum <- sum(Site1$Height)
mean <- ButterfliesSum/nrow(Butterflies)


# Butterflies Data in site II:
site2 <- filter(Butterflies, Butterflies$Site == "Site II")
ButterfliesSum <- sum(site2$Height)
mean <- ButterfliesSum/nrow(Butterflies)

# Examine the data:
str(Butterflies)
summary(Butterflies)


# I collected a sample of the butterflies:
# Noticed that in Site I, Milbert and Monarch are almost equal in number:
# Plot
ggplot(Butterflies, aes(wingspan, Color))+
  geom_jitter(width = 0.15) +
  stat_summary(fun.data = mean_sdl, 
               fun.args = list(mult = 1), 
               col = "red")



# The mean of the wingspan in both sites is:
mean(wingspan)


 
# Descriptive statistics 



# Summary 
summary(Butterflies)


# Inferential Statistics
Butterflies_lm <- lm(wingspan ~ Butterfly_N , data =  Butterflies)

Butterflies_lm %>% 
  anova(Butterflies_lm)


# Butterflies in a table:
as_tibble(Butterflies)


# Rate of change





# Butterflies in site 1:
Butterflies %>% 
  group_by("Site" = "Site I")


# Butterflies in site 2:
Butterflies %>% 
  group_by(Site = "Site II")




Butterflies %>% 
  group_by("wingspan") %>% 
  slice(2:11)


# This way will give a 1-element long vector:
Butterflies_siteI <- Butterflies$Height [Butterflies$Site -- "Site I"]
siteI_mean <- sum(Butterflies_siteI)/length(Butterflies_siteI)

# mean(Butterflies_Site)
# Variance
Butterflies_var <- sum((Butterflies - site_mean)^2)/(wingspan(Butterflies_site) - 1)

# var(Butterflies_Site)
var(Butterflies)


# Standard deviation





# Standard deviation in Site 1:




