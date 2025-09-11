#!/bin/bash
# Copyright (c) 2025 mahd
#
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT
set -e

# Environment variable POSTGRES_MULTIPLE_DATABASES: comma-separated list
IFS=',' read -ra DBS <<< "$POSTGRES_MULTIPLE_DATABASES"

for db in "${DBS[@]}"; do
    echo "Creating database: $db"
    psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
        CREATE DATABASE "$db" IF NOT EXISTS;
EOSQL
done


# this will prompt for a password for the new user
createuser --pwprompt synapse_user


