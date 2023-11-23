-- Horizontal Fragmentation
ALTER TABLE Products
ADD PRIMARY KEY (Category, ProductID);

-- Vertical Fragmentation
CREATE TABLE ProductsBasic (
    ProductID UUID PRIMARY KEY,
    ProductName TEXT,
    Category TEXT
);

-- Replication Setup
ALTER KEYSPACE mykeyspace
WITH replication = {'class': 'NetworkTopologyStrategy', 'datacenter1': 3};
