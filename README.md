# COVID-19 Data Analysis SQL Project

## Overview

This project uses SQL queries to analyze COVID-19 data, focusing on cases, deaths, and vaccinations across different countries and continents. The analysis provides insights into the pandemic's impact and the progress of vaccination efforts worldwide.

## Data Sources

The project uses two main tables:
1. `CovidDeaths`: Contains data about COVID-19 cases and deaths.
2. `CovidVaccinations`: Contains data about COVID-19 vaccinations.

These tables are assumed to be in Data file above.

## Key Analyses

The SQL queries in this project perform the following analyses:

1. Death percentage by country
2. Infection rate compared to population
3. Countries with the highest infection rates
4. Countries with the highest death counts
5. Death counts by continent
6. Global COVID-19 numbers over time
7. Vaccination progress compared to population

## Main Queries

### 1. Death Percentage by Country
Calculates the likelihood of dying if contracting COVID-19 in a specific country.

### 2. Infection Rate Compared to Population
Shows the percentage of population infected with COVID-19 for each country.

### 3. Countries with Highest Infection Rates
Identifies countries with the highest COVID-19 infection rates relative to their population.

### 4. Countries with Highest Death Counts
Lists countries with the highest total death counts.

### 5. Death Counts by Continent
Breaks down death counts by continent.

### 6. Global COVID-19 Numbers
Provides a global summary of cases, deaths, and death percentage over time.

### 7. Vaccination Progress
Analyzes the progress of vaccinations compared to the population of each country.

## Advanced Techniques Used

- Common Table Expressions (CTE)
- Temporary Tables
- Window Functions
- Joins
- Aggregate Functions
- Views

## Usage

1. Ensure you have access to a SQL Server with the COVID-19 data loaded into tables named `CovidDeaths` and `CovidVaccinations`.
2. Run the queries in a SQL environment (e.g., SQL Server Management Studio).
3. Modify the queries as needed to focus on specific countries or time periods.

## Creating Views

The project includes an example of creating a view (`percentpopulationvaccinated`) for storing data to be used in later visualizations.

## Future Improvements

- Add more complex analyses, such as predictive models
- Incorporate more recent data as it becomes available
- Create dashboards or reports based on the query results

