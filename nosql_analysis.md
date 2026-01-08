# Section A: Limitations of RDBMS

Relational databases like MySQL are well-suited for structured and consistent data but face limitations when handling highly diverse and evolving product catalogs. In FlexiMart’s case, different product categories have significantly different attributes. For example, laptops require specifications such as RAM, processor, and storage, while shoes require size, color, and material. Representing this variability in a relational schema would require either many nullable columns or frequent table alterations, both of which reduce clarity and maintainability.

Additionally, frequent schema changes are difficult in RDBMS systems because altering table structures can be time-consuming and risky in production environments. Adding new product types often requires schema redesigns and migrations.

Storing customer reviews as nested data would be inefficient in relational databases. Reviews would need a separate table with joins, increasing query complexity and reducing performance for read-heavy operations such as product detail views. These limitations make traditional relational databases less flexible for highly dynamic product data.

# Section B: NoSQL Benefits

MongoDB addresses these challenges by using a flexible, document-oriented data model. Each product is stored as a JSON-like document, allowing different products to have different attributes without enforcing a fixed schema. This makes MongoDB ideal for handling diverse product categories where attributes vary widely. New product types or attributes can be added without modifying existing documents or database structure.

MongoDB also supports embedded documents, enabling customer reviews to be stored directly within the product document. This improves data locality and simplifies queries, as product details and reviews can be retrieved in a single operation without joins.

Additionally, MongoDB is designed for horizontal scalability, allowing data to be distributed across multiple servers using sharding. This makes it well-suited for growing datasets and high read/write workloads. Overall, MongoDB provides flexibility, scalability, and simplicity for managing evolving product catalogs.

# Section C: Trade-offs

Despite its advantages, MongoDB has certain disadvantages compared to relational databases.

1. It provides weaker support for complex transactions involving multiple collections. While MongoDB supports transactions, they are generally less efficient and more complex than transactions in relational databases.

2. Enforcing strict data consistency and relationships is more challenging in MongoDB because it does not natively enforce foreign key constraints. This can lead to data integrity issues if application-level validation is not carefully implemented. As a result, MongoDB requires disciplined data modeling and validation logic to maintain consistency.
