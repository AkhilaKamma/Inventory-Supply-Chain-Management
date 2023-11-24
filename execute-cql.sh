#!/bin/bash

CASSANDRA_IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' inventory-supply-chain-management-main-cassandra-1-1)

cqlsh -h $CASSANDRA_IP -f /usr/local/bin/main_schema.cql
cqlsh -h $CASSANDRA_IP -f /usr/local/bin/insert_data.cql
cqlsh -h $CASSANDRA_IP -f /usr/local/bin/retrieve_data.cql