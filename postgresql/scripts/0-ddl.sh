#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username postgres --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE ROLE $POSTGRES_UNPRIV_USER_SCA_WEB WITH LOGIN ENCRYPTED PASSWORD '$POSTGRES_PASSWORD';
	DROP SCHEMA IF EXISTS $POSTGRES_SCHEMA CASCADE;
	CREATE SCHEMA $POSTGRES_SCHEMA;
	ALTER SCHEMA $POSTGRES_SCHEMA OWNER TO $POSTGRES_UNPRIV_USER_SCA_WEB;

	CREATE ROLE $POSTGRES_UNPRIV_USER_SCA_WORKER WITH LOGIN ENCRYPTED PASSWORD '$POSTGRES_PASSWORD';
	GRANT CONNECT, SELECT ON SCHEMA $POSTGRES_SCHEMA TO $POSTGRES_UNPRIV_USER_SCA_WORKER;
EOSQL