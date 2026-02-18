-- ============================================
-- Snowflake App Lab
-- Worksheet Exploration Queries
-- ============================================

-- IMPORTANT:
-- Replace <YOUR_SOUID> with your actual SOUID
-- Example: IRIS_12345678

-- Setting the context to your database and schema
USE ROLE DAS_SFK_IOP_TRAIN_APPLAB_USERS;
USE DATABASE IOP_APP_LAB_DB;
USE SCHEMA IRIS;
USE WAREHOUSE AD_HOC_WH_TRAIN;

--Confirm context has been correctly set
SELECT
    CURRENT_USER(),
    CURRENT_ROLE(),
    CURRENT_DATABASE(),
    CURRENT_SCHEMA(),
    CURRENT_WAREHOUSE();

-- Preview Data
SELECT *
FROM IRIS_<YOUR_SOUID>
LIMIT 10;

-- Count Rows
SELECT COUNT(*) AS total_rows
FROM IRIS_<YOUR_SOUID>;

-- Aggregation by Species
SELECT
    species,
    ROUND(AVG(sepal_length), 2) AS avg_sepal_length,
    ROUND(AVG(sepal_width), 2) AS avg_sepal_width,
    ROUND(AVG(petal_length), 2) AS avg_petal_length,
    ROUND(AVG(petal_width), 2) AS avg_petal_width
FROM IRIS_<YOUR_SOUID>
GROUP BY species
ORDER BY species;

-- Filter Example
SELECT *
FROM IRIS_<YOUR_SOUID>
WHERE species = 'setosa'
ORDER BY petal_length DESC;
