#!/usr/bin/env bash

DB_USER="root"
DB_PASS="yellow"

mysql -u"$DB_USER" -p"$DB_PASS" < DropAndCreateSchema.sql
mysql -u"$DB_USER" -p"$DB_PASS" < CreateTables.sql
mysql -u"$DB_USER" -p"$DB_PASS" < InsertSampleData.sql