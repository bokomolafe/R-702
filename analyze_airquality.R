# clear workspace and check working directory
rm(list = ls())
getwd()

# Load the built-in airquality dataset
# This dataset contains daily air quality measurements in New York,
# including variables like Ozone, Solar Radiation, Wind, and Temperature.
data("airquality")
# View the first few rows of the dataset
head(airquality)

# Get a summary of the dataset to check for missing values
# and understand variable distributions
summary(airquality)

# Display the structure of the dataset
# to understand the data types of each column
str(airquality)

# Check for missing values in each column
# This helps us identify any gaps in the data that may affect analysis
colSums(is.na(airquality))

# Remove rows with missing values to ensure data consistency in subsequent analysis
airquality_clean <- na.omit(airquality)

# View the cleaned dataset summary to verify the absence of missing data
summary(airquality_clean)

# Calculate the correlation matrix for numeric variables
# This helps us understand the relationships between different variables
cor_matrix <- cor(airquality_clean[, sapply(airquality_clean, is.numeric)])
print(cor_matrix)

# Load ggplot2 library for better visualization
library(ggplot2)

# Create a scatter plot to visualize the relationship between Temperature
# and Ozone levels
ggplot(airquality_clean, aes(x = Temp, y = Ozone)) +
    geom_point() +
    geom_smooth(method = "lm", col = "red") +
    labs(title = "Relationship between Temperature and Ozone levels",
         x = "Temperature (°F)",
         y = "Ozone (ppb)")

# Create a scatter plot to visualize the relationship
# between Temperature and Ozone levels
# Create a boxplot to examine the variation in Ozone levels across different months
ggplot(airquality_clean, aes(x = as.factor(Month), y = Ozone)) +
    geom_boxplot() +
    labs(title = "Ozone Levels in Different Months",
         x = "Month",
         y = "Ozone (ppb)") +
    scale_x_discrete(labels = c("May", "June", "July", "August", "September"))

# Summary of Findings
cat("The average Ozone level:", mean(airquality_clean$Ozone), "\n")
cat("The correlation between Temperature and Ozone is:", cor(airquality_clean$Temp, airquality_clean$Ozone), "\n")

