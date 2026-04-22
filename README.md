# layoffs-sql-project
SQL-based project focused on data cleaning and exploratory data analysis (EDA) using a global layoffs dataset. Demonstrates real-world data preparation techniques and analytical querying to uncover trends and insights.
# 📉 Global Layoffs Analysis (SQL)

## 📝 Description
SQL-based project focused on data cleaning and exploratory data analysis (EDA) using a global layoffs dataset. Demonstrates real-world data preparation techniques and analytical querying to uncover trends and insights.

---

## 📊 Overview
This project transforms a raw layoffs dataset into a clean, analysis-ready format and explores trends across companies, countries, and time. It highlights practical SQL skills used in real-world data analysis workflows.

---

## 📁 Dataset
The dataset contains global layoffs information, including:
- Company  
- Country  
- Industry  
- Date  
- Total layoffs  

---

## 🔄 Data Cleaning Process
- Removed duplicate records using `ROW_NUMBER()`  
- Standardized text fields (company, country, industry)  
- Converted date fields into proper SQL `DATE` format  
- Replaced empty values with `NULL`  
- Handled missing values using joins and logical rules  
- Removed irrelevant or incomplete records  

---

## 📈 Exploratory Data Analysis (EDA)
- Aggregated layoffs by year, month, and country  
- Calculated rolling totals using window functions  
- Ranked companies by layoffs using `DENSE_RANK()`  
- Identified trends across industries and locations  

---

## 🔍 Key Insights
- Layoffs peaked significantly in 2022  
- The United States had the highest number of layoffs  
- Total layoffs exceeded 380,000 by 2023  
- Top companies contributing to layoffs varied each year  

---

## 🛠️ Tools & SQL Features
- MySQL  
- CTEs (`WITH`)  
- Window Functions (`ROW_NUMBER()`, `DENSE_RANK()`, `SUM OVER`)  
- Aggregations (`SUM`, `COUNT`)  
- Data Cleaning Techniques (TRIM, pattern matching)  
- Joins for data imputation  

---

## 📁 Project Structure
