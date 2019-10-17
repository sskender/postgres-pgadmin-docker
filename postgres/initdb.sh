#!/bin/sh

set -e

export PGUSER="$POSTGRES_USER"


# change system settings
psql -c "ALTER SYSTEM SET max_connections = '150';"
psql -c "ALTER SYSTEM SET shared_buffers = '1GB';"
psql -c "ALTER SYSTEM SET effective_cache_size = '3GB';"
psql -c "ALTER SYSTEM SET maintenance_work_mem = '256MB';"
psql -c "ALTER SYSTEM SET wal_buffers = '16MB';"
psql -c "ALTER SYSTEM SET default_statistics_target = '100';"
psql -c "ALTER SYSTEM SET random_page_cost = '1.1';"
psql -c "ALTER SYSTEM SET effective_io_concurrency = '200';"
psql -c "ALTER SYSTEM SET work_mem = '6990kB';"
psql -c "ALTER SYSTEM SET min_wal_size = '1GB';"
psql -c "ALTER SYSTEM SET max_wal_size = '2GB';"
psql -c "ALTER SYSTEM SET max_worker_processes = '2';"
psql -c "ALTER SYSTEM SET max_parallel_workers_per_gather = '1';"
psql -c "ALTER SYSTEM SET max_parallel_workers = '2';"


# create user
psql -c "CREATE USER sampleuser WITH PASSWORD 'samplepassword';"


# create database
psql -c "CREATE DATABASE sampledb;"


# access to database
psql -c "REVOKE CONNECT ON DATABASE sampledb FROM PUBLIC;"
psql -c "GRANT CONNECT ON DATABASE sampledb TO sampleuser;"


# access to schema
psql -c "REVOKE ALL ON SCHEMA public FROM PUBLIC;"
psql -c "GRANT USAGE ON SCHEMA public TO sampleuser;"


# access to tables
psql -c "GRANT ALL ON ALL TABLES IN SCHEMA public TO sampleuser;"
