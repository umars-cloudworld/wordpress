resource "aws_db_instance" "this" {
  db_subnet_group_name   = var.db_subnet_group_name
  vpc_security_group_ids = var.vpc_security_group_ids
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class

  name                = var.name
  username            = var.username
  password            = var.password
  skip_final_snapshot = var.skip_final_snapshot
  apply_immediately   = var.apply_immediately

  availability_zone   = var.availability_zone
  iops                = var.iops
  publicly_accessible = var.publicly_accessible
  allocated_storage   = var.allocated_storage
  storage_encrypted   = var.storage_encrypted

  tags = var.tags
}
