FROM mysql

ENV DB_NAME catalog
ENV DB_USER root
ENV DB_PASS root

ADD sample.sql /docker-entrypoint-initdb.d/sample.sql
