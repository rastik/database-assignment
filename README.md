This repo will include Rastislav's and Sviatoslav's database assignments.

Option 1: Automatic Execution 

- This builds the container, starts MariaDB, initializes the database, and runs both Python scripts automatically.


docker build -t mariadb-assignment .

docker run --rm mariadb-assignment



Option 2: Manual Execution 

- This lets you run the files and queries step by step.


docker run -it mariadb-assignment /bin/bash

service mariadb start

mariadb -u root -e 'CREATE DATABASE IF NOT EXISTS assignment_2;'

mariadb -u root assignment_2 < init.sql

python3 queries_sql.py
