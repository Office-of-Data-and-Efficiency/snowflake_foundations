← [Back to Create Table with Data Upload →](create-table-with-data-upload.md)

# Interacting with Your Data in a Worksheet

Now that your table has been created and loaded, we will explore the data using a SQL Worksheet in Snowsight.

---

## Step 1 – Open a Worksheet

1. Click **Projects** in the navigation menu.  
2. Select **Worksheets**.  
3. Click **+** to create a new worksheet.  
4. Confirm your context is still set correctly.

You should be using your table:

`IRIS_<YOUR_SOUID>`

Replace `<YOUR_SOUID>` with your actual SOUID.

---

## Step 2 – Preview the Data

Run the following query:

```sql
SELECT *
FROM IRIS_<YOUR_SOUID>
LIMIT 10;
```

Observe:

- Column names  
- Numeric precision  
- Text columns  
- Row formatting in the results grid  

---

## Step 3 – Count the Rows

Run:

```sql
SELECT COUNT(*) AS total_rows
FROM IRIS_<YOUR_SOUID>;
```

Discuss:

- How many records were loaded?  
- Does this match expectations for the Iris dataset?  

---

## Step 4 – Basic Aggregation

Let’s calculate the average measurements by species:

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

## Step 5 – Simple Filtering

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

## Step 6 – Create a Visualization (Optional UI Interaction)

After running the aggregation query in Step 4:

1. Click the **Chart** tab in the results pane.  
2. Select a chart type (for example, a bar chart).  
3. Configure:
   - **species** as the dimension  
   - **avg_petal_length** as the metric  

This demonstrates:

- Built-in visualization capabilities  
- No external BI tool required  
- Interactive UI exploration  
