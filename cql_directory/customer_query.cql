USE mykeyspace;

-- Specify the customer
SELECT * FROM Orders WHERE CustomerName = 'Customer A' ALLOW FILTERING;
