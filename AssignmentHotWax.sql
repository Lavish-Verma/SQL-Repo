--1. Creating a table:-

CREATE TABLE orders (
    First_Name VARCHAR(255),
    Last_Name VARCHAR(255),
    Product_Name VARCHAR(255),
    Product_Description VARCHAR(255),
    Product_Returnable VARCHAR(50),
    Seller VARCHAR(255),
    Order_ID VARCHAR(45),
    Total INT,
    Date DATE,
    City VARCHAR(45),
    Address TEXT
);

--2. Inserting Values in it:-

INSERT INTO orders (First_Name, Last_Name, Product_Name, Product_Description, Product_Returnable, Seller, Order_ID, Total, Date, City, Address)
VALUES
('Lavish', 'Verma', 'iPhone 11', 'Brand new iPhone 13, iPhone 13 with 256GB storage', 'Yes', 'Apple Store', 'ORD123', 120000, '2024-05-10', 'Indore', '123 MG Road'),
('Aditya', 'Verma', 'Samsung TV', '55" 4K Smart TV, wall mount bracket', 'No', 'Best Buy', 'ORD124', 80000, '2024-05-11' ,'Indore' , 'Ab Road');

--3. To remove all the dependencies and redundency we normalize/split the main table into many:-

CREATE TABLE Product_Descriptions (
    Product_ID INT AUTO_INCREMENT PRIMARY KEY,
    Product_Description VARCHAR(1000)
);
--here auto increment is used to take unique values for the primary key attribute 

CREATE TABLE Customers (
    Customer_ID INT AUTO_INCREMENT PRIMARY KEY,
    First_Name VARCHAR(255),
    Last_Name VARCHAR(255)
);

CREATE TABLE Products (
    Product_ID INT AUTO_INCREMENT PRIMARY KEY,
    Product_Name VARCHAR(255),
    Product_Returnable VARCHAR(50),
    Seller VARCHAR(255),
    Product_Description_ID INT,
    FOREIGN KEY (Product_Description_ID) REFERENCES Product_Descriptions(Product_ID)
);

CREATE TABLE Orders (
    Order_ID VARCHAR(45) PRIMARY KEY,
    Customer_ID INT,
    Product_ID INT,
    Total INT,
    Date DATE,
    City VARCHAR(45),
    Address TEXT,
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);

--4. Solving the assignment questions :-

--1
SELECT *FROM Orders WHERE Order_ID = 'ORD001';

--2
SELECT SUM(Total) AS Total_Amount FROM Orders WHERE Order_ID = 'ORD001';

--3
 UPDATE Orders SET City = 'Bhopal' WHERE Order_ID = 'ORD001';

--4
UPDATE Product_Descriptions SET Product_Description = 'Brand new iPhone 13 with 256GB storage' WHERE Product_ID = 1;

--5
SELECT * FROM Products WHERE Product_Returnable = 'Yes';
