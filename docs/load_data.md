← [Workspaces](workspaces.md)  || [SQL Worksheet](sql_worksheet.md) →

# Create Table with Data Upload

Snowflake allows you to create a table and load data at the same time using the **`Load Data wizard`** in Snowsight.

When uploading a CSV file:

- Snowflake automatically infers column names and data types.
- A **`CREATE TABLE`** statement is generated.
- A **`COPY INTO`** command loads the data.
- No manual SQL is required.

This allows you to create and populate a table in a single guided workflow.

---

## Step 1 – Download the dataset

1. Download the [iris.csv](data/iris.csv) file.

---
## Step 2 - Load Data

Navigate to Load Data

1. From the left navigation menu, click **`+`**.
2. Click **`Add Data`**.
3. Choose **`Load Data into a Table`**.
4. If a window opens asking to choose a Warehouse choose **`AD_HOC_WH_TRAIN`** and repeat steps 1-3.

---

## Step 3 – Upload the File

1. Click **`Browse`**.
2. Navigate to your saved `iris.csv` file.
3. Select the file and upload.

The file should now appear in the upload window.

---

## Step 4 – Select Database and Schema

1. Click **`No database selected`**.
2. Choose:
   - **`Database:`** `IOP_APP_LAB_DB`
   - **`Schema:`** `IRIS`

---

## Step 5 – Name the Table

- Leave **`Select or create a table`** set to **`Create new table`**.
    - Set the table name to: **`IRIS_<YOUR_SOUID>`**
    - Example **`IRIS_12345678`**
    - Replace **`<YOUR_SOUID>`** with your actual SOUID. Do not include the angle brackets.
- Click **`Next`**

## Step 6 - Edit the Schema

- Here is where the schema format can reviewed and updated as needed by changing data types and column names.  Click **`Load`** after reviewing.
- **`Tip`** -  You can click on **`Show SQL`** to look under the hood on how Snowflake will create the Table and insert the data with the **`COPY INTO`** statement
- Click **`Load`**
- A **`Successfully Loaded Data`** message should display.  Click **`View table details`**.
- This page has many ways to interact with your new table.  Take a few moments to explore

← [Workspaces](workspaces.md)  || [SQL Worksheet](sql_worksheet.md) →


