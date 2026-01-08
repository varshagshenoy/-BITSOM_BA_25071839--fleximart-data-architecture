# 1. Entity-Relationship Description (Text Format)

## ENTITY: customers

Purpose: Stores customer information
Attributes:

- customer_id: Unique identifier for each customer (Primary Key)
- first_name: Customer's first name
- last_name: Customer's last name
- email: Customer's email address (unique)
- phone: Customer's contact number
- city: Customer's residing city
- registration_date: Date when the customer registered

Relationships:

- One customer can place MANY orders (1:M with orders table)

## ENTITY: products

Purpose: Stores product information
Attributes:

- product_id: Unique identifier for each product (Primary Key)
- product_name: Name of the product
- category: Product category (e.g., Electronics, Fashion)
- price: Price of the product
- stock_quantity: Available stock quantity

Relationships:

- One product can appear in MANY order items (1:M relationship with order_items table)

## ENTITY: orders

Purpose: Stores high-level information about customer orders
Attributes:

- order_id: Unique identifier for each order (Primary Key)
- customer_id: Identifier of the customer who placed the order (Foreign Key)
- order_date: Date when the order was placed
- total_amount: Total value of the order
- status: Current status of the order (Pending, Completed, Cancelled)

Relationships:

- Each order belongs to one customer (M:1 relationship with customers)
- One order can contain many order items (1:M relationship with order_items)

## ENTITY: order_items

Purpose: Stores line-item details of each order, representing products purchased in an order.
Attributes:

- order_item_id: Unique identifier for each order item (Primary Key)
- order_id: Identifier of the associated order (Foreign Key)
- product_id: Identifier of the purchased product (Foreign Key)
- quantity: Number of units purchased
- unit_price: Price per unit at time of purchase
- subtotal: Total price for the line item (quantity × unit_price)

Relationships:

- Many order items belong to one order (M:1 relationship with orders)
- Each order item refers to one product (M:1 relationship with products)

# 2. Normalization Explanation

## Why the design is in Third Normal Form (3NF)

The FlexiMart database schema is designed in Third Normal Form (3NF) to minimize redundancy and ensure data integrity.
The schema satisfies First Normal Form (1NF) because all tables store atomic values, and there are no repeating groups or multi-valued attributes. Each column contains a single, indivisible value, and each record can be uniquely identified by a primary key.

The design also satisfies Second Normal Form (2NF) because all non-key attributes are fully functionally dependent on the entire primary key. Since each table uses a single-column primary key (such as customer_id, product_id, or order_id), there are no partial dependencies. Every non-key attribute describes the entity identified by the primary key and not a subset of it.

The schema achieves Third Normal Form (3NF) by eliminating transitive dependencies. Non-key attributes do not depend on other non-key attributes. For example, in the customers table, attributes such as first_name, last_name, email, and city depend only on customer_id. Similarly, product details depend solely on product_id, and order details depend only on order_id.
By isolating customers, products, orders, and order items into separate tables and linking them through foreign keys, the design ensures data consistency and avoids redundancy, thereby the design is in Third Normal Form (3NF).

## Functional Dependencies

- customers:\
  customer_id → first_name, last_name, email, phone, city, registration_date

- products:\
  product_id → product_name, category, price, stock_quantity

- orders:\
  order_id → customer_id, order_date, total_amount, status

- order_items:\
  order_item_id → order_id, product_id, quantity, unit_price, subtotal

## How the design avoids update, insert, and delete anomalies

- Update anomalies:
  Customer or product information is stored only once, so updates are consistent across the system.

- Insert anomalies:
  New customers or products can be added independently without requiring an order.

- Delete anomalies:
  Deleting an order does not remove customer or product data, preserving historical and master data integrity.

# 3. Sample Data Representation

## customers

| customer_id | first_name | last_name | email                  | phone          | city      | registration_date |
| ----------- | ---------- | --------- | ---------------------- | -------------- | --------- | ----------------- |
| 1           | Rahul      | Sharma    | rahul.sharma@gmail.com | +91-9876543210 | Bangalore | 2023-01-15        |
| 2           | Priya      | Patel     | priya.patel@yahoo.com  | +91-9988776655 | Mumbai    | 2023-02-20        |
| 3           | Sneha      | Reddy     | sneha.reddy@gmail.com  | +919123456789  | Hyderabad | 2023-04-15        |

## products

| product_id | product_name       | category    | price    | stock_quantity |
| ---------- | ------------------ | ----------- | -------- | -------------- |
| 1          | Samsung Galaxy S21 | Electronics | 45999.00 | 150            |
| 2          | Nike Running Shoes | Fashion     | 3499.00  | 80             |
| 3          | Levi's Jeans       | Fashion     | 2999.00  | 120            |

## orders

| order_id | customer_id | order_date | total_amount | status    |
| -------- | ----------- | ---------- | ------------ | --------- |
| 1        | 1           | 2024-01-15 | 45999.00     | Completed |
| 2        | 2           | 2024-01-16 | 5998.00      | Completed |
| 3        | 4           | 2024-01-20 | 1950.00      | Completed |

## order_items

| order_item_id | order_id | product_id | quantity | unit_price | subtotal |
| ------------- | -------- | ---------- | -------- | ---------- | -------- |
| 1             | 1        | 1          | 1        | 45999.00   | 45999.00 |
| 2             | 2        | 3          | 2        | 2999.00    | 5998.00  |
| 3             | 3        | 8          | 3        | 650.00     | 1950.00  |
