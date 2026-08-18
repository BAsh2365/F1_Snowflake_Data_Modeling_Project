# F1_Snowflake_Data_Modeling_Project

<img width="7050" height="10035" alt="F1_Snowflake_Data_Modeling_Project" src="https://github.com/user-attachments/assets/0ffe78cf-685f-41fa-9107-8659ab806359" />

<img width="1200" height="846" alt="image" src="https://github.com/user-attachments/assets/f834dda9-9d94-49b2-a284-2c5d623c4def" />


Created a Snowflake Warehouse and Database for data modeling (including dimension and fact tables) for analytics/ML use.

**Architecture: CSV load --> Snowflake Warehouse --> F1 Database --> Data Cleaning (Transformations) --> Dim JOINs --> fact tables ready for use --> Example Dashboard with Pit Stop Data using Google Data Studio + Snowflake BI connector**. 

## Case Study Scenario

You work for the Formula One Federation (Fédération Internationale de l'Automobile) Data team as an analytics engineer. You are tasked with building out data tables that house specific information and creating a sample dashboard with example metrics. Then, you will hand off your findings to the machine learning team for predictive modeling (which will be presented to the board of directors). The ML prediction model generates in-house race projections for pundits/analysts and anchors, including data for each F1 team, seasonal metrics, and course correcting pit stop data. The board of directors may also use this data to determine the next Grand Prix location.

The data must be analytics ready (like gold mart analytics if you think about medallion architecture), and you need to be available to answer any questions about the data.

The ML team says that the data needs to include:

- Weather data at the time of the race
- Pit stop data
- Team (Constructor) data
- Lap times
- As much info on the teams and drivers as possible
- Race Locations
- Anything else you can find!

You then develop a plan to find the relevant data. You also need to ask the right questions for the business/data stakeholders, such as:

  -  How should the data be formatted for the ML model? Can it handle Categorical and Numerical data?
  -  What does the logical data model look like to you? 
  -  How granular does the data need to be? (real-time? data snapshots?), does it need to be updated frequently?
  -  What specific statistical measures are you looking for (average, median, mode, etc.)?
  -  What are the top 5 factors that we will showcase when marketing these projections?
  -  In one to two sentences: can you explain your TARGET variable, your FEATURES, and what you are trying to find? 
  -  Do we need to consider seaonality? Spikes? Time Series splits (Lags, temporal T/T/S)? Anything else?


Now that you're ready to get started, you'll consult Snowflake documentation + read up on general data modeling concepts like:

  - Star Schema
  - SQL review (CTEs, JOINs, etc.)
  - Data Warehousing
  - Data governance (quality checks, account permissions)
  - Data ingestion
  - Data modeling processes (logical, conceptual, and physical)
  - Business intelligence (BI) connectors & Data reporting: Tableau, Power BI, Google Data Studio (recommended here for simplicity), etc. 
  - BONUS: Data orchestration/validation (Airflow, GCP Pub/Sub, AWS, Bruin, etc.)

## Resources

- Use of Snowflake CoCo Agent for SQL CTE indentation and semantic syntax errors

- https://www.geeksforgeeks.org/software-testing/fact-table/

- https://www.snowflake.com/en/fundamentals/data-warehouse/

- https://docs.snowflake.com/en/user-guide-getting-started

- https://docs.snowflake.com/en/user-guide/data-load-prepare

- https://www.formula1.com/en/latest/article/f1-glossary-a-e.1MFONigMlQSbSQtpP7YCy2

- https://f1experiences.com/blog/f1-glossary-a-z-most-commonly-used-terminology

- https://www.kaggle.com/datasets/mariyakostyrya/formula-1-weather-info-1950-2024

- https://www.kaggle.com/datasets/rohanrao/formula-1-world-championship-1950-2020

- https://www.kimballgroup.com/data-warehouse-business-intelligence-resources/kimball-techniques/dimensional-modeling-techniques/

## Other resources (not used here but helpful for learning)

- https://www.snowflake.com/en/fundamentals/online-analytical-processing/


## Note

The star schema have been deisgned based on domain knowledge and creative thinking. Understanding WHY these dimension tables need to be joined together, and HOW the code acheives this is more important than ever.
As I improve my SQL, and dive into more advanced concepts in Analytics/Data Engineering, I will always keep this idea in my mind (as I continue to learn and architect these systems).

The process I follow:

- Understand your fundamentals. 

- Think about how you would architect the system.

- Understand how the data is shaped and its potential interactions.

- Present the impact of your project/solution from the perspective of how it helps the end user.
