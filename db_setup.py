import mariadb
import sys

try:
    conn = mariadb.connect(
        user="root",
        host="localhost",
        port=3306,
        database="assignment_2",
        autocommit=True
    )
except mariadb.Error as e:
    print(f"Error connecting to MariaDB Platform: {e}")
    sys.exit(1)

cur = conn.cursor()

def sql_execute(cursor, filename):
    with open(filename, 'r') as f:
        commands = f.read()
    for command in commands.split(';'):
        command = command.strip()
        if command:
            try:
                cursor.execute(command)
            except mariadb.Error as e:
                print(f"Error executing command: {e}")

sql_execute(cur, "init.sql")
print("Database setup done.")
conn.close()
