FROM mysql
ADD sample.sql /docker-entrypoint-initdb.d/sample.sql
