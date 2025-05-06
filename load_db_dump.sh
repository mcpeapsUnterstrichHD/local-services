#!/bin/bash
# Copyright (c) 2025 mcpeaps_HD
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

# This script loads a MariaDB dump from a file.

# Path to your config file with login info
CONFIG_FILE="mariadb.cnf"

# Path to your SQL dump
DUMP_FILE="all-databases.sql"

# Check if dump file exists
if [[ ! -f "$DUMP_FILE" ]]; then
  echo "❌ Dump file not found: $DUMP_FILE"
  exit 1
fi

# Load the dump
echo "⚙️ Importing dump file: $DUMP_FILE"
mariadb --defaults-extra-file="$CONFIG_FILE" < "$DUMP_FILE"

if [[ $? -eq 0 ]]; then
  echo "✅ Import completed successfully."
else
  echo "❌ Import failed."
fi