#/bin/bash

cd /var/lib/postgresql
cp /vagrant/ssh_postgres.tgz .
tar xf ssh_postgres.tgz
rm ssh_postgres.tgz

# Create repmgr user en database
psql -f /vagrant/create.sql
