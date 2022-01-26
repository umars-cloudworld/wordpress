output "db_port" {
  value = module.database.db_port
}

output "db_endpoint" {
  description = "Database Endpoint"
  value       = module.database.db_endpoint
}
output "db_name" {
  description = "Database Name"
  value       = module.database.db_name
}
output "db_username" {
  description = "Database Username"
  value       = module.database.db_username
}
output "db_password" {
  description = "Database Password"
  value = module.database.db_password
  sensitive = true
}
output "public_ip" {
  description = "Public IP:"
  value       = module.server.public_ip
}