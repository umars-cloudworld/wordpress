terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
#  backend "s3" {
#    bucket = "statefile-bucket-oiufosdjfadhfoiiyuyiu"
#    key    = "state/"
#    region = "us-east-1"
#  }
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
  subnet_ids = [module.vpc.database-subnet-1-id, module.vpc.database-subnet-2-id]

  tags = {
    Name = "My DB subnet group"
  }
}

module "database" {
  region                = var.region
  source                = "./modules/database"
  subnet_group_resource = aws_db_subnet_group.rds_subnet_group.name
  instance_class        = var.instance_class
  engine                = var.engine
  name                  = var.name
  username              = var.username
  password              = var.password
  skip_final_snapshot   = var.skip_final_snapshot
  apply_immediately     = var.apply_immediately
  allocated_storage     = var.allocated_storage
  tags                  = var.tags
  identifier            = var.identifier
  is_encrypted          = var.instance_class == "db.t2.micro" ? false : true
}
module "server" {
  source = "./modules/server"
  ami    = var.ami
  region = var.region
}