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

