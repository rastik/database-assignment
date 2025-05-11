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


# All queries
queries = {
    "1. Customers with future reservations and ski passes": """
        SELECT c.first_name, c.last_name
        FROM Customer c
        JOIN Reservation r ON c.customer_id = r.customer_id
        JOIN SkiPass s ON r.reservation_id
        = s.reservation_id
        WHERE s.valid_from > CURDATE()
        AND r.start_date > CURDATE();
    """,

    "2. Most booked package": """
        SELECT p.package_name, COUNT(r.reservation_id) AS count
        FROM Package p
        JOIN Reservation r ON p.package_id = r.package_id
        Group by p.package_name
        ORDER BY count DESC
        LIMIT 1;
    """,

    "3. Reservations with total price above 500": """
        SELECT * FROM Reservation
        WHERE total_price > 500;
    """,

    "4. Total revenue from package sales between May 2024 and Jan 2025": """
        SELECT SUM(total_price)
        FROM Reservation
        WHERE start_date BETWEEN '2024-05-01' AND '2025-01-01';
    """,

    "5. Average total price of all reservations": """
        SELECT AVG(total_price) 
        From Reservation;
    """,

    "6. Average days between reservation date and start date": """
        SELECT AVG(total_price) 
        From Reservation;
    """
}

for title, query in queries.items():
    print(f"{title}:")
    try:
        cur.execute(query)
        results = cur.fetchall()
        for item in results:
            print(item)
    except mariadb.Error as e:
        print(f"Error executing query: {e}")

conn.close()
print("connection was closed.")