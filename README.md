# My R Project for Advanced R Course

This project is part of the Advanced R class and aims to apply version control using Git and GitHub while analyzing the `airquality` dataset in R. The dataset includes daily air quality measurements in New York, providing insights into Ozone levels, Solar Radiation, Wind, and Temperature.

## Project Objectives
1. Learn and apply Git and GitHub for version control.
2. Perform data cleaning, statistical summaries, and visualizations on the `airquality` dataset.
3. Implement a modular approach by refactoring analysis steps into reusable R functions.

## Project Structure
- **R Scripts**:
  - `analyze_airquality.R`: Main script containing data cleaning, analysis, and visualization functions.
- **Data**:
  - Placeholder for raw and processed datasets (not included in this repository).
- **Documentation**:
  - Project-related notes, this README file, and references.

## Features
### Data Cleaning
- The dataset contains missing values (`NA`) that are handled by the `clean_airquality()` function.
- The cleaned dataset is used for further analysis and visualizations.

### Statistical Summaries
- The `summarize_airquality()` function provides key descriptive statistics for all variables.

### Visualizations
1. **Histogram of Ozone Levels**:
   - Visualizes the distribution of ozone levels across the dataset.
2. **Time-Series Plot of Temperature Trends**:
   - Shows temperature variations for each month (May–September).
3. **Boxplot of Wind Speed by Month**:
   - Displays wind speed variations across different months.
4. **Scatter Plot of Solar Radiation vs. Ozone**:
   - Highlights the relationship between solar radiation and ozone levels.

### Modular Functi
