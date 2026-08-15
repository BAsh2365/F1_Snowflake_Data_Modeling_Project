# F1_Snowflake_Data_Modeling_Project

<img width="7050" height="10005" alt="Snowflake_Data_Modeling_Project" src="https://github.com/user-attachments/assets/0db3415d-1205-47e9-9a63-6457e2f8c632" />

Created a Snowflake Warehouse and Database for data modeling (including dimension and fact tables) for analytics/ML use.

**Architecture: CSV load --> Snowflake Warehouse --> F1 Database --> Data Cleaning (Transformations) --> Dim JOINs --> fact tables ready for use**. 

## Case Study Scenario

You work for the Formula One Federation (Fédération Internationale de l'Automobile) Data team as an analytics engineer, and you are tasked with building out data tables before handing them off to the machine learning/analytics team for predictive modeling. The ML prediction model creates in-house race projections for pundits/analysts/anchors, which will contain data for each F1 team. The board of directors may also use this data to determine the next Grand Prix location.

The ML team says that the data needs to include:

- Weather data at the time of the race
- Pit stop data
- Team (Constructor) data
- Lap times
- As much info on the teams and drivers as possible
- Race Locations
- Anything else you can find!

You then come up with a plan to:

- Find relevant data

- Ask the right questions for the business/data stakeholders, such as:
  -- How should the data be formatted for the ML model?
  
  -- Can it handle Categorical and Numerical data?
  
  -- What other metrics would you consider?
  
  -- What statistical measures are you looking for (average, median, mode, etc.)?
  
  -- What are the top 5 factors that we will showcase when marketing these projections?
  

 Now that you're ready, you consult Snowflake documentation + read up on general data modeling concepts like:
    -- Star Schema
    
    -- SQL review (CTEs, JOINs, etc.)
    
    -- Data Warehousing
    
    -- Data governance (quality checks)
    
    -- Data ingestion
    
    -- BONUS: Data orchestration (Airflow, GCP Pub/Sub, AWS, etc.)

## Resources

- Use of Snowflake CoCo Agent for data indentation and semantic syntax errors

- https://www.geeksforgeeks.org/software-testing/fact-table/

- https://www.snowflake.com/en/fundamentals/data-warehouse/

- https://docs.snowflake.com/en/user-guide-getting-started

- https://docs.snowflake.com/en/user-guide/data-load-prepare

- https://www.kaggle.com/datasets/mariyakostyrya/formula-1-weather-info-1950-2024

- https://www.kaggle.com/datasets/rohanrao/formula-1-world-championship-1950-2020


## Other resources (not used here but helpful for learning)

- https://www.snowflake.com/en/fundamentals/online-analytical-processing/

