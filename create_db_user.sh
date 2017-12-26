#!/bin/bash

echo "Please enter root user MySQL password!"
read rootpasswd

echo "Please enter User Name"
read username

echo "Please enter Schema name"
read schemaname

PASSWDDB="$(openssl rand -base64 16)"

mysql -uroot -p${rootpasswd} -e "CREATE DATABASE ${schemaname};"
mysql -uroot -p${rootpasswd} -e "CREATE USER '"${username}"'@'localhost' IDENTIFIED BY '"${PASSWDDB}"';"
mysql -uroot -p${rootpasswd} -e "GRANT ALL PRIVILEGES ON ${schemaname}.* TO '"${username}"'@'localhost';"

echo
echo "----- Success -----"
echo
echo "Schema Name:   $schemaname" 
echo "User Name:     $username" 
echo "User Password: $PASSWDDB" 
echo -e "Schema Name:   $schemaname" >> ./db.txt
echo -e "User Name:     $username" >> ./db.txt 
echo -e "User Password: $PASSWDDB" >> ./db.txt
echo
echo "----- END -----"
echo
echo
