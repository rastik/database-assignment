# Module Imports

import mariadb
import sys

# connect to mariadb platform
try:
    conn = mariadb.connect(
        user="root",
        password="root_password",
        host="127.0.0.1",
        port=3306,
        database="assignment_2",
        autocommit=True
    )
except mariadb.Error as e:
    print(f"Error connecting to MariaDB Platform: {e}")
    sys.exit(1)

# Get Cursor
cur = conn.cursor()

# the execution function
def sql_execute(cursor, filename):
    with open(filename, 'r') as f:
        commands = f.read()

    # getting each command individually
    for command in commands.split(';'):
        try:
            cursor.execute(command)
        except mariadb.Error as e:
            print(f"There was an error executing command: {e}")


sql_execute(cur, "init.sql")

print('the setup was completed successfully')

conn.close()
print('connection was closed')