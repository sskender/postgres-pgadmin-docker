# postgres and pgadmin in docker

## What is this

A docker compose file for painless setup of postgresql and pgadmin panel. Run docker compose and navigate to [localhost:8080](http://localhost:8080) in your browser. Thats it!

## How to use this

#### Before running

First edit default login credentials. Change email and password combo for [pgadmin](pgadmin.env) and user and password combo for [postgres](postgres.env). If you don't care about this you can leave the default values.

If you already have sql or previous database dump that you want this database to populate with, simply copy it to [mockdata](mockdata/) folder. Supported files are .sh, .sql and .sql.gz. Mockdata folder comes with one default table. If you don't want it in your database just delete mock_person.sql file.

#### Running

```bash
docker-compose up -d    # start
docker-compose down     # stop
```

Open browser and navigate to [localhost:8080](http://localhost:8080). Default values for pgadmin login are *mail@example.com* and *password123*. When adding a new server use *postgres* as host, port is default *5432*. *user* and *strongpassword* are login credentials. If you changed these values, use those instead.
