# Section 1: Schema Overview (4 marks)

## FACT TABLE: fact_sales

The central fact table in the star schema is fact_sales, which captures sales transactions data at the most granular level.

Business Process: Sales transactions

Grain: One row per product per order line item\
It means:

- If one order has 4 products, there will 4 rows in fact_sales for that order.
- It matches the order_items table from OLTP.

Measures (Numeric Facts):

- sale_key (PK): Surrogate key
- quantity_sold: Number of units sold for a product in an order
- unit_price: Price per unit at the time of sale
- total_amount: Final amount (quantity_sold × unit_price)

These measures are additive and can be aggregated across multiple dimensions such as time, products, and customers.

Foreign Keys:
The fact_sales table links to dimensions using surrogate keys:

- date_key → dim_date
- product_key → dim_product
- customer_key → dim_customer

## DIMENSION TABLE: dim_date

Purpose: Date dimension for time-based analysis such as:

- daily sales
- monthly trends
- quarterly performance

Type: Conformed dimension (can be reused across fact tables)

Attributes:

- date_key (PK): Surrogate key (integer, format: YYYYMMDD)
- full_date: Actual date
- day_of_week: Monday, Tuesday, etc.
- day_of_month: 1 to end date of month
- month: 1-12
- month_name: January, February, etc.
- quarter: Q1, Q2, Q3, Q4
- year: 2023, 2024, etc.
- is_weekend: Boolean

This dimension allows efficient time-based aggregations and trend analysis.

## DIMENSION TABLE: dim_product

Purpose: Product dimension that stores descriptive attributes about products for product-level analysis

Attributes:

- product_key (PK): surrogate key
- product_id: business identifier from the source system
- product_name
- category

This dimension enables:

- category-wise sales
- product performance analysis

## DIMENSION TABLE: dim_customer

Purpose: Customer dimension that stores descriptive attributes about customers for customer-centric analysis and segmentation

Attributes:

- customer_key (PK): surrogate key
- customer_id: business identifier from the source system
- first_name
- last_name
- email
- phone
- city
- registration_date

This dimension enables:

- customer behavior analysis
- geographic analysis
- customer segmentation

# Section 2: Design Decisions (3 marks - 150 words)

Explain:

1. Why you chose this granularity (transaction line-item level)
2. Why surrogate keys instead of natural keys
3. How this design supports drill-down and roll-up operations

Answer:

The fact table is designed at the granularity of one row per product per order line item. This grain was chosen because it represents the lowest meaningful level of detail for sales analysis and directly aligns with transactional order item data from the source system. It enables flexible aggregation across multiple dimensions, such as daily, monthly, and yearly sales, as well as product-level and customer-level analysis.

Surrogate keys are used instead of natural keys for all dimension tables to ensure stability and performance. Natural keys such as product ids, emails, or phone numbers can change over time, whereas surrogate keys remain immutable. Using surrogate keys also improves join efficiency and prepares the data warehouse for future enhancements such as slowly changing dimensions.

Analysts can roll up sales from individual transactions to higher levels such as product categories or months, and drill down from summarized reports to detailed transaction-level data efficiently.

# Section 3: Sample Data Flow (3 marks)

This section shows how a single sales transaction flows from the source operational system into the data warehouse using the star schema.

## Source Transaction (OLTP System)

Suppose a sales transaction from the source system contains the following information:

- Order ID: 101
- Order Date: 2024-01-15
- Customer: John Doe
- Product: Laptop
- Quantity: 2
- Unit Price: 50,000

At the transactional level, this data exists across multiple normalized tables such as orders, customers, products, and order_items.

## Data Warehouse Representation

After ETL processing, the transaction is transformed and loaded into the data warehouse as follows:

fact_sales

```json
{
  "sale_key": 1,
  "date_key": 20240115,
  "product_key": 5,
  "customer_key": 12,
  "quantity_sold": 2,
  "unit_price": 50000,
  "total_amount": 100000
}
```

dim_date

```json
{
  "date_key": 20240115,
  "full_date": "2024-01-15",
  "month": 1,
  "month_name": "January",
  "quarter": "Q1",
  "year": 2024
}
```

dim_product

```json
{
  "product_key": 5,
  "product_id": "P005",
  "product_name": "Laptop",
  "category": "Electronics"
}
```

dim_customer

```json
{
  "customer_key": 12,
  "customer_id": "C012",
  "first_name": "John",
  "last_name": "Doe",
  "city": "Mumbai"
}
```

This structure allows analytical queries to efficiently aggregate sales measures while joining descriptive attributes from dimension tables, enabling both high-level reporting and detailed transaction analysis.
