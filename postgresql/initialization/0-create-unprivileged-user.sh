#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username postgres --dbname $POSTGRES_DB <<-EOSQL
	CREATE ROLE dba WITH LOGIN ENCRYPTED PASSWORD '$POSTGRES_PASSWORD';
EOSQL
