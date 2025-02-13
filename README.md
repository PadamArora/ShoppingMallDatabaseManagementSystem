# ShoppingMallDatabaseManagementSystem

Project Description

The Shopping Mall Management System project focuses on designing and implementing a comprehensive database system to efficiently manage the operations of a shopping mall. This project entails creating a structured database with various interconnected tables to store essential information about the mall's stores, employees, inventory, customers, transactions, and promotions. The project showcases the use of primary and foreign keys to establish relationships between these tables, ensuring data integrity and consistency. It also involves populating the tables with sample data and providing functionalities to manage and process customer transactions seamlessly.

Aim

The primary aim of this project is to develop a robust and scalable database system that can effectively manage and streamline the operations of a shopping mall. This system is designed to handle the storage, retrieval, and management of detailed information regarding stores, employees, inventory, customers, and transactions. The objective is to enhance the efficiency and accuracy of managing these operations, facilitating better decision-making and operational control.

Project Requirements

Tables:

Stores: This table will contain detailed information about each store within the shopping mall, including the store ID, name, category, and location.

Employees: This table will store data about the employees working in the stores, including their ID, name, date of birth, salary, contact number, manager ID, and the store they are associated with.

Inventory: This table will manage the details of products available in the stores, including product ID, name, category, price, quantity, and the store ID.

Customers: This table will store customer details, such as customer ID, name, and contact number.

Transactions: This table will record the transactions made by customers, including transaction ID, customer ID, store ID, and total amount of the transaction.

Promotions: This table will manage promotional events in the stores, including promotion ID, name, start date, end date, discount percentage, and store ID.

Use

Store Management: Enables tracking and managing the comprehensive details of all the stores within the mall, facilitating better oversight and control over store operations.

Employee Management: Provides a system to maintain detailed records of employees, including their personal information, employment details, and association with stores, ensuring efficient human resource management.

Inventory Management: Monitors and updates the inventory of products available in various stores, helping in maintaining optimal stock levels and managing inventory efficiently.

Customer Management: Stores customer information and manages customer-related activities, ensuring accurate record-keeping and efficient handling of customer transactions.

Transaction Processing: Handles and processes transactions made by customers, updating the inventory accordingly, and ensuring accurate transaction records and inventory management.

Promotion Management: Manages promotional events and discounts offered in the stores, ensuring proper tracking and implementation of promotions to attract and retain customers.

Beneficiaries

The primary beneficiaries of this Shopping Mall Management System project include:

Mall Management: Gains a comprehensive tool for overseeing the overall operations and management of the shopping mall, ensuring smooth functioning and enhanced operational efficiency.

Employees: Ensures accurate records of their employment and management within the mall, providing a structured system for managing employee details and employment history.

Customers: Experience efficient processing of their transactions and maintaining of their purchase history, leading to improved customer service and satisfaction.

Languages Used

MySQL Workbench: A robust tool for MySQL database management, using SQL for queries and data handling. It supports Python integration for automation through MySQL Connectors, enhancing workflows alongside XAMPP in a cohesive development environment.

Python: Employed for various scripting and programming tasks, including database management and integration with other systems.

Relational Schema

Stores (Store_ID, Store_Name, Category, Location)

Employees (Emp_ID, Emp_Name, Date_of_Birth, Emp_Salary, Contact_Number, Mgr_ID, Store_ID)

Inventory (Product_ID, Product_Name, Category, Price, Quantity, Store_ID)

Promotions (Promotion_ID, Promotion_Name, Start_Date, End_Date, Discount_Percentage, Store_ID)

Customers (Cust_ID, Cust_Name, Contact_Number)

Transactions (Trans_ID, Cust_ID, Store_ID)

