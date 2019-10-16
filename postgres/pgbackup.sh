#!/bin/bash

set -e

# backup all databases
for DATABASE in `psql -At -U postgres -c "SELECT datname FROM pg_database WHERE NOT datistemplate ORDER BY datname;" postgres`
do
    echo "Dumping $DATABASE ..."
    pg_dump -U postgres -Fc "$DATABASE" > /opt/backups/"$DATABASE".$(date -d "today" +"%Y-%m-%d-%H-%M").dump
done

# delete backups older than 7 days
find /opt/backups -mtime +7 -type f -delete