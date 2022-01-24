output "web-vpc-id" {
  description = "Main web-vpc ID"
  value       = aws_vpc.web-vpc.id
}

output "web-vpc-cidr-block" {
  value = aws_vpc.web-vpc.cidr_block
}

output "public-subnet-1-id" {
  description = "Subnet ID of public_subnet_1"
  value       = aws_subnet.public_subnet_1.id
}

output "public-subnet-2-id" {
  description = "Subnet ID of public_subnet_1"
  value       = aws_subnet.public_subnet_2.id
}

output "database-subnet-1-id" {
  description = "Subnet-1 ID of our database subnet"
  value       = aws_subnet.database_subnet_1.id
}

output "database-subnet-2-id" {
  description = "Subnet-2 ID of our database subnet"
  value       = aws_subnet.database_subnet_2.id
}

output "web-sg-id" {
  description = "web-sg Security Group ID"
  value       = aws_security_group.web-sg.id
}

output "database-subnet-1-az" {
  value = aws_subnet.database_subnet_1.availability_zone
}
