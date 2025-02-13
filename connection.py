import pymysql

# Establish connection
# Note : USE YOUR OWN CREDENTIALS
connection = pymysql.connect(
    host='localhost',
    user='root',
    password='********', #change password
    database='shopping_mall'
)

# Create cursor object
cursor = connection.cursor()

# Create customer and transaction tables if they don't exist
create_customer_table = """
CREATE TABLE IF NOT EXISTS customer (
    Cust_ID INT PRIMARY KEY AUTO_INCREMENT,
    Cust_Name VARCHAR(255),
    Contact_Number VARCHAR(15) UNIQUE
);
"""

create_transaction_table = """
CREATE TABLE IF NOT EXISTS transaction (
    Trans_ID INT PRIMARY KEY AUTO_INCREMENT,
    Cust_ID INT,
    Store_ID INT,
    Total_Amount DECIMAL(10, 2),
    FOREIGN KEY (Cust_ID) REFERENCES customer(Cust_ID),
    FOREIGN KEY (Store_ID) REFERENCES stores(Store_ID)
);
"""

# Execute table creation statements
cursor.execute(create_customer_table)
cursor.execute(create_transaction_table)

# Function to add customer and transaction
def add_entry():
    with connection.cursor() as cursor:
        # Customer Details
        Cust_Name = input("Enter Customer Name: ")
        Contact_Number = input("Enter Contact Number: ")

        # Check if customer already exists
        cursor.execute("SELECT Cust_ID FROM customer WHERE Contact_Number = %s", (Contact_Number,))
        result = cursor.fetchone()

        if result:
            Cust_ID = result[0]
            print("Existing customer found with Cust_ID:", Cust_ID)
        else:
            # If customer is new, add them
            cursor.execute("INSERT INTO customer (Cust_Name, Contact_Number) VALUES (%s, %s)", (Cust_Name, Contact_Number))
            connection.commit()
            Cust_ID = cursor.lastrowid
            print("New customer added with Cust_ID:", Cust_ID)

        # Store ID
        Store_ID = int(input("Enter Store ID: "))

        # Validate Store_ID exists
        cursor.execute("SELECT Store_ID FROM stores WHERE Store_ID = %s", (Store_ID,))
        store_result = cursor.fetchone()
        if not store_result:
            print("Error: Store ID not found.")
            return

        total_amount = 0  # To accumulate total amount for the transaction
        while True:
            # Product Details
            Product_Name = input("Enter Product Name (or type 'done' to finish): ")
            if Product_Name.lower() == 'done':
                break

            Quantity = int(input("Enter Quantity: "))

            # Check product availability in inventory and calculate total amount
            cursor.execute("SELECT Quantity, Price FROM inventory WHERE Product_Name = %s", (Product_Name,))
            inventory_result = cursor.fetchone()

            if inventory_result:
                available_quantity, price_per_unit = inventory_result
                if Quantity > available_quantity:
                    print("Error: Not enough quantity in inventory.")
                else:
                    Total_Amount = Quantity * price_per_unit
                    total_amount += Total_Amount
                    new_quantity = available_quantity - Quantity

                    # Update the inventory
                    cursor.execute("UPDATE inventory SET Quantity = %s WHERE Product_Name = %s", (new_quantity, Product_Name))
                    connection.commit()

                    print(f"Added {Quantity} of {Product_Name} to the transaction. Amount: {Total_Amount}")
            else:
                print("Error: Product not found in inventory.")

        if total_amount > 0:
            # Insert transaction only if there were valid products added
            cursor.execute(
                "INSERT INTO transaction (Cust_ID, Store_ID, Total_Amount) VALUES (%s, %s, %s)",
                (Cust_ID, Store_ID, total_amount)
            )
            connection.commit()
            print("Transaction added successfully with Total Amount:", total_amount)
        else:
            print("No valid products were added to the transaction.")

# Call the function
add_entry()

# Close the connection
connection.close()
