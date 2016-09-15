#!/bin/bash

openvassd
echo "Open-VAS Scanner Started..."
openvasmd
echo "Open-VAS Manager Started..."
gsad
echo "Greenbone Security Assistant Started..."
echo "Starting rebuild process..."
echo "This may take some time..."
openvasmd --rebuild
echo -e "\nChecking setup..."
wget https://svn.wald.intevation.org/svn/openvas/trunk/tools/openvas-check-setup --no-check-certificate
chmod 0755 openvas-check-setup
./openvas-check-setup --v8 --server
echo -e "\nWelcome to OpenVAS 8"
echo "Starting infinite loop..."

echo "Press [CTRL+C] to stop.."

while true
do
	sleep 1
done