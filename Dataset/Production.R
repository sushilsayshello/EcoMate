# Load necessary libraries
library(readxl)
library(ggplot2)
library(dplyr)
library(tidyr)  # For reshaping data

# Define the file path
file_path <- "~/Downloads/Production1.xlsx"  # Adjust the path accordingly

# Load the data from the first sheet
production_data <- read_excel(file_path, sheet = 1)

# Rename the first column to 'Year'
colnames(production_data)[1] <- "Year"

# Convert relevant columns to numeric (skip 'Year')
production_data_clean <- production_data %>%
  pivot_longer(cols = -Year, names_to = "Production Type", values_to = "Production") %>%
  mutate(Production = as.numeric(Production), Year = as.factor(Year))

# Check the cleaned data structure
print(head(production_data_clean))

# Plotting multiple production types over time using a bar plot
ggplot(production_data_clean, aes(x = Year, y = Production, fill = `Production Type`)) +
  geom_bar(stat = "identity", position = "dodge") +  # Bar plot, position dodge for side-by-side bars
  theme_minimal() +
  labs(title = "Production Over Time", x = "Year", y = "Production (kt)") +
  theme(legend.title = element_blank())

