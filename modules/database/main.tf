provider "aws" {
  region = var.region
}

resource "aws_db_instance" "this" {
  allocated_storage    = var.allocated_storage
  db_subnet_group_name = var.subnet_group_resource
  engine               = var.engine
  instance_class       = var.instance_class
  name                 = var.name
  username             = var.username
  password             = var.password
  skip_final_snapshot  = var.skip_final_snapshot
  apply_immediately    = var.apply_immediately
  tags                 = var.tags
}
