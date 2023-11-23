FROM cassandra:latest

COPY main_schema.cql /usr/local/bin/main_schema.cql
COPY insert_data.cql /usr/local/bin/
COPY retrieve_data.cql /usr/local/bin/
COPY execute-cql.sh /usr/local/bin/execute-cql.sh

RUN chmod +x /usr/local/bin/execute-cql.sh

EXPOSE 9042
