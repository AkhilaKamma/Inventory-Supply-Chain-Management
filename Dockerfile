FROM cassandra:latest

COPY cql_directory/main_schema.cql /usr/local/bin/main_schema.cql
COPY cql_directory/insert_data.cql /usr/local/bin/insert_data.cql
COPY cql_directory/insert_order_details.cql /usr/local/bin/insert_order_details.cql
COPY cql_directory/retrieve_data.cql /usr/local/bin/retrieve_data.cql
COPY cql_directory/update_data.cql /usr/local/bin/update_data.cql
COPY cql_directory/customer_query.cql /usr/local/bin/customer_query.cql
COPY cql_directory/specific_category.cql /usr/local/bin/specific_category.cql
COPY cql_directory/delete_data.cql /usr/local/bin/delete_data.cql

EXPOSE 9042
