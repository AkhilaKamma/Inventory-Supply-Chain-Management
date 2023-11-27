#!/bin/bash

# echo "Starting the Cassandra containers"
# docker build -t cassandra .
# docker-compose up -d --build

# echo "Waiting for 2 minutes for the Cassandra containers to start properly"
# sleep 120

echo "Creating keyspace and tables"
docker exec -i inventory-supply-chain-management-cassandra-1-1 cqlsh -f /usr/local/bin/main_schema.cql

echo "Inserting data into the tables"
docker exec -i inventory-supply-chain-management-cassandra-1-1 cqlsh -f /usr/local/bin/insert_data.cql
docker exec -i inventory-supply-chain-management-cassandra-1-1 cqlsh -f /usr/local/bin/insert_order_details.cql

echo "Retrieving data from the tables"
docker exec -i inventory-supply-chain-management-cassandra-1-1 cqlsh -f /usr/local/bin/retrieve_data.cql

echo "Updating data in the tables"
docker exec -i inventory-supply-chain-management-cassandra-1-1 cqlsh -f /usr/local/bin/update_data.cql

echo "Performing fragmentation"
docker exec -i inventory-supply-chain-management-cassandra-1-1 cqlsh -f /usr/local/bin/fragmentation.cql
docker exec -i inventory-supply-chain-management-cassandra-1-1 cqlsh -f /usr/local/bin/retrieve_data.cql

echo "Deleting data from the tables"
docker exec -i inventory-supply-chain-management-cassandra-1-1 cqlsh -f /usr/local/bin/delete_data.cql

