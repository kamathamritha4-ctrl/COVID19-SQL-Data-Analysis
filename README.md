# COVID-19 Data Analysis (SQL Project)

## 📌 Overview
This project analyzes global COVID-19 data using SQL Server to uncover trends in infection rates, death rates, and vaccination progress across countries.

---

## 🧹 Data Cleaning
- Converted data types using `TRY_CAST` and `TRY_CONVERT`
- Removed invalid/null records (e.g., missing iso_code)
- Standardized date formats for consistency

---

## 📊 Analysis Performed
- Calculated **death percentage (case fatality rate)** per country
- Analyzed **infection rate vs population**
- Identified countries with **highest infection rates**
- Computed **global death percentage**
- Built **rolling vaccination metrics** using window functions

---

## ⚡ Key SQL Skills Used
- Joins
- CTEs (Common Table Expressions)
- Window Functions (SUM OVER PARTITION BY)
- Aggregate Functions
- Temporary Tables
- Views
- Indexing (Performance Optimization)

---

## 🚀 Key Insights
- Some countries showed significantly higher infection rates relative to population
- Death percentages varied widely across regions, indicating differences in healthcare response
- Vaccination rollout trends showed steady growth but varied by country

---

## 🛠️ Tools Used
- SQL Server
- SSMS (SQL Server Management Studio)

---

## 📂 Project Files
- `Data_Cleaning.sql`
- `Data_Analysis.sql`

---

## 🔗 Future Improvements
- Add data visualization using Power BI / Tableau
- Automate data updates
- Perform deeper regional analysis
