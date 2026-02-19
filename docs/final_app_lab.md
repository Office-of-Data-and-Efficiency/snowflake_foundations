← [Notebooks](snowpark_notebook.md) || [Home](https://github.com/Office-of-Data-and-Efficiency/snowflake_foundations)

# Snowflake Foundations – Final App Lab

## Synthetic Data + Snowpark + SQL 

---

## Lab Overview

In this final hands-on lab, participants will:

1. Generate synthetic customer data using Faker
2. Write data to Snowflake using Snowpark
3. Dynamically create a personalized table using their SOUID
4. Query and analyze the data using SQL
5. Perform data quality checks
6. Create a cleaned dataset
7. End with an analytics-ready result

This lab is designed to bring the training to a strong technical and conceptual crescendo — combining Python, Snowpark, and SQL into one cohesive workflow.

---

# Part 1 – Creating the notebook and setting session context and variables

### Step 1: Open a Snowpark Notebook

- Navigate to **Notebooks** in Snowsight
- Click **+ Notebook**
- Rename the notebook **FAKER_SOUID** ← Enter your SOUID here
- Select the following:

   - **Database:** `IOP_APP_LAB`
   - **Schema:** `FAKER`
   - **Runtime version:** `Snowflake Warehouse Runtime 2.0`
   - **Query Warehouse:** `AD_HOC_WH_TRAIN`
   - **Notebook Warehouse:** `AD_HOC_WH_TRAIN`

- Click **Create**
- Click **Packages** at the top
- Enter `faker` in **Find Packages** and select it
- Click **Save**

---

### Step 2: Set Snowpark Session Context

Enter the following Python code into cell 1, rename cell 1 `Session_Context`, and click ▶.

```python
from snowflake.snowpark.context import get_active_session
session = get_active_session()

# Review our context. This is a good habit!
print("User:", session.get_current_user())
print("Role:", session.get_current_role())
print("Database:", session.get_current_database())
print("Schema:", session.get_current_schema())
```

Confirming your session context is a best practice.  
In real-world environments, writing to the wrong database or schema can have serious consequences.

---

## Step 3 – Defining Variables

Enter the following Python code into cell 2, rename cell 2 `Table_Variables`, and click ▶.

```python
# Entering these variables now will save time when creating the table
# and inserting the data in the following steps.
# This also ensures that all app lab users follow the same naming convention.

SOUID = "ABC123"  # <-- Replace with your SOUID

TABLE_NAME = f"CUSTOMER_ADDRESSES_{SOUID.upper()}"

print("Table will be created as:", TABLE_NAME)
```

Each participant will now generate their own uniquely named table.

---

# Part 2 – Generate Synthetic Customer Data

### Step 4: Create Synthetic Data with Faker

#### [Faker Documentation](https://faker.readthedocs.io/en/master/index.html)

This link is an excellent resource for learning how to use Faker to create synthetic data for testing and experimentation.

Enter the following Python code into cell 3, rename cell 3 `Synthetic_Data`, and click ▶.

```python
from faker import Faker
import pandas as pd
import random

fake = Faker()
Faker.seed(42)
random.seed(42)

def maybe_null(value, null_probability=0.2):
    return value if random.random() > null_probability else None

rows = []

for i in range(1, 201):
    rows.append({
        "customer_id": i,
        "first_name": fake.first_name(),
        "last_name": fake.last_name(),
        "address_line1": maybe_null(fake.street_address(), 0.10),
        "address_line2": maybe_null(fake.secondary_address(), 0.60),
        "city": maybe_null(fake.city(), 0.10),
        "state": maybe_null(fake.state_abbr(), 0.10),
        "zip_code": maybe_null(fake.zipcode(), 0.15),
        "country": maybe_null("USA", 0.02),
        "email": maybe_null(fake.email(), 0.20),
        "phone": maybe_null(fake.phone_number(), 0.25)
    })

df = pd.DataFrame(rows)

df.head()
```

This step intentionally introduces null values to simulate real-world data quality challenges.

You now have a synthetic dataset stored in a pandas DataFrame.

---

# Part 3 – Writing Data to Snowflake

### Step 5: Write Data to a New Snowflake Table

Click **+ Python** at the end of the `Synthetic_Data` cell and insert the following Python code. Rename this cell `Write_to_Snowflake` and click ▶.

```python
# Because we set our session context in Step 2,
# we can continue to use this session to write the pandas DataFrame into Snowflake.

session.write_pandas(
    df,  # This is the synthetic data created in Step 4
    table_name=TABLE_NAME,  # This table name was defined in Step 3
    auto_create_table=True,  # Creates the table if it doesn't exist
    overwrite=True  # Overwrites the table if it already exists
)

print(f"Table {TABLE_NAME} created successfully.")  # This should match what we printed in Step 3
```

At this point, your synthetic dataset now exists inside Snowflake.

You have just moved data from Python into a cloud-native data platform using Snowpark.

---

# Part 4 – Validation

### Step 6: Switch to a SQL Cell and Preview Your Data

Click **+ SQL** at the end of the `Write_to_Snowflake` cell and insert the following SQL. Click ▶ to confirm there are 200 records.

```sql
SELECT COUNT(*)
FROM CUSTOMER_ADDRESSES_ABC123; -- Replace ABC123 with your SOUID
```

You should see a result of:

```
200
```

This confirms your data was successfully written to Snowflake.

---


# What Did We Just Accomplish?

Let’s step back and look at what this lab demonstrated.

Conceptually, you completed an end-to-end data workflow:

- Created a Snowpark notebook environment
- Verified execution context (user, role, database, schema)
- Parameterized your workflow using variables
- Generated realistic synthetic customer data
- Simulated imperfect, real-world null patterns
- Used Snowpark to push a pandas DataFrame directly into Snowflake
- Automatically created a relational table
- Queried and validated the dataset using SQL


← [Notebooks](snowpark_notebook.md) || [Home](https://github.com/Office-of-Data-and-Efficiency/snowflake_foundations)
