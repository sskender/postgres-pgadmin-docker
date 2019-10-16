FROM postgres:alpine

# init settings and data
COPY initdb.sh /docker-entrypoint-initdb.d/initdb.sh
RUN chmod +x /docker-entrypoint-initdb.d/initdb.sh

# copy data to restore
COPY restore/* /docker-entrypoint-initdb.d/

# backup script
RUN mkdir -p /opt/backups
COPY ./pgbackup.sh /opt/pgbackup.sh
RUN chmod +x /opt/pgbackup.sh

# volume for backups
VOLUME ["/opt/backups"]