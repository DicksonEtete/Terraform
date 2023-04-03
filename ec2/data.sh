#!/bin/bash
yum update -y
yum install httpd -y
service httpd start
chkconfig httpd on
cd /var/www/html && touch index.html
echo "<html><body>Up and running!</body></html>" > index.html