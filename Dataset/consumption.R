
# Load necessary libraries
library(readxl)
library(ggplot2)
library(dplyr)
library(tidyr)  # For reshaping data

# Define the file path
file_path <- "~/Downloads/Consumption1.xlsx"

# Load the data (adjust the sheet name accordingly)
consumption_data <- read_excel(file_path, sheet = 1)  # Replace with actual sheet name if necessary

# Rename the first column to 'Year'
colnames(consumption_data)[1] <- "Year"

# Convert year columns to numeric (skip 'Year' column)
consumption_data_clean <- consumption_data %>%
  pivot_longer(cols = -Year, names_to = "Region", values_to = "Consumption") %>%
  mutate(Consumption = as.numeric(Consumption), Year = as.factor(Year))

# Check the cleaned data structure
print(head(consumption_data_clean))

# Plotting multiple regions' consumption over time
ggplot(consumption_data_clean, aes(x = Year, y = Consumption, color = Region, group = Region)) +
  geom_line(size = 1) +
  theme_minimal() +
  labs(title = "Coal Consumption Over Time", x = "Year", y = "Consumption (kt)") +
  theme(legend.title = element_blank())

