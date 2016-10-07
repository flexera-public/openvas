#!/bin/bash

echo "Starting setup..."
ldconfig
openvas-mkcert -q
echo "Performing NVT sync..." 
openvas-nvt-sync > /dev/null
openvassd
openvas-mkcert-client -n -i
echo "Rebuilding openvasmd db..."
openvasmd --rebuild --progress > /dev/null 
echo "Skipping SCAP sync..."
#openvas-scapdata-sync  
echo "Performing CERT sync..."
openvas-certdata-sync > /dev/null 

# ensure redis server is started
service redis-server start

echo "Creating Admin user..."
openvasmd --create-user=admin --role=Admin
echo "Setting Admin user password..."
openvasmd --user=admin --new-password=openvas
echo "OpenVAS 8 Setup Complete.  Waiting for Docker to finish build..."
