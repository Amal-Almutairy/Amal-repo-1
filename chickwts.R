# Chickwts analysis
# Amal almutairy
# 15.10.2020

library(tidyverse)
library(DT)

# Built in data sets:
chickwts %>% 
  group_by(feed) %>%
 summarise(n = n(),
               average = mean(weight),
               SD = sd(weight))




# Plot 1
ggplot(chickwts, aes(feed, weight)) +
  geom_boxplot()



# Plot 2
ggplot(chickwts, aes(feed, weight)) +
  geom_jitter(width = 0.15) +
  stat_summary(fun.data = mean_sdl, 
               fun.args = list(mult = 1), 
               col = "red")



# Inferential Statistics
chickwts_lm <- lm(weight ~ feed , data =  chickwts)

chickwts_lm %>% 
anova(chickwts_lm)


# Rate of change
chickwts_lm <- chickwts_lm %>% 
chickwts_lm <- (diff [weight ~ feed] - value[data =  chickwts]) %>% 
  arrange(-diff)
 

chickwts.av <- aov(weight ~ feed, data = chickwts)
tukeyTest <- TukeyHSD(chickwts.ov)

tukeyTest
typeof(tukeyTest)
calss(tukeyTest)
names(tukeyTest)

data.table(tukeyTest) 



## Tukey’s Post-hoc test
chickwts.av <- aov(weight ~ feed, data = chickwts)
tukeyTest <- TukeyHSD(chickwts.av)
datatable(tukeyTest$feed)
