provider "aws" {
  region = var.region
}
resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = "t2.micro"
  subnet_id = data.aws_subnet.selected.id
  user_data = <<EOF
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
EOF
//  ecs_associate_public_ip_address
  associate_public_ip_address = true
//  security_group    = data.aws_security_group.selected.id?

tags = {
    Name = "Wordpress-server"
  }
}
