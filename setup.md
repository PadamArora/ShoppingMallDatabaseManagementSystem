# Shopping Mall DBMS Project - Setup Guide

## Repository Link
This project is hosted on GitHub: [Shopping Mall DBMS Project](https://github.com/PadamArora/ShoppingMallDatabaseManagementSystem)

## Steps to Set Up and Run the Project

### 1. **Download the Required Files**
   - Clone this repository using the following command:
     ```bash
     git clone https://github.com/PadamArora/ShoppingMallDatabaseManagementSystem.git
     ```
   - Alternatively, you can download the files manually from the repository.
   - Ensure you have MySQL installed and properly configured on your system.

### 2. **Set Up the Database**
   - Open the `shopping_mall.sql` file in your preferred SQL editor (e.g., MySQL Workbench, HeidiSQL, or DBeaver).
   - Run all the SQL statements to create the database and tables.

### 3. **Configure and Run `connection.py`**
   - Open `connection.py` in a text editor.
   - Locate the database connection settings and update them with your own MySQL credentials (username, password, database name, host, and port if necessary).
   - Save the changes and close the file.
   - Run the script to test the connection:
     ```bash
     python connection.py
     ```
   - If the connection is successful, you should see a confirmation message in the terminal.

## Important Notes
- Ensure you update the `connection.py` file with your own MySQL username and password before running the script.
- If you encounter any errors, verify that MySQL is running and that your credentials are correct.
- If the database does not initialize properly, check if any table names or constraints conflict with your MySQL version.
- If needed, modify the SQL script to match your database settings and rerun it.

## Additional Resources
- [MySQL Official Documentation](https://dev.mysql.com/doc/)
- [Python MySQL Connector Guide](https://dev.mysql.com/doc/connector-python/en/)
- If you face any issues, feel free to raise an issue in the GitHub repository.

---

This guide provides a step-by-step approach to setting up and running the Shopping Mall DBMS project. For further support, refer to the resources provided or check your database and script configurations.

