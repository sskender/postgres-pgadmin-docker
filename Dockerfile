FROM postgres:alpine

ADD mockdata/* /docker-entrypoint-initdb.d/