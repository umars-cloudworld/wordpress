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

#VPC Creation
resource "aws_vpc" "web-vpc" {
  cidr_block           = var.cidr
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  tags = {
    Name = var.vpc_name
  }
}
#Internet Gateway Creation and Attachment to VPC
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.web-vpc.id

  tags = {
    Name = var.igw_tag
  }
}
#Public Subnet_1
resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.web-vpc.id
  cidr_block              = var.public_subnet_cidr_1
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Name = var.public_subnet_tag_1
  }
}
#Public Subnet_2
resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.web-vpc.id
  cidr_block              = var.public_subnet_cidr_2
  availability_zone       = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Name = var.public_subnet_tag_2
  }
}
#Database/private Subnet_1
resource "aws_subnet" "database_subnet_1" {
  vpc_id                  = aws_vpc.web-vpc.id
  cidr_block              = var.database_subnet_cidr_1
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = var.map_public_ip_on_launch


  tags = {
    Name = var.database_subnet_tag_1
  }
}
#Database/private Subnet_2
resource "aws_subnet" "database_subnet_2" {
  vpc_id                  = aws_vpc.web-vpc.id
  cidr_block              = var.database_subnet_cidr_2
  availability_zone       = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch = var.map_public_ip_on_launch


  tags = {
    Name = var.database_subnet_tag_2
  }
}
############################### Public Route Table #######################################

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.web-vpc.id
  tags = {
    Name = var.public_route_table_tag
  }
}
############################### Database Route Table #######################################

resource "aws_route_table" "database_route_table" {
  vpc_id = aws_vpc.web-vpc.id
  tags = {
    Name = var.database_route_table_tag
  }
}
############################### Routes with IGW #######################################

resource "aws_route" "public_internet_gateway" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = var.destination_cidr_block
  gateway_id             = aws_internet_gateway.my_igw.id
  depends_on             = [aws_route_table.public_route_table]
}

############################### Public Subnet Association #######################################
resource "aws_route_table_association" "public_route_table_association_1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_route_table.id
}
resource "aws_route_table_association" "public_route_table_association_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_route_table.id
}
############################### Database Subnet Association #######################################
resource "aws_route_table_association" "database_route_table_association_1" {
  subnet_id      = aws_subnet.database_subnet_1.id
  route_table_id = aws_route_table.database_route_table.id
}
resource "aws_route_table_association" "database_route_table_association_2" {
  subnet_id      = aws_subnet.database_subnet_2.id
  route_table_id = aws_route_table.database_route_table.id
}

resource "aws_security_group" "web-sg" {
  name        = "web-sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.web-vpc.id

  dynamic "ingress" {
    for_each = var.rules
    content {
      from_port   = ingress.value["port"]
      to_port     = ingress.value["port"]
      protocol    = ingress.value["porto"]
      cidr_blocks = ingress.value["cidr_blocks"]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = var.SG_tag
  }
}
