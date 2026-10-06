# Data_Transfer SQL Project -- README

## 📌 Introduction
- The Data Transformer project is a comprehensive set of advanced SQL tasks designed to demonstrate proficiency in data manipulation and analysis.
- The primary goal is to build skills necessary to transform and prepare data for reporting and complex queries using various advanced SQL concepts, including:
- Joins (INNER, LEFT, RIGHT, FULL OUTER/UNION) 
- Subqueries 
- Date and String Manipulation Functions 
- Window Functions (SUM() OVER, RANK()) 
- The SQL CASE Expression

------------------------------------------------------------------------

## 🚀 Setup and Execution
- To replicate this project locally, follow these steps:
- Database Setup: Connect to your MySQL environment (or specified DB).
- Create Tables: Run the Data Transfer.sql script to define the schema and insert the sample data.
- Execute Queries: Run the Data Transfer.sql file to execute all 17 analytical tasks.

------------------------------------------------------------------------

## 📑Assumptions Made
- In order to successfully complete the project, the following assumptions were made:
- FULL OUTER JOIN: Since MySQL does not support FULL OUTER JOIN, it was implemented using a LEFT JOIN combined with a RIGHT JOIN via the UNION operator.
- Date Functions: All date and string manipulation functions (DATEDIFF, DATE_FORMAT, CONCAT, etc.) were implemented using MySQL-specific syntax for compatibility with the execution environment.
- Salary Categories (Task 17): Arbitrary thresholds were chosen for categorizing salaries (e.g., > 60000 for High, >= 50000 for Medium) as specific values were not provided in the requirements.

------------------------------------------------------------------------

## 📂 Files Included

-   `README.md` (you are reading it)
-   SQL script (your main code)

------------------------------------------------------------------------

## ✅ Conclusion

This SQL project covers: ✔ Database creation\
✔ Joins\
✔ Subqueries\
✔ Date and String Manipulation Functions \
✔ Window Functions (SUM() OVER, RANK()) \
✔ The SQL CASE Expression 

------------------------------------------------------------------------
