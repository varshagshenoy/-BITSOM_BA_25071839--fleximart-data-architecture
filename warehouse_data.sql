-- warehouse_data.sql

use fleximart_dw;

-- populate dim_date (30 rows)

INSERT INTO dim_date
(date_key, full_date, day_of_week, day_of_month, month, month_name, quarter, year, is_weekend)
VALUES
(20240101, '2024-01-01', 'Monday', 1, 1, 'January', 'Q1', 2024, FALSE),
(20240102, '2024-01-02', 'Tuesday', 2, 1, 'January', 'Q1', 2024, FALSE),
(20240103, '2024-01-03', 'Wednesday', 3, 1, 'January', 'Q1', 2024, FALSE),
(20240104, '2024-01-04', 'Thursday', 4, 1, 'January', 'Q1', 2024, FALSE),
(20240105, '2024-01-05', 'Friday', 5, 1, 'January', 'Q1', 2024, FALSE),
(20240106, '2024-01-06', 'Saturday', 6, 1, 'January', 'Q1', 2024, TRUE),
(20240107, '2024-01-07', 'Sunday', 7, 1, 'January', 'Q1', 2024, TRUE),

(20240108, '2024-01-08', 'Monday', 8, 1, 'January', 'Q1', 2024, FALSE),
(20240109, '2024-01-09', 'Tuesday', 9, 1, 'January', 'Q1', 2024, FALSE),
(20240110, '2024-01-10', 'Wednesday', 10, 1, 'January', 'Q1', 2024, FALSE),
(20240113, '2024-01-13', 'Saturday', 13, 1, 'January', 'Q1', 2024, TRUE),
(20240114, '2024-01-14', 'Sunday', 14, 1, 'January', 'Q1', 2024, TRUE),

(20240120, '2024-01-20', 'Saturday', 20, 1, 'January', 'Q1', 2024, TRUE),
(20240121, '2024-01-21', 'Sunday', 21, 1, 'January', 'Q1', 2024, TRUE),
(20240125, '2024-01-25', 'Thursday', 25, 1, 'January', 'Q1', 2024, FALSE),
(20240128, '2024-01-28', 'Sunday', 28, 1, 'January', 'Q1', 2024, TRUE),

(20240201, '2024-02-01', 'Thursday', 1, 2, 'February', 'Q1', 2024, FALSE),
(20240202, '2024-02-02', 'Friday', 2, 2, 'February', 'Q1', 2024, FALSE),
(20240203, '2024-02-03', 'Saturday', 3, 2, 'February', 'Q1', 2024, TRUE),
(20240204, '2024-02-04', 'Sunday', 4, 2, 'February', 'Q1', 2024, TRUE),

(20240210, '2024-02-10', 'Saturday', 10, 2, 'February', 'Q1', 2024, TRUE),
(20240211, '2024-02-11', 'Sunday', 11, 2, 'February', 'Q1', 2024, TRUE),
(20240214, '2024-02-14', 'Wednesday', 14, 2, 'February', 'Q1', 2024, FALSE),
(20240215, '2024-02-15', 'Thursday', 15, 2, 'February', 'Q1', 2024, FALSE),

(20240217, '2024-02-17', 'Saturday', 17, 2, 'February', 'Q1', 2024, TRUE),
(20240218, '2024-02-18', 'Sunday', 18, 2, 'February', 'Q1', 2024, TRUE),
(20240222, '2024-02-22', 'Thursday', 22, 2, 'February', 'Q1', 2024, FALSE),
(20240224, '2024-02-24', 'Saturday', 24, 2, 'February', 'Q1', 2024, TRUE),
(20240229, '2024-02-29', 'Thursday', 29, 2, 'February', 'Q1', 2024, FALSE),
(20240131, '2024-01-31', 'Wednesday', 31, 1, 'January', 'Q1', 2024, FALSE);


-- populate dim_product (15 rows)

INSERT INTO dim_product
(product_id, product_name, category, subcategory, unit_price)
VALUES
-- Electronics (5)
('P001', 'Laptop Pro 14', 'Electronics', 'Laptops', 85000),
('P002', 'Smartphone X', 'Electronics', 'Smartphones', 55000),
('P003', 'Wireless Headphones', 'Electronics', 'Audio', 12000),
('P004', '4K LED TV', 'Electronics', 'Televisions', 72000),
('P005', 'Bluetooth Speaker', 'Electronics', 'Audio', 4500),

-- Fashion (5)
('P006', 'Men Casual Shirt', 'Fashion', 'Clothing', 1800),
('P007', 'Women Denim Jeans', 'Fashion', 'Clothing', 3200),
('P008', 'Running Shoes', 'Fashion', 'Footwear', 6500),
('P009', 'Leather Wallet', 'Fashion', 'Accessories', 1200),
('P010', 'Winter Jacket', 'Fashion', 'Outerwear', 7800),

-- Home (5)
('P011', 'Mixer Grinder', 'Home', 'Kitchen Appliances', 4800),
('P012', 'Vacuum Cleaner', 'Home', 'Cleaning Appliances', 9200),
('P013', 'LED Table Lamp', 'Home', 'Lighting', 1500),
('P014', 'Wooden Dining Chair', 'Home', 'Furniture', 13500),
('P015', 'Queen Size Mattress', 'Home', 'Furniture', 28000);


-- populate dim_customer (12 rows)

INSERT INTO dim_customer
(customer_id, customer_name, city, state, customer_segment)
VALUES
('C001', 'Amit Sharma', 'Delhi', 'Delhi', 'Retail'),
('C002', 'Neha Verma', 'Mumbai', 'Maharashtra', 'Premium'),
('C003', 'Rahul Mehta', 'Bengaluru', 'Karnataka', 'Corporate'),
('C004', 'Pooja Singh', 'Jaipur', 'Rajasthan', 'Online'),

('C005', 'Suresh Iyer', 'Mumbai', 'Maharashtra', 'Retail'),
('C006', 'Ananya Rao', 'Bengaluru', 'Karnataka', 'Premium'),
('C007', 'Vikram Khanna', 'Delhi', 'Delhi', 'Corporate'),
('C008', 'Kavita Joshi', 'Jaipur', 'Rajasthan', 'Retail'),

('C009', 'Rohit Malhotra', 'Delhi', 'Delhi', 'Premium'),
('C010', 'Sneha Kulkarni', 'Mumbai', 'Maharashtra', 'Online'),
('C011', 'Arjun Patel', 'Bengaluru', 'Karnataka', 'Retail'),
('C012', 'Meenal Gupta', 'Jaipur', 'Rajasthan', 'Corporate');


-- populate fact_sales (40 rows)

INSERT INTO fact_sales
(date_key, product_key, customer_key, quantity_sold, unit_price, discount_amount, total_amount)
VALUES
-- January sales
(20240101, 1, 1, 1, 85000, 5000, 80000),
(20240102, 2, 2, 2, 55000, 3000, 107000),
(20240103, 3, 3, 1, 12000, 0, 12000),
(20240104, 5, 4, 3, 4500, 0, 13500),
(20240105, 6, 5, 2, 1800, 0, 3600),

-- Weekend (higher volume)
(20240106, 8, 6, 3, 6500, 500, 19000),
(20240107, 7, 7, 2, 3200, 0, 6400),

(20240108, 11, 8, 1, 4800, 0, 4800),
(20240109, 12, 9, 1, 9200, 1000, 8200),
(20240110, 13, 10, 4, 1500, 0, 6000),

(20240113, 4, 11, 1, 72000, 4000, 68000),
(20240114, 9, 12, 2, 1200, 0, 2400),

(20240120, 10, 1, 1, 7800, 0, 7800),
(20240121, 14, 2, 1, 13500, 1500, 12000),
(20240125, 15, 3, 1, 28000, 2000, 26000),
(20240128, 2, 4, 1, 55000, 3000, 52000),
(20240131, 3, 5, 2, 12000, 0, 24000),

-- February sales
(20240201, 1, 6, 1, 85000, 5000, 80000),
(20240202, 5, 7, 2, 4500, 0, 9000),

-- Weekend
(20240203, 8, 8, 3, 6500, 500, 19000),
(20240204, 6, 9, 2, 1800, 0, 3600),

(20240210, 4, 10, 1, 72000, 4000, 68000),
(20240211, 7, 11, 2, 3200, 0, 6400),

(20240214, 11, 12, 1, 4800, 0, 4800),
(20240215, 12, 1, 1, 9200, 1000, 8200),

-- Weekend
(20240217, 10, 2, 2, 7800, 0, 15600),
(20240218, 9, 3, 3, 1200, 0, 3600),

(20240222, 15, 4, 1, 28000, 2000, 26000),
(20240224, 14, 5, 1, 13500, 1500, 12000),
(20240229, 2, 6, 1, 55000, 3000, 52000),

-- Additional rows to reach 40
(20240106, 3, 7, 2, 12000, 0, 24000),
(20240107, 5, 8, 4, 4500, 0, 18000),
(20240114, 6, 9, 3, 1800, 0, 5400),
(20240203, 11, 10, 2, 4800, 0, 9600),
(20240204, 13, 11, 5, 1500, 0, 7500),
(20240217, 9, 12, 4, 1200, 0, 4800),
(20240218, 10, 1, 2, 7800, 0, 15600),
(20240224, 6, 2, 3, 1800, 0, 5400),
(20240102, 4, 8, 1, 72000, 4000, 68000),
(20240210, 15, 9, 1, 28000, 2000, 26000);





