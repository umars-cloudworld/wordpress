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
  enable_dns_hostnames     = false
  enable_dns_support       = false
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