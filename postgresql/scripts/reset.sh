#!/bin/bash
# Truncate all tables and reset all sequences in schema sca.

psql -U postgres -d $POSTGRES_DB <<-EOSQL
    SET client_min_messages TO WARNING;
    DO
    \$\$
    DECLARE
      tbl text;
    BEGIN
      FOR tbl IN
        SELECT tablename
        FROM pg_tables
        WHERE schemaname = '$POSTGRES_SCHEMA'
      LOOP
        EXECUTE 'TRUNCATE TABLE ' || '$POSTGRES_SCHEMA.' || tbl || ' CASCADE';
      END LOOP;
    END
    \$\$;

    DO
    \$\$
    DECLARE
      seq_name text;
    BEGIN
      FOR seq_name IN
        SELECT sequence_name
        FROM information_schema.sequences
        WHERE sequence_schema = '$POSTGRES_SCHEMA'
      LOOP
        EXECUTE 'ALTER SEQUENCE IF EXISTS ' || '$POSTGRES_SCHEMA.' || seq_name || ' RESTART WITH 1;';
      END LOOP;
    END
    \$\$;
EOSQL