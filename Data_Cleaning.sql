USE PortfolioProject;
GO
SELECT
    iso_code,
    continent,
    location,
    TRY_CONVERT(DATE, date, 101) AS date,

    TRY_CAST(population AS FLOAT) AS population,
    TRY_CAST(total_cases AS FLOAT) AS total_cases,
    TRY_CAST(new_cases AS FLOAT) AS new_cases,
    TRY_CAST(new_cases_smoothed AS FLOAT) AS new_cases_smoothed,
    TRY_CAST(total_deaths AS FLOAT) AS total_deaths,
    TRY_CAST(new_deaths AS FLOAT) AS new_deaths,
    TRY_CAST(new_deaths_smoothed AS FLOAT) AS new_deaths_smoothed,

    TRY_CAST(total_cases_per_million AS FLOAT) AS total_cases_per_million,
    TRY_CAST(new_cases_per_million AS FLOAT) AS new_cases_per_million,
    TRY_CAST(new_cases_smoothed_per_million AS FLOAT) AS new_cases_smoothed_per_million,
    TRY_CAST(total_deaths_per_million AS FLOAT) AS total_deaths_per_million,
    TRY_CAST(new_deaths_per_million AS FLOAT) AS new_deaths_per_million,
    TRY_CAST(new_deaths_smoothed_per_million AS FLOAT) AS new_deaths_smoothed_per_million,

    TRY_CAST(reproduction_rate AS FLOAT) AS reproduction_rate,
    TRY_CAST(icu_patients AS FLOAT) AS icu_patients,
    TRY_CAST(icu_patients_per_million AS FLOAT) AS icu_patients_per_million,
    TRY_CAST(hosp_patients AS FLOAT) AS hosp_patients,
    TRY_CAST(hosp_patients_per_million AS FLOAT) AS hosp_patients_per_million,

    TRY_CAST(weekly_icu_admissions AS FLOAT) AS weekly_icu_admissions,
    TRY_CAST(weekly_icu_admissions_per_million AS FLOAT) AS weekly_icu_admissions_per_million,
    TRY_CAST(weekly_hosp_admissions AS FLOAT) AS weekly_hosp_admissions,
    TRY_CAST(weekly_hosp_admissions_per_million AS FLOAT) AS weekly_hosp_admissions_per_million

INTO CovidDeaths_Clean
FROM CovidDeaths
WHERE iso_code IS NOT NULL;


SELECT
    iso_code,
    continent,
    location,
    TRY_CONVERT(DATE, date, 101) AS date,

    TRY_CAST(new_tests AS FLOAT) AS new_tests,
    TRY_CAST(total_tests AS FLOAT) AS total_tests,
    TRY_CAST(total_tests_per_thousand AS FLOAT) AS total_tests_per_thousand,
    TRY_CAST(new_tests_per_thousand AS FLOAT) AS new_tests_per_thousand,
    TRY_CAST(new_tests_smoothed AS FLOAT) AS new_tests_smoothed,
    TRY_CAST(new_tests_smoothed_per_thousand AS FLOAT) AS new_tests_smoothed_per_thousand,
    TRY_CAST(positive_rate AS FLOAT) AS positive_rate,
    TRY_CAST(tests_per_case AS FLOAT) AS tests_per_case,

    tests_units,

    TRY_CAST(total_vaccinations AS FLOAT) AS total_vaccinations,
    TRY_CAST(people_vaccinated AS FLOAT) AS people_vaccinated,
    TRY_CAST(people_fully_vaccinated AS FLOAT) AS people_fully_vaccinated,
    TRY_CAST(new_vaccinations AS FLOAT) AS new_vaccinations,
    TRY_CAST(new_vaccinations_smoothed AS FLOAT) AS new_vaccinations_smoothed,

    TRY_CAST(total_vaccinations_per_hundred AS FLOAT) AS total_vaccinations_per_hundred,
    TRY_CAST(people_vaccinated_per_hundred AS FLOAT) AS people_vaccinated_per_hundred,
    TRY_CAST(people_fully_vaccinated_per_hundred AS FLOAT) AS people_fully_vaccinated_per_hundred,
    TRY_CAST(new_vaccinations_smoothed_per_million AS FLOAT) AS new_vaccinations_smoothed_per_million,

    TRY_CAST(stringency_index AS FLOAT) AS stringency_index,
    TRY_CAST(population_density AS FLOAT) AS population_density,
    TRY_CAST(median_age AS FLOAT) AS median_age,
    TRY_CAST(aged_65_older AS FLOAT) AS aged_65_older,
    TRY_CAST(aged_70_older AS FLOAT) AS aged_70_older,
    TRY_CAST(gdp_per_capita AS FLOAT) AS gdp_per_capita,
    TRY_CAST(extreme_poverty AS FLOAT) AS extreme_poverty,
    TRY_CAST(cardiovasc_death_rate AS FLOAT) AS cardiovasc_death_rate,
    TRY_CAST(diabetes_prevalence AS FLOAT) AS diabetes_prevalence,
    TRY_CAST(female_smokers AS FLOAT) AS female_smokers,
    TRY_CAST(male_smokers AS FLOAT) AS male_smokers,
    TRY_CAST(handwashing_facilities AS FLOAT) AS handwashing_facilities,
    TRY_CAST(hospital_beds_per_thousand AS FLOAT) AS hospital_beds_per_thousand,
    TRY_CAST(life_expectancy AS FLOAT) AS life_expectancy,
    TRY_CAST(human_development_index AS FLOAT) AS human_development_index

INTO CovidVaccinations_Clean
FROM CovidVaccinations
WHERE iso_code IS NOT NULL;

CREATE INDEX idx_location_date 
ON PortfolioProject..CovidDeaths_Clean(location, date);

CREATE INDEX idx_vac_location_date 
ON PortfolioProject..CovidVaccinations_Clean(location, date);

