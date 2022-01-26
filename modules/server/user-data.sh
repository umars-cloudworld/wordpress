#!/bin/bash
sudo yum update -y
yum install httpd php php-mysql -y
sudo wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
cp -r wordpress/* /var/www/html
rm -rf wordpress
rm -rf latest.tar.gz
chmod -R 755 wp-content
chown -R apache:apache wp-content
chkconfig httpd on
systemctl enable apache2
service httpd start