# E-Commerce Sales & Customer Analytics

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
