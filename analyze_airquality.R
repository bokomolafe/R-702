# clear workspace and check working directory
rm(list = ls())
getwd()

# Load the airquality dataset
data("airquality")
# View the first few rows of the dataset
head(airquality)

# Summary statistics for the dataset
summary(airquality)

# Display the structure of the dataset
str(airquality)

# Check for missing values
colSums(is.na(airquality))

# Option to remove rows with any missing value
airquality_clean <- na.omit(airquality)

# View the cleaned dataset summary
summary(airquality_clean)

# Calculate the correlation matrix
cor_matrix <- cor(airquality_clean[, sapply(airquality_clean, is.numeric)])
print(cor_matrix)

# Load ggplot2 library for better visualization
library(ggplot2)


# Scatter plot of Ozone vs Temperature
ggplot(airquality_clean, aes(x = Temp, y = Ozone)) +
    geom_point() +
    geom_smooth(method = "lm", col = "red") +
    labs(title = "Relationship between Temperature and Ozone levels",
         x = "Temperature (°F)",
         y = "Ozone (ppb)")

# Boxplot for Ozone levels in different months
ggplot(airquality_clean, aes(x = as.factor(Month), y = Ozone)) +
    geom_boxplot() +
    labs(title = "Ozone Levels in Different Months",
         x = "Month",
         y = "Ozone (ppb)") +
    scale_x_discrete(labels = c("May", "June", "July", "August", "September"))

# Summary of Findings
cat("The average Ozone level:", mean(airquality_clean$Ozone), "\n")
cat("The correlation between Temperature and Ozone is:", cor(airquality_clean$Temp, airquality_clean$Ozone), "\n")


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


# Function to clean the airquality dataset by removing rows with NA values
clean_airquality <- function(data) {
    cleaned_data <- na.omit(data)
    return(cleaned_data)
}

# Call the function to clean the data
airquality_clean <- clean_airquality(airquality)


# Function to summarize the dataset
summarize_airquality <- function(data) {
    summary(data)
}

# Call the function to display the summary
summarize_airquality(airquality_clean)


# Function to create a histogram of Ozone levels
plot_histogram_ozone <- function(data) {
    library(ggplot2)
    ggplot(data, aes(x = Ozone)) +
        geom_histogram(binwidth = 10, fill = "skyblue", color = "black") +
        labs(title = "Distribution of Ozone Levels in New York",
             x = "Ozone (ppb)",
             y = "Frequency")
}

# Function to create a line plot for temperature across different months
plot_temperature_trend <- function(data) {
    ggplot(data, aes(x = Day, y = Temp, group = Month, color = as.factor(Month))) +
        geom_line() +
        labs(title = "Temperature Variations Across Months",
             x = "Day of the Month",
             y = "Temperature (°F)",
             color = "Month") +
        scale_color_discrete(labels = c("May", "June", "July", "August", "September"))
}

# Function to create a boxplot for wind speed across months
plot_wind_boxplot <- function(data) {
    ggplot(data, aes(x = as.factor(Month), y = Wind)) +
        geom_boxplot(fill = "lightgreen", color = "darkgreen") +
        labs(title = "Wind Speed Across Different Months",
             x = "Month",
             y = "Wind Speed (mph)") +
        scale_x_discrete(labels = c("May", "June", "July", "August", "September"))
}

# Function to create a scatter plot for solar radiation vs. ozone levels
plot_solar_vs_ozone <- function(data) {
    ggplot(data, aes(x = Solar.R, y = Ozone)) +
        geom_point(color = "orange") +
        geom_smooth(method = "lm", col = "red") +
        labs(title = "Solar Radiation vs Ozone Levels",
             x = "Solar Radiation (lang)",
             y = "Ozone (ppb)")
}

# Call the functions to generate the plots
plot_histogram_ozone(airquality_clean)
plot_temperature_trend(airquality_clean)
plot_wind_boxplot(airquality_clean)
plot_solar_vs_ozone(airquality_clean)

# Calculate the correlation matrix for numeric variables
# This helps us understand the relationships between different variables
cor_matrix <- cor(airquality_clean[, sapply(airquality_clean, is.numeric)])
print(cor_matrix)


# Perform linear regression
ozone_temp_model <- lm(Ozone ~ Temp, data = airquality_clean)
summary(ozone_temp_model)

# Plot the regression line on a scatter plot
ggplot(airquality_clean, aes(x = Temp, y = Ozone)) +
    geom_point() +
    geom_smooth(method = "lm", color = "blue") +
    labs(title = "Linear Regression: Temperature vs Ozone",
         x = "Temperature (°F)",
         y = "Ozone (ppb)")

# Load library for heatmap
library(reshape2)
library(ggplot2)

# Calculate correlation matrix and melt it
cor_matrix <- cor(airquality_clean[, sapply(airquality_clean, is.numeric)])
cor_melt <- melt(cor_matrix)

# Create heatmap
ggplot(data = cor_melt, aes(x = Var1, y = Var2, fill = value)) +
    geom_tile() +
    scale_fill_gradient2(low = "blue", high = "red", mid = "white", midpoint = 0, limit = c(-1, 1)) +
    labs(title = "Correlation Heatmap", x = "", y = "") +
    theme_minimal()

# Save cleaned dataset as a CSV file
write.csv(airquality_clean, "cleaned_airquality.csv", row.names = FALSE)

install.packages("testthat")

# test_clean_airquality.R
library(testthat)

test_that("clean_airquality removes rows with NA", {
    data <- data.frame(A = c(1, 2, NA), B = c(3, 4, 5))
    cleaned_data <- clean_airquality(data)
    expect_equal(nrow(cleaned_data), 2)
})

library(testthat)
test_dir("tests")

