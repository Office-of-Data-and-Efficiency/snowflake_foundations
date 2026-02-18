← [Lab Overview](README.md)

# Snowpark Notebooks in Snowsight

Snowflake Notebooks is a unified development interface in Snowsight that provides an interactive, cell-based programming environment for:

- Python  
- SQL  
- Markdown  

Within Notebooks, you can leverage Snowflake data to:

- Perform exploratory data analysis  
- Develop machine learning models  
- Execute data engineering workflows  
- Document your work alongside code  

All within the same interface.


# What This Will Demonstrate

- Switching between SQL and Python cells  
- Executing SQL natively inside a Notebook  
- Executing SQL from within Python using Snowpark  
- Unified development experience inside Snowsight  

---

# Step 1 – Navigate to Notebooks

1. Hover over **Projects** in the navigation menu.  
2. Click **Notebooks**.

The Notebooks home screen will display any notebooks you have access to.

---

# Step 2 – Create a New Notebook

1. Click **+ Notebook**.  
2. Set the Notebook name to match your dataset using:

   `IRIS_<YOUR_SOUID>_NOTEBOOK`

3. Select the following:

   - **Database:** `IOP_APP_LAB`
   - **Schema:** `IRIS`
   - **Query Warehouse:** `AD_HOC_WH_TRAIN`
   - **Notebook Warehouse:** `AD_HOC_WH_TRAIN`

4. Click **Create**.

The notebook will be auto-generated with example content.

---

# Step 3 – Start the Notebook Session

1. Click **Start** to begin the notebook session.
2. Wait for the session to initialize.

> The session must be running before executing any cells.

---

# Step 4 – Update Cell 1 (Python)

Modify **Cell 1** to the following:

```python
print("User:", session.get_current_user())
print("Role:", session.get_current_role())
print("Database:", session.get_current_database())
print("Schema:", session.get_current_schema())
```

Click the **Play** button to execute the cell.

You should see output confirming your active role, database, and schema.

---

# Step 5 – Convert Cell 2 to SQL

1. Change **Cell 2** type to **SQL**.
2. Rename the cell to:

   `sql_example`

3. Replace the contents with:

```sql
SELECT *
FROM IRIS_10005270
WHERE SEPAL_LENGTH > 6
AND PETAL_WIDTH BETWEEN 1.5 AND 2.5
ORDER BY SEPAL_LENGTH DESC
LIMIT 5;
```

Run the cell and observe the filtered results.

---

# Step 6 – Convert Cell 3 to Python

1. Change **Cell 3** type to **Python**.
2. Rename the cell to:

   `python_example`

3. Replace the contents with:

```python
df = session.sql("""
    SELECT *
    FROM IRIS_10005270
    WHERE PETAL_LENGTH > 1.4
    ORDER BY PETAL_LENGTH DESC
    LIMIT 5
""")

df.show()
```

Run the cell.

Observe:

- SQL executed inside Python  
- Snowpark returning results as a DataFrame  
- Output displayed directly in the notebook  

---


