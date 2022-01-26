provider "aws" {
  region = var.region
}
resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = "t2.micro"
  subnet_id = data.aws_subnet.selected.id
  user_data = data.template_file.user_date.rendered
//  ecs_associate_public_ip_address
  associate_public_ip_address = true
//  security_group    = data.aws_security_group.selected.id?

tags = {
    Name = "Wordpress-server"
  }
}
