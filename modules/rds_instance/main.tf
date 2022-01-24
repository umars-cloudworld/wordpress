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

resource "aws_db_instance" "default" {
  engine         = var.engine
  engine_version = var.engine_version
  instance_class = var.instance_class

  name                = var.name
  username            = var.username
  password            = var.password
  skip_final_snapshot = var.skip_final_snapshot
  apply_immediately   = var.apply_immediately

  availability_zone   = var.availability_zone
  publicly_accessible = var.publicly_accessible
  allocated_storage   = var.allocated_storage
  storage_encrypted   = var.storage_encrypted

  tags = var.tags
}
