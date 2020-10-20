# ggplot2 coding challenge
# Amal Almutairy
# 19.10.2020

# load packages
library(ggplot2) #part of the tidyverse library(tidyverse)
library(RColorBrewer)
library(dplyr)
library(tidyverse)
library(tinytex)


# Using color:
# Hex codes - 6 alpha-numeric digits long
# Base 16 (hexadecimal) numbering system
# 16 1-digit (16^1): 0-9, a-f (or A-F)
# 256 2-digit (16^2): 00-ff

# Base 10 numbering systems
# 10 1-digit (10^1): 0-9
# 100 2-digit (10^2): 00-99

# Hex codes: "#RRGGBB"
"#FFFFFF" # All color = White
"#000000" # No color = Black
"#af9900" # dark gold

munsell::plot_hex("#fdc086")

# In total we have 
256*256*256 # RR*GG*BB - 16 777 216

# Display
display.brewer.all()
display.brewer.all(type = "seq")
display.brewer.pal(3, "Dark2")

# Get hex codes
brewer.pal(9, "Blues")

# Get 4th, 6th, 8th value?
myBlues <- brewer.pal(9, "Blues")[c(4,6,8)]
munsell::plot_hex(myBlues)

# Plotting challenge:
# Built-in data set:
iris
class(iris)
nrow(Vocab)

Vocab


# Plot Sepal Width vs Sepal Length (y vs x, y ~ x)
# 1 - Basic scatter plot with color
# First, save the base layer
g <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) 

# Then add various other layers
g +
  geom_point()

# Problem with using points: Overplotting :/
# Here because of "low precision data"
# Solutions

# A - Easy, inflexible
g +
  geom_jitter()

# B - Easy, even more inflexible
g +
  geom_point(position = "jitter")

# C - Explicit, full-featured
# use seed AND you can reuse this object
# Define position as an object
posn_j <- position_jitter(seed = 136)
# Not add to the geom_
g +
  geom_point(position = posn_j)

# Another example of "low precision" is integers
library(car)
Vocab
nrow(Vocab)
# integers
# education (years of edu)
# vocabulary (test score) 
# We only get intersecting points
ggplot(Vocab, aes(education, vocabulary)) +
  geom_point()


ggplot(Vocab, aes(education, vocabulary)) +
  geom_jitter(shape = ".", alpha = 0.25)

# A further example for overplotting:
ggplot(diamonds, aes(carat, price)) +
  geom_point(alpha = 0.2, shape = ".")

# Modify further for overplotting...
# 2 - Change shape (shape 1 with opaque points)
# 2a -Change alpha (transparency with shape 16)
# 3 - Add linear models, without background
# se = the 95%CI for the lm
# defaule method for a small n is "loess"
# which is a weighted moving average
g <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) 

g +
  geom_point(position = posn_j, shape = 1) +
  geom_smooth(method = "lm", se = FALSE)

# Aesthetics - MAPPING a variable onto a scale (x, y, color, shape, size, etc.)
# The "invisible" group aesthetics inherits from e.g. color & shape
# Attributes - SETTING how a geom will appear (color, shape, size, etc.)
# Attributes will cancel out aesthetics 

# 4 - Re-position the legend to the upper-left corner
# 5 - Change the colors - use Dark2 from color brewer
# scale == aesthetic == axis
# discrete (ggplot2) == qualitative (color brewer) == Factor (in base R) == Categorical

g +
  geom_point(position = posn_j, shape = 1) +
  geom_smooth(method = "lm", se = FALSE) +
  scale_color_brewer("Iris Species", palette = "Dark2") +
  theme(legend.position = c(0.1, 0.9))

scale_color_brewer("Iris Species", palette = "Dark2")

# How to set the colors manually?
myCol <- brewer.pal(3, "Dark2")

g +
  geom_point(position = posn_j, shape = 1) +
  geom_smooth(method = "lm", se = FALSE) +
  scale_colour_manual("Species", values = myCol) +
  theme(legend.position = c(0.1, 0.9))

# As a NAMED character vector 
myCol2 <- c(Setosa = "#000000",
            virginica = "#E69F00",
            versiclor = "#56B4E9")

munsell::plot_hex("#cb181d")

# 6 - Remove non-data ink
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point(position = posn_j, shape = 16, alpha = 0.6) +
  geom_smooth(method = "lm", se = FALSE, color = "#cb181d") +
  coord_cartesian(xlim = c(4,8), ylim = c(2,5), expand = 0, clip = "off") +
  facet_grid(. ~ Species)


# 7 - Relabel the axes, add a title or caption
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point(position = posn_j, shape = 16, alpha = 0.6) +
  geom_smooth(method = "lm", se = FALSE, color = "#cb181d") +
  coord_cartesian(xlim = c(4,8), ylim = c(2,5), expand = 0, clip = "off") +
  facet_grid(. ~ Species) +
  labs(title = "The iris data set, again!",
       caption = "Andreson,1931",
       x = "Sepal Length (cm)",
       y = "Sepal Width (cm)",
       color = "")


# 8 - Change the aspect ratio
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point(position = posn_j, shape = 16, alpha = 0.6) +
  geom_smooth(method = "lm", se = FALSE, color = "#cb181d") +
  coord_cartesian(xlim = c(4,8), ylim = c(2,5), expand = 0, clip = "off") +
  facet_grid(. ~ Species) +
  labs(title = "The iris data set, again!",
       caption = "Andreson,1931",
       x = "Sepal Length (cm)",
       y = "Sepal Width (cm)",
       color = "") +
  theme_classic(10) +
  theme(legend.position = c(0.2, 0.9),
        aspect.ratio = 1)



# 9 - Set limits on the x and y axes
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point(position = posn_j, shape = 16, alpha = 0.6) +
  geom_smooth(method = "lm", se = FALSE, color = "#cb181d") +
  coord_cartesian(xlim = c(4,8), ylim = c(2,5), expand = 0, clip = "off") +
  facet_grid(. ~ Species) +
  labs(title = "The iris data set, again!",
       caption = "Andreson,1931",
       x = "Sepal Length (cm)",
       y = "Sepal Width (cm)",
       color = "") +
  theme_classic(10) +
  theme(legend.position = c(0.2, 0.9),
        aspect.ratio = 1,
        axis.line = element_blank())


# 10 - Extra, remove color and use facets instead
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point(position = posn_j, shape = 16, alpha = 0.6) +
  geom_smooth(method = "lm", se = FALSE, color = "#cb181d") +
  coord_cartesian(xlim = c(4,8), ylim = c(2,5), expand = 0, clip = "off") +
  facet_grid(. ~ Species) +
  labs(title = "The iris data set, again!",
       caption = "Andreson,1931",
       x = "Sepal Length (cm)",
       y = "Sepal Width (cm)",
       color = "") +
  theme_classic(10) +
  theme(legend.position = c(0.2, 0.9),
        aspect.ratio = 1,
        axis.line = element_blank())




# Another data set ----
msleep2 <- msleep %>% 
  select(vore, sleep_total) %>% 
  na.omit()

msleep2

# Basis histogram
ggplot(msleep2, aes(sleep_total)) +
  geom_histogram()

# ggplot2's idea of a dot plot:
ggplot(msleep2, aes(sleep_total)) +
  geom_dotplot()

# a) "Dot" plot
ggplot(msleep2, aes(x = vore, y = sleep_total, color = vore)) +
  geom_dotplot(position = position_jitter(width = 0.2, seed = 136), 
               shape = 16, alpha = 0.65) +
  scale_color_brewer(palette = "Dark2") +
  scale_y_continuous(limits = c(0,24),
                     breaks = seq(0, 24, 6),
                     expand = c(0,0)) +
  scale_x_discrete(labels = c("Carnivore",
                              "Herbivore",
                              "Insectivore",
                              "Omnivore")) +
  labs(title = "a) Dot Plot",
       x = "Eating Habits",
       y = "Total Sleep Time (h)") +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        legend.position = "none") +
  NULL

# The Insectivores are represented by only 5 specimens (very low n)
# If anything we can say that this distribution looks bimodal, but we need more observations.

# The Omnivores seem to have a positively skewed distribution


# How about a density plot:
ggplot(msleep2, aes(sleep_total, color = vore)) +
  geom_density(vore)

# b) "Dot" plot with mean and sd
ggplot(msleep2, aes(x = vore,
                    y = sleep_total,
                    color = vore,
                    fill = vore)) +
  geom_dotplot() 

ggplot(msleep2, aes(sleep_total)) +
  geom_dotplot(msleep2, aes(x = vore,
                            y = sleep_total,
                            color = vore,
                            fill = vore)) +
  geom_col() +
  scale_y_continuous(limits = c(0,24),
                     breaks = seq(0, 24, 6),
                     expand = c(0,0)) +
  scale_x_discrete(labels = c("Carnivore",
                              "Herbivore",
                              "Insectivore",
                              "Omnivore")) +
  labs(title = "b) Dot plot",
       x = "Eating Habits",
       y = "Total Sleep Time (h)") +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        legend.position = "none") +
  NULL


# c) Just the mean and the sd

# d) Bar (aka "Dynamite") plot
ggplot(msleep2, aes(x = vore,
                    y = sleep_total,
                    color = vore,
                    fill = vore)) +
  geom_col() +
  scale_y_continuous(limits = c(0,24),
                     breaks = seq(0, 24, 6),
                     expand = c(0,0)) +
  scale_x_discrete(labels = c("Carnivore",
                              "Herbivore",
                              "Insectivore",
                              "Omnivore")) +
  labs(title = "d) Bar plot",
       x = "Eating Habits",
       y = "Total Sleep Time (h)") +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        legend.position = "none") +
  NULL



# e) Box plot
ggplot(msleep2, aes(x = vore,
                    y = sleep_total,
                    color = vore,
                    fill = vore)) +
  geom_boxplot() +
  scale_y_continuous(limits = c(0,24),
                     breaks = seq(0, 24, 6),
                     expand = c(0,0)) +
  scale_x_discrete(labels = c("Carnivore",
                              "Herbivore",
                              "Insectivore",
                              "Omnivore")) +
  labs(title = "e) Box plot",
       x = "Eating Habits",
       y = "Total Sleep Time (h)") +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        legend.position = "none") +
  NULL


# f) Violin plot
ggplot(msleep2, aes(x = vore,
                    y = sleep_total,
                    color = vore,
                    fill = vore)) +
  geom_violin() +
  scale_y_continuous(limits = c(0,24),
                     breaks = seq(0, 24, 6),
                     expand = c(0,0)) +
  scale_x_discrete(labels = c("Carnivore",
                              "Herbivore",
                              "Insectivore",
                              "Omnivore")) +
  labs(title = "f) Violin plot",
       x = "Eating Habits",
       y = "Total Sleep Time (h)") +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        legend.position = "none") +
  NULL



# What are diagnostic plots?
# Plots that are used to confirm or check 
# assumptions and results of models and/or statistics
setosa_lm <- lm(Sepal.Width ~ Sepal.Length, data = iris[iris$Species == "setosa",])
plot(setosa_lm)



