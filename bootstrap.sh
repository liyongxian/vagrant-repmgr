#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install -y tmux gcc make libxslt-dev libxml2-dev libpam-dev libedit-dev libpq-dev postgresql postgresql-server-dev-9.1



sudo cp /vagrant/hosts /etc/hosts
sudo chmod 644  /etc/hosts
sudo chown root.root  /etc/hosts


# Repmgr setup
mkdir repmgr && cd repmgr/ && wget http://www.repmgr.org/download/repmgr-2.0beta2.tar.gz
tar zxf repmgr-2.0beta2.tar.gz
rm -f zxf repmgr-2.0beta2.tar.gz
cd repmgr-2.0beta2/

# install the PGXS way: 
sudo make USE_PGXS=1
sudo make USE_PGXS=1 install
sudo update-alternatives --install /usr/bin/repmgr repmgr /usr/lib/postgresql/9.1/bin/repmgr 10
sudo update-alternatives --install /usr/bin/repmgrd repmgrd /usr/lib/postgresql/9.1/bin/repmgrd 10

# Test door 
# repmgr --version
# repmgrd --version

sudo cp /vagrant/postgresql.conf /etc/postgresql/9.1/main/postgresql.conf
sudo cp /vagrant/pg_hba.conf /etc/postgresql/9.1/main/pg_hba.conf 
sudo chown postgres.postgres  /etc/postgresql/9.1/main/postgresql.conf
sudo chown postgres.postgres  /etc/postgresql/9.1/main/pg_hba.conf 

sudo chmod 644 /etc/postgresql/9.1/main/postgresql.conf
sudo chmod 640 /etc/postgresql/9.1/main/pg_hba.conf  


sudo -u postgres  -i /vagrant/bootstrap_pg.sh

sudo /etc/init.d/postgresql restart


# Repmgr configuratie
sudo mkdir /etc/repmgr 
sudo chmod 755 /etc/repmgr/ 
sudo chown postgres.postgres /etc/repmgr

sudo cp /vagrant/repmgr.conf /etc/repmgr/
sudo chmod 644 /etc/repmgr/repmgr.conf 
sudo chown postgres.postgres /etc/repmgr/repmgr.conf
