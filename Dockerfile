FROM python:3.11-slim

ENV PYTHONUNBUFFERED=1

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        mariadb-server \
        mariadb-client \
        libmariadb-dev \
        gcc \
        python3-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install mariadb

WORKDIR /app

COPY init.sql .
COPY db_setup.py .
COPY queries_sql.py .


CMD sh -c "\
    service mariadb start && \
    sleep 5 && \
    mariadb -u root -e 'CREATE DATABASE IF NOT EXISTS assignment_2;' && \
    mariadb -u root assignment_2 < init.sql && \
    python3 db_setup.py && \
    python3 queries_sql.py \
"
