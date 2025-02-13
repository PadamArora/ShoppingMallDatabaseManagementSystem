CREATE DATABASE shopping_mall;
USE shopping_mall;

CREATE TABLE Stores (
    Store_ID INT PRIMARY KEY,
    Store_Name VARCHAR(50) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    Location VARCHAR(50) NOT NULL,
    CONSTRAINT unique_store_name UNIQUE (Store_Name),
    CONSTRAINT unique_location UNIQUE (Location)
);

CREATE TABLE Employees (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50) NOT NULL,
    Date_Of_Birth DATE NOT NULL,
    Emp_Salary DECIMAL(10, 2) NOT NULL,
    Contact_Number VARCHAR(15) NOT NULL,
    Mgr_ID INT,
    Store_ID INT,
    FOREIGN KEY (Store_ID) REFERENCES Stores(Store_ID),
    FOREIGN KEY (Mgr_ID) REFERENCES Employees(Emp_ID)
);

CREATE TABLE Inventory (
    Product_ID VARCHAR(10) PRIMARY KEY,
    Product_Name VARCHAR(50) NOT NULL,
    Category VARCHAR(30) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Quantity INT NOT NULL,
    Store_ID INT,
    FOREIGN KEY (Store_ID) REFERENCES Stores(Store_ID),
    CONSTRAINT chk_price CHECK (Price > 0),
    CONSTRAINT chk_quantity CHECK (Quantity >= 0)
);

CREATE TABLE Promotions (
    Promotion_ID INT PRIMARY KEY,
    Promotion_Name VARCHAR(50) NOT NULL,
    Start_Date DATE NOT NULL,
    End_Date DATE NOT NULL,
    Discount_Percentage DECIMAL(5, 2) NOT NULL CHECK (Discount_Percentage BETWEEN 0 AND 100),
    Store_ID INT,
    FOREIGN KEY (Store_ID) REFERENCES Stores(Store_ID),
    CONSTRAINT chk_promotion_dates CHECK (Start_Date < End_Date)
);

INSERT INTO Stores (Store_ID, Store_Name, Category, Location) VALUES
(101, 'Urban Oak', 'Furniture', 'First Floor'),
(202, 'The Gadget Grid', 'Electronic Appliances', 'Second Floor'),
(303, 'Vibe & Vogue', 'Lifestyle', 'Third Floor'),
(404, 'JoyBox', 'Gifting', 'Fourth Floor'),
(505, 'Urban Bazaar', 'Food', 'Fifth Floor');

INSERT INTO Employees (Emp_ID, Emp_Name, Date_Of_Birth, Emp_Salary, Contact_Number, Mgr_ID, Store_ID) VALUES
(201, 'Ajay Mehra', '1985-03-15', 65000, '9811112233', 201, 101),
(202, 'Sonali Sharma', '1987-07-12', 60000, '9822334455', 202, 101),
(203, 'Rahul Verma', '1992-02-23', 40000, '9833445566', 201, 101),
(204, 'Anjali Gupta', '1995-06-14', 38000, '9844556677', 202, 101),
(205, 'Neeraj Singh', '1993-10-21', 42000, '9855667788', 201, 101),
(206, 'Kavita Menon', '1996-01-05', 41000, '9866778899', 202, 101),
(301, 'Vikash Dubey', '1980-11-11', 70000, '9811122334', 301, 202),
(302, 'Meena Rathi', '1986-05-09', 64000, '9822244556', 302, 202),
(303, 'Suresh Yadav', '1990-04-12', 43000, '9833366778', 301, 202),
(304, 'Priyanka Singh', '1994-08-03', 39000, '9844488990', 302, 202),
(305, 'Ravi Kumar', '1991-12-28', 45000, '9855500112', 301, 202),
(306, 'Sneha Patel', '1996-03-17', 40000, '9866622333', 302, 202),
(401, 'Manish Aggarwal', '1982-08-20', 68000, '9812233445', 401, 303),
(402, 'Pallavi Khanna', '1988-12-30', 62000, '9823344556', 402, 303),
(403, 'Gaurav Thakur', '1992-01-10', 44000, '9834455667', 401, 303),
(404, 'Ritika Kapoor', '1995-09-14', 41000, '9845566778', 402, 303),
(405, 'Rajeev Reddy', '1990-07-07', 46000, '9856677889', 401, 303),
(406, 'Anamika Jha', '1996-02-21', 42000, '9867788990', 402, 303),
(501, 'Rohit Bansal', '1984-06-05', 66000, '9813344556', 501, 404),
(502, 'Shreya Kapoor', '1989-11-18', 61000, '9824455667', 502, 404),
(503, 'Nitin Kaushik', '1993-03-02', 42000, '9835566778', 501, 404),
(504, 'Aditi Deshmukh', '1995-05-29', 39000, '9846677889', 502, 404),
(505, 'Anil Sinha', '1991-12-10', 44000, '9857788990', 501, 404),
(506, 'Pooja Malhotra', '1997-04-22', 41000, '9868899001', 502, 404),
(601, 'Mohit Suri', '1983-07-25', 69000, '9814455667', 601, 505),
(602, 'Kavya Desai', '1987-10-15', 63000, '9825566778', 602, 505),
(603, 'Harshad Mehta', '1991-02-05', 45000, '9836677889', 601, 505),
(604, 'Varsha Patel', '1994-11-09', 40000, '9847788990', 602, 505),
(605, 'Rohan Chhabra', '1992-08-31', 47000, '9858899001', 601, 505),
(606, 'Snehal Joshi', '1997-06-18', 43000, '9869900112', 602, 505);

INSERT INTO Inventory (Product_ID, Product_Name, Category, Price, Quantity, Store_ID) VALUES
('AX01', 'Comfy Cloud Sectional', 'Sofa', 53999, 3, 101),
('AX02', 'Luxe L-Shape Sofa', 'Sofa', 93199, 3, 101),
('AY01', 'Oakwood Dining Table', 'Table', 27999, 6, 101),
('AZ01', 'Ergo Office Chair', 'Chair', 5999, 5, 101),
('AW01', 'Nordic Platform Bed', 'Bed', 55999, 1, 101),
('BX01', 'Dell XPS 13', 'Laptops', 111999, 6, 202),
('BY01', 'iPhone 16 Pro Max', 'Phones', 98999, 29, 202),
('BZ01', 'Samsung QN90A Neo QLED', 'TVs', 176999, 8, 202),
('BW01', 'Apple AirPods Pro 2', 'Earpieces', 26999, 33, 202),
('BV01', 'JBL Charge 5', 'Speakers', 23999, 11, 202),
('BG01', 'Philips Norelco OneBlade', 'Grooming', 3999, 27, 202),
('BH01', 'LG Dual Inverter AC', 'Home Appliances', 57999, 14, 202),
('BI01', 'Amazon Echo (4th Gen)', 'Smart Home Devices', 14999, 24, 202),
('CX01', 'Zara Basic Ribbed T-Shirt', 'Women’s Clothes', 1499, 20, 303),
('CY01', 'Ralph Lauren Classic-Fit Polo', 'Men’s Clothes', 3499, 25, 303),
('CZ01', 'Gap Kids Graphic Tee', 'Kid’s Clothes', 899, 30, 303),
('CW01', 'Allen Edmonds Strand Cap-Toe Oxford Shoes', 'Shoes', 19999, 5, 303),
('CV01', 'Chanel Coco Mademoiselle Eau de Parfum', 'Perfume', 7999, 8, 303),
('CA01', 'Gucci Leather Belt with Double G Buckle', 'Accessories', 15999, 4, 303),
('DS01', 'Personalized Leather Journal', 'Stationery', 1299, 30, 404),
('DG01', 'Crystal Wine Glass Set', 'Glassware', 3999, 12, 404),
('DW01', 'Spa Gift Basket with Essential Oils', 'Wellness & Relaxation', 2999, 10, 404),
('DK01', 'Bamboo Cheese Board with Knives', 'Kitchen Essentials', 2499, 15, 404),
('DE01', 'Bluetooth Speaker with Customizable Lights', 'Electronics', 4999, 10, 404),
('FA01', 'Sea Salt & Vinegar Potato Chips', 'Chips', 50, 100, 505),
('FB01', 'Classic Lay’s Potato Wafers', 'Wafers', 40, 100, 505),
('FC01', 'Coca-Cola Classic', 'Drinks', 40, 150, 505);

 
INSERT INTO Promotions (Promotion_ID, Promotion_Name, Start_Date, End_Date, Discount_Percentage, Store_ID) VALUES
(1, 'Spring Sale', '2024-03-01', '2024-03-31', 10.00, 101),
(2, 'Summer Special', '2024-06-01', '2024-06-30', 15.00, 202),
(3, 'Back to School', '2024-08-01', '2024-08-31', 20.00, 303),
(4, 'Autumn Fest', '2024-09-01', '2024-09-30', 12.50, 404),
(5, 'Winter Wonderland', '2024-12-01', '2024-12-31', 25.00, 505),
(6, 'Furniture Fest', '2024-04-01', '2024-04-30', 18.00, 101),
(7, 'Tech Week', '2024-11-01', '2024-11-07', 22.00, 202),
(8, 'Fashion Fiesta', '2024-05-01', '2024-05-31', 17.50, 303),
(9, 'Gifting Galore', '2024-10-01', '2024-10-31', 19.00, 404),
(10, 'Food Fest', '2024-07-01', '2024-07-31', 10.00, 505);
