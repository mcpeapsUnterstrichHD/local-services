# Copyright (c) 2025 mcpeaps_HD
#
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT
#!/bin/bash
# This script creates a database dump of the specified database and saves it to a file.
mariadb-dump --defaults-extra-file=mariadb.cnf -A --result-file=all-databases.sql
