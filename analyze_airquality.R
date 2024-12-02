# clear workspace and check working directory
rm(list = ls())
getwd()

# Load ggplot2 library for better visualization
library(ggplot2)

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
