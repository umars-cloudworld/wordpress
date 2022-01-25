output "db_endpoint" {
  value = aws_db_instance.this.endpoint
}

output "db_name" {
  value = aws_db_instance.this.name
}

output "db_username" {
  value = aws_db_instance.this.username
}

output "db_password" {
  value = aws_db_instance.this.password
}

output "db_port" {
  value = aws_db_instance.this.port
}
