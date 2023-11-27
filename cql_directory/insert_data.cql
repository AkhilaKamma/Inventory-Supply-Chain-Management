-- insert_data.cql

USE mykeyspace;

-- Insert data into the Products table
INSERT INTO Products (ProductID, ProductName, ProductDescription, Category, Price, SupplierID)
VALUES 
  (uuid(), 'Laptop', 'High-performance laptop', 'Electronics', 1000.00, uuid());

INSERT INTO Products (ProductID, ProductName, ProductDescription, Category, Price, SupplierID)
VALUES 
  (uuid(), 'Smartphone', 'Latest smartphone model', 'Electronics', 500.00, uuid());

INSERT INTO Products (ProductID, ProductName, ProductDescription, Category, Price, SupplierID)
VALUES 
  (uuid(), 'Chair', 'Comfortable office chair', 'Furniture', 150.00, uuid());


-- Insert data into Warehouses Table
INSERT INTO Warehouses (WarehouseID, WarehouseName, Location, Capacity, ContactInformation)
VALUES 
  (uuid(), 'Warehouse A', 'City A', 1000, 'Contact A');

INSERT INTO Warehouses (WarehouseID, WarehouseName, Location, Capacity, ContactInformation)
VALUES 
  (uuid(), 'Warehouse B', 'City B', 800, 'Contact B');

INSERT INTO Warehouses (WarehouseID, WarehouseName, Location, Capacity, ContactInformation)
VALUES 
  (uuid(), 'Warehouse C', 'City C', 1200, 'Contact C');

-- Insert data into Suppliers Table
INSERT INTO Suppliers (SupplierID, SupplierName, ContactInformation, ProductCategoriesSupplied)
VALUES 
  (uuid(), 'Supplier X', 'Supplier X Contact', {'Electronics', 'Furniture'});

INSERT INTO Suppliers (SupplierID, SupplierName, ContactInformation, ProductCategoriesSupplied)
VALUES 
  (uuid(), 'Supplier Y', 'Supplier Y Contact', {'Electronics'});

INSERT INTO Suppliers (SupplierID, SupplierName, ContactInformation, ProductCategoriesSupplied)
VALUES 
  (uuid(), 'Supplier Z', 'Supplier Z Contact', {'Furniture'});


-- Insert data into Orders Table
INSERT INTO Orders (OrderID, OrderDate, CustomerName, OrderStatus, TotalOrderAmount, ShippingAddress)
VALUES 
  (uuid(), '2023-11-23', 'Customer A', 'Shipped', 1650.00, 'Address A');

INSERT INTO Orders (OrderID, OrderDate, CustomerName, OrderStatus, TotalOrderAmount, ShippingAddress)
VALUES 
  (uuid(), '2023-11-24', 'Customer B', 'Processing', 750.00, 'Address B');

INSERT INTO Orders (OrderID, OrderDate, CustomerName, OrderStatus, TotalOrderAmount, ShippingAddress)
VALUES 
  (uuid(), '2023-11-25', 'Customer C', 'Pending', 1200.00, 'Address C');


-- Insert data into OrderDetails Table for Customer A
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, QuantityOrdered, UnitPrice, TotalLineItemAmount)
VALUES (uuid(), (SELECT OrderID FROM Orders WHERE CustomerName = 'Customer A' LIMIT 1), (SELECT ProductID FROM Products WHERE ProductName = 'Laptop' LIMIT 1), 2, 1000.00, 2000.00);

-- Insert data into OrderDetails Table for Customer B
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, QuantityOrdered, UnitPrice, TotalLineItemAmount)
VALUES (uuid(), (SELECT OrderID FROM Orders WHERE CustomerName = 'Customer B' LIMIT 1), (SELECT ProductID FROM Products WHERE ProductName = 'Chair' LIMIT 1), 1, 150.00, 150.00);


