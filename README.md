# PostgreSQL and pgAdmin in Docker

## What is this

A docker compose file for painless setup of postgresql and pgadmin panel. It can be used both for testing purposes and a light production environment. Run docker compose and navigate to [localhost:8080](http://localhost:8080) in your browser. Thats it!

## How to use this

#### Login

First edit default login credentials. Change email and password combo for [pgadmin](pgadmin.env) and user and password combo for [postgres](postgres.env). If you don't care about this you can leave the default values.

#### Restoring databases

If you already have sql script or previous database dump that you want this database to populate with, simply copy it to [restore](postgres/restore/) folder. Supported files are .sh, .sql and .sql.gz. Restore folder comes with one default table. If you don't want it in your database just delete the mock_person.sql file.

#### Backup

Postgres image comes shipped with backup script [pgbackup.sh](postgres/pgbackup.sh). Script creates backup of each present database and saves it to /opt/backups folder.
To run the script execute:
```bash
docker-compose exec postgres /opt/./pgbackup.sh
```

#### Production

System settings are changed to match common production server specifications, optimized for machines with 2 CPU cores and 4 GB of RAM running on SSD storage. Also, a new user called *sampleuser* is created with password *samplepassword*. In addition, *samledb* database is created. Its security policy is configured so that it can be interacted with only by *sampleuser*. Feel free to play with [this file](postgres/initdb.sh) for your machine.

#### Volumes

The following volumes are created:
 - db : stores postgres data
 - bkpdb : stores backups created by backup script
 - pg : pgadmin data

#### Running

```bash
docker-compose up -d    # start
docker-compose down     # stop
```

Open browser and navigate to [localhost:8080](http://localhost:8080). Default values for pgadmin login are *postgres@example.com* and *strongpassword*. When adding a new server use *postgres* as host, default port is *5432*. Login credentials are *postgres* and *strongpassword*. If you changed these values, use those instead.
