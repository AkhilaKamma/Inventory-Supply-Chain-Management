-- insert_data.cql

USE mykeyspace;

-- Insert data into Products Table
INSERT INTO Products (ProductID, ProductName, ProductDescription, Category, Price, SupplierID)
VALUES 
  (uuid(), 'Laptop', 'High-performance laptop', 'Electronics', 1000.00, uuid()),
  (uuid(), 'Smartphone', 'Latest smartphone model', 'Electronics', 500.00, uuid()),
  (uuid(), 'Chair', 'Comfortable office chair', 'Furniture', 150.00, uuid());

-- Insert data into Warehouses Table
INSERT INTO Warehouses (WarehouseID, WarehouseName, Location, Capacity, ContactInformation)
VALUES 
  (uuid(), 'Warehouse A', 'City A', 1000, 'Contact A'),
  (uuid(), 'Warehouse B', 'City B', 800, 'Contact B'),
  (uuid(), 'Warehouse C', 'City C', 1200, 'Contact C');

-- Insert data into Suppliers Table
INSERT INTO Suppliers (SupplierID, SupplierName, ContactInformation, ProductCategoriesSupplied)
VALUES 
  (uuid(), 'Supplier X', 'Supplier X Contact', {'Electronics', 'Furniture'}),
  (uuid(), 'Supplier Y', 'Supplier Y Contact', {'Electronics'}),
  (uuid(), 'Supplier Z', 'Supplier Z Contact', {'Furniture'});

-- Insert data into Orders Table
INSERT INTO Orders (OrderID, OrderDate, CustomerName, OrderStatus, TotalOrderAmount, ShippingAddress)
VALUES 
  (uuid(), '2023-11-23', 'Customer A', 'Shipped', 1650.00, 'Address A'),
  (uuid(), '2023-11-24', 'Customer B', 'Processing', 750.00, 'Address B');

-- Insert data into OrderDetails Table
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, QuantityOrdered, UnitPrice, TotalLineItemAmount)
VALUES 
  (uuid(), (SELECT OrderID FROM Orders WHERE CustomerName = 'Customer A' LIMIT 1), (SELECT ProductID FROM Products WHERE ProductName = 'Laptop' LIMIT 1), 2, 1000.00, 2000.00),
  (uuid(), (SELECT OrderID FROM Orders WHERE CustomerName = 'Customer B' LIMIT 1), (SELECT ProductID FROM Products WHERE ProductName = 'Chair' LIMIT 1), 1, 150.00, 150.00);

-- Insert data into Shipments Table
INSERT INTO Shipments (ShipmentID, OrderID, WarehouseID, ShipmentDate, ShipmentStatus, TrackingInformation)
VALUES 
  (uuid(), (SELECT OrderID FROM Orders WHERE CustomerName = 'Customer A' LIMIT 1), (SELECT WarehouseID FROM Warehouses WHERE WarehouseName = 'Warehouse A' LIMIT 1), '2023-11-25', 'Delivered', 'Tracking A'),
  (uuid(), (SELECT OrderID FROM Orders WHERE CustomerName = 'Customer B' LIMIT 1), (SELECT WarehouseID FROM Warehouses WHERE WarehouseName = 'Warehouse B' LIMIT 1), '2023-11-26', 'In Transit', 'Tracking B');

-- Insert data into InventoryLevels Table
INSERT INTO InventoryLevels (WarehouseID, ProductID, QuantityOnHand, MinimumStockLevel, MaximumStockLevel, ReorderPoint, LastRestockDate)
VALUES 
  ((SELECT WarehouseID FROM Warehouses WHERE WarehouseName = 'Warehouse A' LIMIT 1), (SELECT ProductID FROM Products WHERE ProductName = 'Laptop' LIMIT 1), 50, 20, 100, 30, '2023-11-20'),
  ((SELECT WarehouseID FROM Warehouses WHERE WarehouseName = 'Warehouse B' LIMIT 1), (SELECT ProductID FROM Products WHERE ProductName = 'Smartphone' LIMIT 1), 30, 10, 80, 20, '2023-11-22');
