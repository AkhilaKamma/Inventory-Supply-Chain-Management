#!/bin/bash

cqlsh /usr/local/bin/main_schema.cql

cqlsh /usr/local/bin/insert_data.cql

cqlsh /usr/local/bin/retrieve_data.cql

done