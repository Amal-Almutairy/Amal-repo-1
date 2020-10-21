# Butterflies analysis
# Amal Almutairy
# 14.10.2020

# Data source: ??

# Small case study to analyze 4 different kinds of Butterflies in the world

library(tidyverse)
library(DT)


# Read Butterflies data:
Butterflies <- read.csv("Butterflies.csv") 

# In a Garden I saw 4 spices of butterflies, which were:
# A Milbert
# Zebra
# Monarch
# And Julia


# Importing some Data:



# Examine the data:
str(Butterflies)
summary(Butterflies)


# I collected a sample of the butterflies:
# Noticed that in Site I, Milbert and Monarch are almost equal in number:
# Plot
ggplot(Butterflies, aes(wingspan, Speed))+
  geom_jitter(width = 1.5) +
  stat_summary(fun.data = mean_sdl, 
               fun.args = list(mult = 1), 
               col = "red")




# Standard deviation Butterflies wingspan
# Mean
sd(Butterflies$wingspan, na.rm = TRUE) # is 1.565508
mean(Butterflies$wingspan, na.rm = TRUE) # is 5.365
summary(Butterflies$wingspan)

# summary(Butterflies$wingspan)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 4.000   4.200   4.650   5.365   5.850   8.600 

sd(Butterflies$Speed, na.rm = TRUE) # is 4.186759
mean(Butterflies$Speed, na.rm = TRUE) # is 15.65
summary(Butterflies$Speed)

# summary(Butterflies$Speed)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#   12.50   14.00   15.65   18.50   25.00 


# Normal Probabilities for the area below
pnorm(1.5) # is 0.9331928

# Normal Probabilities for the area above
1 - pnorm(1.5) # is 0.0668072

# Normal Probabilities for the area middle
pnorm(1.5) - pnorm(-1.4) # is 0.8524361

S <- (Butterflies$Speed)
W <- (Butterflies$wingspan)

mu <- 5.3
sigma <- 1.5

# Number of points on the distribution to calculate:
n_points <- 5000


# p(x <= 8.6)
pnorm(q=4, mean=5.3 , sd=1.5) # is (0.1930623)

pnorm(q=4, mean=5.3 , sd=1.5,lower.tail = T) # is (0.1930623)


# p(x >= 8.6)
pnorm(q=8.6, mean=5.3, sd=1.5,lower.tail = F) # is (0.01390345)

# Normal Distribution
mu 
sigma


# Z score:??
# p(Z >= 1)
pnorm(q=1, mean=0, sd=1,lower.tail = F) # is (0.1586553)



# percentile
qnorm(p=0.25, mean=5.3, sd=1.5,lower.tail = T) # is (4.288265)




# Probability density
dens <- dnorm(x, mean=5.3, sd=1.5)
plot(x, dens)

plot(x, dens, type="l", main="X~Normal: Mean=5.365, SD=1.5", xlab="x", ylab="Probability Density", las=1)

rnorm(n=20, mean=5.3, sd=1.5)

# the base layer
Butterflies %>% 
  select(wingspan, Speed) %>% 
  na.omit()


Butterflies2 <- Butterflies %>% 
  select(wingspan, Speed) %>% 
  na.omit()

B


Butterflies2 <- ggplot(iris, aes(x = Speed, y = wingspan, color = Butterflies)) 




# Construct plot
Butterflies2 +
  geom_point(position = Butterflies2, shape = 1) +
  geom_smooth(method = "lm", se = FALSE)





# Basis histogram
ggplot(Butterflies2, aes(Speed)) +
  geom_histogram()

# ggplot2's idea of a dot plot:
ggplot(Butterflies2, aes(Speed)) +
  geom_dotplot()


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




