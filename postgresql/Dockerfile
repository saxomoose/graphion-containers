FROM postgres:latest

# TODO: comment out.
# COPY ./earthquake.csv /earthquake.csv

COPY ./scripts/ /docker-entrypoint-initdb.d/
COPY ./scripts /scripts
