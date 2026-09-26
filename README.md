# E-Commerce Sales & Customer Analytics

## 🔗 Live Dashboard

**[View Interactive Dashboard on Tableau Public](https://public.tableau.com/views/E-CommerceSalesCustomerAnalyticsSQLTableau/ExecutiveSalesOverview?:language=en-US&:display_count=n&:origin=viz_share_link)**

---

## 📊 Project Overview

This project is an end-to-end **Data Analytics portfolio project** built to analyze e-commerce sales performance, profitability, customer behavior, product performance, regional performance, acquisition channels, and the relationship between discounting and profit margins.

The project demonstrates the complete workflow of a Data Analyst:

**Data → SQL Database → Data Validation → Business Analysis → Tableau Dashboard → Business Insights**

The analysis uses a generated e-commerce dataset containing **12,000 order records**, **3,500 customers**, and **180 products** covering the period from **2024 to 2025**.

The project was designed to demonstrate practical skills required for Data Analyst roles, including:

- SQL data analysis
- Relational database design
- Data validation and quality checks
- Aggregation and KPI calculation
- Joins
- Common Table Expressions (CTEs)
- Window functions
- Time-series analysis
- Customer segmentation
- Product analysis
- Profitability analysis
- Data visualization
- Tableau dashboard development
- Business-oriented storytelling

---

# Business Problem

An e-commerce company wants to understand how its business is performing and where its revenue and profit are coming from.

Management needs answers to questions such as:

1. How much revenue and profit does the business generate?
2. How is revenue changing over time?
3. Which product categories generate the most revenue?
4. Which products are the biggest revenue contributors?
5. Which states generate the most sales?
6. Which customer segments contribute the most revenue?
7. Which acquisition channels generate the most business?
8. How does discounting affect profitability?
9. What is the difference between first-time and returning customer activity?
10. Which areas may require further investigation from a profitability perspective?

The purpose of the project is not simply to display charts, but to transform raw transaction data into information that can support business analysis and decision-making.

---

# Tools & Technologies

### MySQL
Used for:

- Database creation
- Relational table design
- Data loading
- Data quality checks
- Data transformation
- KPI calculations
- Customer analysis
- Product analysis
- Time-series analysis
- CTEs
- Window functions
- Business analysis queries

### Tableau Public
Used for:

- Interactive dashboards
- KPI cards
- Time-series visualizations
- Category analysis
- Geographic analysis
- Product ranking
- Customer segmentation
- Acquisition-channel analysis
- Profitability analysis
- Interactive filters
- Dashboard navigation

### Excel
Used for:

- Dataset inspection
- Data review
- Supporting analysis
- Tableau-ready data review

---

# Dataset

The project uses three core datasets.

## 1. Customers

Contains customer-level information.

Main fields:

- `customer_id`
- `customer_name`
- `segment`
- `state`
- `city`
- `acquisition_channel`

## 2. Products

Contains product information.

Main fields:

- `product_id`
- `product_name`
- `category`
- `subcategory`
- `base_price`
- `unit_cost`

## 3. Order Items

Contains transaction-level information.

Main fields:

- `order_id`
- `order_date`
- `customer_id`
- `product_id`
- `quantity`
- `unit_price`
- `discount`
- `sales`
- `profit`
- `shipping_mode`
- `payment_method`

---

# Dataset Summary

| Metric | Value |
|---|---:|
| Customers | 3,500 |
| Products | 180 |
| Orders | 12,000 |
| Customers with Orders | 3,394 |
| Revenue | $656,307.92 |
| Profit | $185,174.16 |
| Average Order Value | $54.69 |
| Profit Margin | 28.2% |

These figures represent the complete generated dataset before applying any dashboard filters.

---

# Database Structure

The project uses a relational database consisting of three tables:

```text
customers
    │
    │ customer_id
    ↓
order_items
    │
    │ product_id
    ↓
products
```

---

# Repository Structure

```text
E_Commerce-Data_Analysis/
│
├── Data/
│   ├── customers.csv
│   ├── order_items.csv
│   └── products.csv
│
├── SQL/
│   ├── 01_database_setup.sql
│   ├── 02_data_validation.sql
│   ├── 03_kpi_queries.sql
│   ├── 04_time_series_analysis.sql
│   ├── 05_product_analysis.sql
│   ├── 06_customer_segmentation.sql
│   ├── 07_geographic_analysis.sql
│   ├── 08_discount_profitability.sql
│   └── 09_advanced_queries_ctes_window_functions.sql
│
├── Tableau/
│   └── E-Commerce_Sales_Customer_Analytics.twbx
│
└── README.md
```

> Note: SQL file names above are placeholders reflecting the analysis stages — update them to match your actual file names.

---

# How to Use This Project

1. **Explore the raw data** in the `Data/` folder to understand the structure of customers, products, and order items.
2. **Run the SQL scripts** in the `SQL/` folder in order — starting with database/table setup, followed by data validation, then the analysis queries (KPIs, time-series, product, customer, geographic, and discount/profitability analysis).
3. **Open the Tableau workbook** in the `Tableau/` folder, or view the published version directly via the [live dashboard link](#-live-dashboard) above.
4. **Review the business insights** below to see how the analysis translates into decision-relevant findings.

---

# Key Business Insights

- Revenue and profit trends across the 2024–2025 period highlight seasonal and month-over-month performance shifts.
- A small set of product categories and top-performing products drive a disproportionate share of total revenue.
- Certain states and regions consistently outperform others in sales volume, pointing to geographic concentration.
- Specific customer segments and acquisition channels contribute more strongly to revenue than others, suggesting where marketing and retention efforts may be best focused.
- Higher discount levels show a measurable impact on profit margins, revealing categories or products where discounting may be eroding profitability.
- Differences between first-time and returning customer behavior point to opportunities in customer retention strategy.

> Replace the bullet points above with the specific, quantified findings from your own analysis (e.g., "Category X accounts for 32% of total revenue" or "State Y drives 18% of profit").

---

# Author

**Anurag P. Choudhury**

Feel free to connect or reach out with questions, feedback, or collaboration ideas.
