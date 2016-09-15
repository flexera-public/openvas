#!/bin/bash

echo "Starting setup..."
ldconfig
openvas-mkcert -q
openvas-nvt-sync
openvassd
openvas-mkcert-client -n -i
openvasmd --rebuild --progress
openvas-scapdata-sync
openvas-certdata-sync

# ensure redis server is started
service redis-server start

echo "Creating Admin user..."
openvasmd --create-user=admin --role=Admin
echo "Setting Admin user password..."
openvasmd --user=admin --new-password=openvas
openvasmd --rebuild --progress


echo "Finishing setup...this may take a while..."