# Copyright (c) 2025 mcpeaps_HD
#
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT
#!/bin/bash
# This script creates a database dump of the specified database and saves it to a file.

# Path to your config file with login info
CONFIG_FILE="mariadb.cnf"

# Path to your SQL dump
DUMP_FILE="all-databases.sql"

mariadb-dump --defaults-extra-file="$CONFIG_FILE" -A --result-file="$DUMP_FILE"
