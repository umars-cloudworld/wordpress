provider "aws" {
  region = var.region
}

module "vpc" {
  source                   = "./modules/vpc"
  SG_tag                   = var.SG_tag
  cidr                     = var.cidr
  database_route_table_tag = var.database_route_table_tag
  database_subnet_cidr_1   = var.database_subnet_cidr_1
  database_subnet_cidr_2   = var.database_subnet_cidr_2
  database_subnet_tag_1    = var.database_subnet_tag_1
  database_subnet_tag_2    = var.database_subnet_tag_2
  destination_cidr_block   = var.destination_cidr_block
  enable_dns_hostnames     = var.enable_dns_hostnames
  enable_dns_support       = var.enable_dns_support
  enable_ipv6              = false
  igw_tag                  = var.igw_tag
  map_public_ip_on_launch  = false
  public_route_table_tag   = var.public_route_table_tag
  public_subnet_cidr_1     = var.public_subnet_cidr_1
  public_subnet_cidr_2     = var.public_subnet_cidr_2
  public_subnet_tag_1      = var.public_subnet_tag_1
  public_subnet_tag_2      = var.public_subnet_tag_2
  region                   = var.region
  vpc_name                 = var.vpc_name
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds_subnet_group"
  subnet_ids = [module.vpc.database_subnet_1.id, module.vpc.database_subnet_2.id]

  tags = {
    Name = "My DB subnet group"
  }
}

module "database" {
  source               = "./modules/database"
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group
  instance_class       = var.instance_class
  engine               = var.engine
  name                 = var.name
  username             = var.username
  password             = var.password
  skip_final_snapshot  = var.skip_final_snapshot
  apply_immediately    = var.apply_immediately
  allocated_storage    = var.allocated_storage
}
