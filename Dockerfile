FROM cassandra:latest

COPY main_schema.cql /usr/local/bin/main_schema.cql
COPY insert_data.cql /usr/local/bin/insert_data.cql
COPY retrieve_data.cql /usr/local/bin/retrieve_data.cql
COPY execute-cql.sh /usr/local/bin/execute-cql.sh

RUN chmod +x /usr/local/bin/execute-cql.sh

EXPOSE 9042
