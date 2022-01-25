output "db_port" {
  value = module.database.db_port
}

output "db_endpoint" {
  description = "Database Endpoint"
  value       = module.database.db_endpoint
}
