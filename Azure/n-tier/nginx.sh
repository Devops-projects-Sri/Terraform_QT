#!/bin/bash

sudo apt update
sudo apt install nginx -y
sudo apt install openjdk-17-jdk -y
sudo cp /tmp/index.html /var/www/html/index.html