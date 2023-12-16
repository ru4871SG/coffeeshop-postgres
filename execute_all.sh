#!/bin/bash

# Exit the script if any command fails
set -e

# Set the paths to Python and psql
PYTHON_PATH="/usr/bin/python3"
PSQL_PATH="/usr/bin/psql"

# Load environment variables from .env file
source .env

# Run Python script
echo "Running Python script..."
"$PYTHON_PATH" 01_import_from_json_to_postgres.py

# Run SQL scripts
echo "Running SQL scripts..."
"$PSQL_PATH" -v ON_ERROR_STOP=1 -U "$PGUSER" -d "$PGDATABASE" -f 02_data_cleaning.sql
"$PSQL_PATH" -v ON_ERROR_STOP=1 -U "$PGUSER" -d "$PGDATABASE" -f 03_join_tables.sql
"$PSQL_PATH" -v ON_ERROR_STOP=1 -U "$PGUSER" -d "$PGDATABASE" -f 04_alter_data_types_and_pkeys.sql
"$PSQL_PATH" -v ON_ERROR_STOP=1 -U "$PGUSER" -d "$PGDATABASE" -f 05_add_relationships.sql
"$PSQL_PATH" -v ON_ERROR_STOP=1 -U "$PGUSER" -d "$PGDATABASE" -f 06_create_wallet_tables.sql
"$PSQL_PATH" -v ON_ERROR_STOP=1 -U "$PGUSER" -d "$PGDATABASE" -f 07_wallet_tables_mock_data.sql
"$PSQL_PATH" -v ON_ERROR_STOP=1 -U "$PGUSER" -d "$PGDATABASE" -f 08_validate_constraints.sql
"$PSQL_PATH" -v ON_ERROR_STOP=1 -U "$PGUSER" -d "$PGDATABASE" -f 09_stored_procedures.sql
"$PSQL_PATH" -v ON_ERROR_STOP=1 -U "$PGUSER" -d "$PGDATABASE" -f 10_subquery.sql

echo "All scripts executed successfully."
