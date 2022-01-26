provider "aws" {
  region = var.region
}


resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = "t2.micro"
  subnet_id = var.ec2_public_subnet_id
  user_data = var.user_data_template
//  ecs_associate_public_ip_address
  associate_public_ip_address = true
  tags = {
    Name = "Wordpress-server"
  }
}

# Security Group Association
resource "aws_network_interface_sg_attachment" "ec2_sg_attachment" {
  network_interface_id = aws_instance.web.primary_network_interface_id
  security_group_id    = var.ec2_security_group_id
}

