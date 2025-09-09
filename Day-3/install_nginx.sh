#!/bin/bash

sudo apt update -y
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
echo "<h1> Terraform In One shot by TWS, Nginx has been installed successfully </h1>" > /var/www/html/index.html
sudo systemctl restart nginx