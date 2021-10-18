# lab.R

# Importing libraries
library(tidyverse)
library(janitor)
library(ggExtra)

# Reading and assigning dataset to bike_buyers
bike_buyers <- read_csv("data/bike_buyers.csv")

# Cleaning names
bike_buyers <- bike_buyers %>% 
  clean_names()

# Removing "ID" variable in bike_buyers
bike_buyers <- select(bike_buyers, -id)

# Get high level overview of data 
str(bike_buyers)
summary(bike_buyers)
class(bike_buyers)

# Histogram
bike_buyers %>% 
  drop_na() %>% 
  ggplot() +
  theme_bw() +
  geom_histogram(aes(x = age, fill = gender), 
                 binwidth = 5, 
                 position = "identity", 
                 alpha = 0.5, 
                 color = "black")

# Density plot
bike_buyers %>% 
  ggplot() +
  theme_bw() +
  geom_density(aes(x = Age))

# Bar chart
bike_buyers %>% 
  drop_na() %>% 
  ggplot() +
  theme_bw() +
  geom_bar(aes(x = gender, fill = gender))

# Scatter plot (Commonly used to 
# contrast two numerical (continuous) variables)
p <- bike_buyers %>% 
  drop_na %>% 
  ggplot() +
  theme_bw() +
  geom_point(aes(x = age, y = income))

ggExtra::ggMarginal(p, type = "histogram")

# Box plot
bike_buyers %>% 
  drop_na %>% 
  ggplot() +
  theme_bw() + 
  geom_boxplot(aes(x = Gender, y = income, fill = education))
  
# Facet bar plot 
bike_buyers %>% 
  drop_na %>% 
  ggplot() +
  theme_bw() +
  geom_bar(aes(x = gender, fill = gender)) +
  facet_wrap(~ education)

# --- Extra plots ---

# Scatter plot 
bike_buyers %>% 
  drop_na() %>% 
  ggplot() +
  theme_bw() +
  geom_point(aes(x = gender, y = cars, fill = gender,  size = 1.2), 
             color = "black", 
             shape = 21)

# Geom jitter
bike_buyers %>% 
  drop_na() %>% 
  ggplot() + 
  theme_bw() +
  geom_jitter(aes(x = gender, y = cars, fill = gender), 
              color = "black", 
              shape = 21) 

# Violin plot
bike_buyers %>% 
  drop_na() %>% 
  ggplot() + 
  theme_bw() +
  geom_violin(aes(x = gender, y = cars, fill = gender))

# Density plot
bike_buyers %>% 
  drop_na() %>% 
  ggplot() +
  theme_bw() +
  geom_density(aes(y = cars)) +
  facet_wrap(~gender)

# Violin plot with geom jitter
bike_buyers %>% 
  drop_na() %>% 
  ggplot(aes(x = gender, y = cars, fill = gender)) + 
  theme_bw() +
  geom_violin() +
  geom_jitter(color = "black", 
              shape = 21)
  
  
# --- Multivariate Analysis --- 






