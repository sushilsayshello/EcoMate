
# Load necessary libraries
library(readxl)
library(ggplot2)
library(dplyr)
library(tidyr)  # For reshaping data

# Define the file path
file_path <- "~/Downloads/Fuel1.xlsx"

# Load the data (adjust the sheet name accordingly)
fuel_data <- read_excel(file_path, sheet = "Sheet1")  # Replace with actual sheet name

# Rename the first column to 'Fuel Type'
colnames(fuel_data)[1] <- "Fuel Type"

# Convert year columns to numeric (skip 'Fuel Type' column)
fuel_data_clean <- fuel_data %>%
  pivot_longer(cols = -`Fuel Type`, names_to = "Year", values_to = "Consumption") %>%
  mutate(Consumption = as.numeric(Consumption), Year = as.factor(Year))

# Check the cleaned data structure
print(head(fuel_data_clean))

# Plotting multiple fuel types over time
ggplot(fuel_data_clean, aes(x = Year, y = Consumption, color = `Fuel Type`, group = `Fuel Type`)) +
  geom_line(size = 1) +
  theme_minimal() +
  labs(title = "Fuel Consumption Over Time", x = "Year", y = "Fuel Consumption (PJ)") +
  theme(legend.title = element_blank())
