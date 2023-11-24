FROM cassandra:latest

COPY main_schema.cql /usr/local/bin/main_schema.cql
COPY insert_data.cql /usr/local/bin/insert_data.cql
COPY insert_order_details.cql /usr/local/bin/insert_order_details.cql
COPY retrieve_data.cql /usr/local/bin/retrieve_data.cql
COPY update_data.cql /usr/local/bin/update_data.cql
COPY delete_data.cql /usr/local/bin/delete_data.cql
Copy fragmentation.cql /usr/local/bin/fragmentation.cql
COPY execute-cql.sh /usr/local/bin/execute-cql.sh


RUN chmod +x /usr/local/bin/execute-cql.sh

EXPOSE 9042
