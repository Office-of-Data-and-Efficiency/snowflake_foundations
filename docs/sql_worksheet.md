← [Loading Data](load_data.md) || [Notebooks](snowpark_notebook.md) →

# Interacting with Your Data in a Worksheet

Now that your table has been created and loaded, we will explore the data using a SQL Worksheet in Snowsight.

---

# Step 1 – Create a Worksheet

1. Click **`Projects`** in the navigation menu.   
2. Click **`+ Add New`** and select **`SQL File`**. 
3. **`Untitled`** is highlighted.  Give the file a new name.
4. Look at the session context.  Is it still correct?  If not make the necessary updates.

---

# Step 2 – Executing SQL in Snowsight

Before running queries, review how to execute SQL in the worksheet.

## Run All Statements in a Worksheet

You can execute all SQL statements at once by:

- Clicking the **down arrow** beside the ▶️ button  
- Selecting **Run All**

Keyboard shortcuts:

- **Windows:** `CTRL + Shift + Enter`  
- **MacOS:** `Command + Shift + Return`

---

## Run a Single SQL Statement

To execute only one statement:

- Highlight the specific SQL statement and click ▶️  

  **or**
  
- Place your cursor inside the statement you want to run and click ▶️

Keyboard shortcuts:

- **Windows:** `CTRL + Enter`  
- **MacOS:** `Command + Return`

> If nothing is highlighted, Snowsight runs the statement where your cursor is located.

---

## Run Multiple Statements Together

You can execute multiple SQL statements at once by:

- Highlighting the statements you want to run  
- Clicking ▶️ 

Keyboard shortcuts:
- **Windows:** `CTRL + Enter`  
- **MacOS:** `Command + Return`

Example:

```sql
USE ROLE DAS_SFK_IOP_TRAIN_APPLAB_USERS;
USE DATABASE IOP_APP_LAB_DB;
USE SCHEMA IRIS;

SELECT 
    CURRENT_ROLE(),
    CURRENT_DATABASE(),
    CURRENT_SCHEMA();
```

Highlight all statements and run them together.

Snowflake executes each statement in order.

---

# Step 3 – Formatting SQL

You can automatically format your SQL for readability.

To format SQL:

1. Click the **ellipsis (⋯)** in the worksheet toolbar  
2. Select **Format SQL**

Keyboard shortcuts:

- **Windows:** `CTRL + ALT + O`  
- **MacOS:** `Command + Shift + O`

> Custom code style rules cannot be configured in Snowsight.

---

# Step 4 – Preview the Data

Run the following query:

```sql
SELECT * FROM IRIS_<YOUR_SOUID> LIMIT 10;
```
> Format the SQL using one of the methods above.

Observe:

- Column names  
- Numeric precision  
- Text columns  
- Row formatting in the results grid  
- SQL formatting went from one line to multiple.

---

# Step 5 – Count the Rows

Run:

```sql
SELECT COUNT(*) AS total_rows
FROM IRIS_<YOUR_SOUID>;
```

Discuss:

- How many records were loaded?  
- Does this match expectations for the Iris dataset?  

---

# Step 6 – Basic Aggregation

Calculate the average measurements by species:

```sql
SELECT
    species,
    ROUND(AVG(sepal_length), 2) AS avg_sepal_length,
    ROUND(AVG(sepal_width), 2) AS avg_sepal_width,
    ROUND(AVG(petal_length), 2) AS avg_petal_length,
    ROUND(AVG(petal_width), 2) AS avg_petal_width
FROM IRIS_<YOUR_SOUID>
GROUP BY species
ORDER BY species;
```

Observe:

- Aggregation behavior  
- `GROUP BY` usage  
- Rounded formatting  
- Result ordering  

---

# Step 7 – Simple Filtering

Run:

```sql
SELECT *
FROM IRIS_<YOUR_SOUID>
WHERE species = 'setosa'
ORDER BY petal_length DESC;
```

Discuss:

- Filtering  
- Sorting  
- Result preview in the UI  

---

# Step 8 – Create a Visualization (Optional UI Interaction)

After running the aggregation query in Step 6:

1. Click the **Chart** tab in the results pane  
2. Select a chart type (for example, a bar chart)  
3. Configure:
   - **species** as the dimension  
   - **avg_petal_length** as the metric  

This demonstrates:

- Built-in visualization capabilities  
- No external BI tool required  
- Interactive UI exploration  

← [Loading Data](load_data.md) || [Notebooks](snowpark_notebook.md) →