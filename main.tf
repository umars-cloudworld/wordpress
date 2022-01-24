terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

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
  enable_ipv6              = var.enable_ipv6
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


resource "db_subnet_group_name" "db_subnets" {
  name        = "db_subnets"
  subnet_ids  = [module.vpc.database-subnet-1-id, module.vpc.database-subnet-2-id]
  description = "Subnet group for RDS database"
  tags = {
    Name = "db_subnets"
  }
}

module "db_instance" {
  source               = "./modules/rds_instance"
  db_subnet_group_name = db_subnet_group_name.db_subnets
  instance_class       = var.instance_class

  name                = var.name
  username            = var.username
  password            = var.password
  skip_final_snapshot = var.skip_final_snapshot
  apply_immediately   = var.apply_immediately

  availability_zone   = module.vpc.database-subnet-1-az
  publicly_accessible = var.publicly_accessible
  allocated_storage   = var.allocated_storage
  storage_encrypted   = var.storage_encrypted

  tags = var.tags
}
