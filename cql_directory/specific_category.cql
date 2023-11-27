USE mykeyspace;

-- Specify the product category
SELECT * FROM Suppliers WHERE ProductCategoriesSupplied CONTAINS 'Electronics' ALLOW FILTERING;