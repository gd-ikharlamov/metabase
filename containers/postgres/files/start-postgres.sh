#!/bin/bash
if [ -f "/var/lib/pgsql/$POSTGRES_VERSION/data/postgresql.conf" ];
    then
        echo "================"
        echo "Starting postgres"
        echo "================"
        su postgres -c "/usr/pgsql-$POSTGRES_VERSION/bin/pg_ctl start -D /var/lib/pgsql/$POSTGRES_VERSION/data/ -w -t 300" &
        wait $!
        su postgres -c "tailf /var/lib/pgsql/$POSTGRES_VERSION/data/pg_log/*.log"
    else
        echo "================"
        echo "Init DB"
        echo "================"
        /usr/pgsql-$POSTGRES_VERSION/bin/postgresql${POSTGRES_VERSION//.}-setup initdb
        printf "local   all all         peer\nhost    all all 0.0.0.0/0 md5\n" > /var/lib/pgsql/$POSTGRES_VERSION/data/pg_hba.conf
        sed "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" -i /var/lib/pgsql/$POSTGRES_VERSION/data/postgresql.conf
        sed "s/#port = 5432/port = 5432/g" -i /var/lib/pgsql/$POSTGRES_VERSION/data/postgresql.conf
        chown postgres:postgres /var/lib/pgsql/$POSTGRES_VERSION/data/
        echo "================"
        echo "Starting postgres"
        echo "================"
        su postgres -c "/usr/pgsql-$POSTGRES_VERSION/bin/pg_ctl start -D /var/lib/pgsql/$POSTGRES_VERSION/data/ -w -t 300" &
        wait $!
        su postgres -c "tailf /var/lib/pgsql/$POSTGRES_VERSION/data/pg_log/*.log"
fi
