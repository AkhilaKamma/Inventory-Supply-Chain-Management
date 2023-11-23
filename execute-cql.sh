#!/bin/bash

cqlsh /usr/local/bin/main_schema.cql

cqlsh -f insert_data.cql

cqlsh -f retrieve_data.cql

done