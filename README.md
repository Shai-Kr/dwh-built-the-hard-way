# dwh-built-the-hard-way
\# From Chaos to Clarity: A Unified Data Warehouse for Legacy Health Operations

by Shai Karmani



\## Overview



This repository contains a complete and production-ready SSIS-based data pipeline, designed for a health care organization that provides in-home caregiver services to tens of thousands of clients. 

The pipeline extracts, transforms, and unifies operational data from over 40 decentralized legacy systems (each using Paradox and Delphi), and delivers a clean, consistent, and analytics-friendly Data Warehouse model.



\## Architecture Diagram



See the diagram file included in this repo to visualize the full pipeline lifecycle, from legacy Paradox databases to Power BI and other downstream systems.



\## Project Stages



\### Step 1: Branch-Level Data Extraction from Paradox



\- Dynamically loops through 41 Paradox databases, one per branch

\- Executes external repair utility before each extraction to handle corrupted tables

\- Dynamically builds SQL queries due to ODBC and Paradox limitations

\- Extracted data is validated, repaired for encoding issues, and loaded into the centralized ODS layer in SQL Server



\### Step 2: Transformation and Load from ODS to Mirror Layer



\- Extracts data from ODS and applies transformations including type conversions, enrichments, and business rules

\- Loads clean data into mirror tables

\- Row counts are validated to ensure full synchronization and data completeness

\- Every step is logged and tracked for audit and debugging



\### Step 3: Building and Enriching Dimensions



\- Each dimension is handled by a dedicated package

\- Dimensions include: Branches, Committees, Customers, Employees, Paying Groups, and Salary Symbols

\- Each package applies enrichment, validation, and business logic for consistency and usability in analytics



\### Step 4: Fact Table Construction and Loading



\- Fact tables include: Charges, Customer Absences, Employee Logs and Absences, Goals, Salary Updates, Orders, Schedule, and Payroll Integration

\- Business rules are applied to each fact table

\- The data is loaded cleanly and is fully prepared for reporting tools like Power BI



\## Challenges and Solutions



\- \*\*Corrupted data\*\*: handled with legacy repair tool triggered from the command line

\- \*\*Incompatible source system\*\*: avoided SSIS native transforms, used dynamic SQL and DTEXEC execution

\- \*\*Decentralized architecture\*\*: used a control table to manage source locations dynamically

\- \*\*Schema inconsistency\*\*: aligned structure during staging with mapping rules

\- \*\*Encoding issues\*\*: added repair logic to standardize and clean legacy characters



\## Final Thoughts



This project was developed under severe technological constraints, using decentralized legacy systems and outdated file-based databases. Instead of relying on modern cloud-native solutions, I was forced to engineer every piece manually and make it resilient under pressure.



While cloud platforms like Azure, DBT, and Snowflake make data pipelines easier to build today, working under constraint built a deeper kind of expertise. This experience helped me design better systems in modern stacks and reinforced my belief that solid architecture always starts with solid thinking, not just tools.



\## Author



\*\*Shai Karmani\*\*



---



📁 Feel free to explore the packages, sample DTSX files, or contact me directly for a deeper walk-through.



