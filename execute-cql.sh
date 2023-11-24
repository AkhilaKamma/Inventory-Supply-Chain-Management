#!/bin/bash

cqlsh -f /usr/local/bin/main_schema.cql

cqlsh -f /usr/local/bin/insert_data.cql

cqlsh -f /usr/local/bin/retrieve_data.cql
