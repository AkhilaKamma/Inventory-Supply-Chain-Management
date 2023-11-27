USE mykeyspace;

-- Insert data into OrderDetails for Customer A's order
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, QuantityOrdered, UnitPrice, TotalLineItemAmount)
VALUES (
  uuid(),
  (SELECT OrderID FROM Orders WHERE CustomerName = 'Customer A' LIMIT 1),
  (SELECT ProductID FROM Products WHERE ProductName = 'Laptop' LIMIT 1),
  2,
  (SELECT Price FROM Products WHERE ProductName = 'Laptop' LIMIT 1),
  2 * (SELECT Price FROM Products WHERE ProductName = 'Laptop' LIMIT 1)
);

-- Insert data into OrderDetails for Customer B's order
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, QuantityOrdered, UnitPrice, TotalLineItemAmount)
VALUES (
  uuid(),
  (SELECT OrderID FROM Orders WHERE CustomerName = 'Customer B' LIMIT 1),
  (SELECT ProductID FROM Products WHERE ProductName = 'Chair' LIMIT 1),
  1,
  (SELECT Price FROM Products WHERE ProductName = 'Chair' LIMIT 1),
  1 * (SELECT Price FROM Products WHERE ProductName = 'Chair' LIMIT 1)
);
