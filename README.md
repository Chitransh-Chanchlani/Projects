#  AdventureWorks Power BI Dashboard

##  Project Overview
This project is an end-to-end **business intelligence solution built using Microsoft Power BI** on the AdventureWorks dataset.  
The dashboard provides actionable insights into **sales performance, profitability, customer behavior, product trends, and returns**, enabling stakeholders to make data-driven decisions.

The project demonstrates strong fundamentals in **data modeling, DAX, time intelligence, and interactive dashboard design**.

---

## Business Objectives
- Track overall **Revenue, Profit, Orders, and Return Rate**
- Analyze **monthly trends and performance vs targets**
- Identify **top products, customers, and regions**
- Understand **customer demographics and purchasing behavior**
- Evaluate **product-level profitability and returns**
- Enable **dynamic analysis using slicers and parameters**

---

## Tools & Technologies
- **Microsoft Power BI**
- **Power Query** – data cleaning & transformation
- **DAX** – calculated measures & time intelligence
- **AdventureWorks Dataset**

---

## Data Model Overview
The project follows a **star schema** design for optimal performance and clarity.

### Fact Tables
- `Sales Data`
- `Returns Data`

### Dimension Tables
- `Calendar Lookup`
- `Customer Lookup`
- `Product Lookup`
- `Product Subcategories`
- `Product Categories`
- `Territory Lookup`

### Supporting Tables
- Measure Table
- Metric Selection Tables
- Price Adjustment Parameter Table

 **Data Model Snapshot**  
![Data Model](Images\Data_Model_Snapshot.png)

---

## Dashboard Pages & Features

### 1️. Executive Dashboard
High-level KPIs and business performance overview.

**Key Metrics**
- Total Revenue: **$24.9M**
- Total Profit: **$10.5M**
- Total Orders: **25.2K**
- Return Rate: **2.2%**

**Highlights**
- Revenue trend with forecasting
- Orders by product category
- Top 10 products by revenue & return %
- Monthly performance comparison


![Executive Dashboard](Images\Executive_Dashboard.png)

---

### 2️. Customer Detail Dashboard
Focused analysis on customer behavior and value.

**Key Insights**
- 17K unique customers
- Revenue per customer analysis
- Orders by income level and occupation
- Top customers by revenue
- Dynamic customer selection logic

  
![Customer Dashboard](Images\Customer_Detail.png)

---

### 3️. Product Detail Dashboard
In-depth product performance and profitability analysis.

**Key Features**
- Monthly Orders, Revenue & Profit vs Targets
- Price adjustment what-if parameter
- Adjusted vs actual profit comparison
- Return % trend analysis
- Dynamic metric selection

  
![Product Dashboard](Images\Product_Detail.png)

---

### 4️. Geographic Analysis (Map)
Visualizes sales performance across regions.

**Regions Covered**
- North America
- Europe
- Pacific

📸  
![Map Dashboard](Images\Map_Dashboard.png)

---

## Key DAX Measures Used

### 🔹 Time Intelligence
```DAX
Previous Month Returns =
CALCULATE(
    [Total Returns],
    DATEADD(
        'Calendar Lookup'[Date],
        -1,
        MONTH
    )
)

10-day rolling revenue =
CALCULATE(
    [Total Revenue],
    DATESINPERIOD(
        'Calendar Lookup'[Date],
        MAX('Calendar Lookup'[Date]),
        -10,
        DAY
    )
)
```
### 🔹 Business Logic
```High ticket Orders =
CALCULATE(
    [Total Orders],
    FILTER(
        'Product Lookup',
        'Product Lookup'[ProductPrice] > [Overall Average Price]
    )
)


Weekend Orders =
CALCULATE(
    [Total Orders],
    'Calendar Lookup'[Weekend] = "Weekend"
)
```

### 🔹 Dynamic Display Logic

```Full Name (Customer Detail) =
IF(
    HASONEVALUE('Customer Lookup'[CustomerKey]),
    MAX('Customer Lookup'[Full name]),
    "Multiple Customers"
)


Total Revenue (Customer Detail) =
IF(
    HASONEVALUE('Customer Lookup'[Full name]),
    [Total Revenue],
    "-"
)
```

### 🔹 What-If Analysis

```Adjusted Revenue =
SUMX(
    'Sales Data',
    'Sales Data'[OrderQuantity] * [Adjusted Price]
)
````

## Key Insights Generated

- Accessories generate the highest order volume.
- Bikes contribute significantly to overall revenue.
- Return rates remain consistently below 3%.
- High-ticket products drive fewer orders but higher revenue.
- Revenue shows consistent upward growth post-2021.
- Price adjustments directly impact profit trends.

## How to Use This Project

- Download the .pbix / .pbip file
- Open using Power BI Desktop
- Refresh data if required
- Interact with slicers, filters, and parameters
- Explore insights across different dashboard

## Author

Chitransh Chanchlani

Email: chanchlanichitransh@gmail.com

## Feedback

If you found this project useful, feel free to ⭐ the repository and share your feedback!