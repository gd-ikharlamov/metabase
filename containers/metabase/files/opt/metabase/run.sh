#!/bin/env bash

## configure jetty
export MB_EMOJI_IN_LOGS="false"
export MB_JETTY_PORT=3000
export MB_JETTY_HOST=0.0.0.0

## db connection encryption
# MB_ENCRYPTION_SECRET_KEY=$(openssl rand -base64 32)

## db config
# export MB_DB_TYPE=postgres
# export MB_DB_DBNAME=metabase
# export MB_DB_PORT=5432
# export MB_DB_USER=<username>
# export MB_DB_PASS=<password>
# export MB_DB_HOST=localhost

## metabase migrate from h2 to db
# java -jar /opt/metabase/metabase.jar load-from-h2

## set metabase h2 db location
export MB_DB_FILE=/opt/metabase/metabase.db

## set timezone
# export JAVA_TIMEZONE=US/Pacific

## Java options
JAVA_OPTS="$JAVA_OPTS -Xmx1024m"
## Don't barf if we see an option we don't understand (e.g. Java 9 option on Java 7/8)
JAVA_OPTS="$JAVA_OPTS -XX:+IgnoreUnrecognizedVMOptions"
## don't try to start AWT. Not sure this does anything but better safe than wasting memory
JAVA_OPTS="$JAVA_OPTS -Djava.awt.headless=true"
## Use UTF-8
JAVA_OPTS="$JAVA_OPTS -Dfile.encoding=UTF-8"

#start metabase
java $JAVA_OPTS -jar /opt/metabase/metabase.jar
