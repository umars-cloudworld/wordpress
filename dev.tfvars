region                   = "us-east-1"
cidr                     = "10.0.0.0/16"
enable_dns_hostnames     = true
enable_dns_support       = true
enable_ipv6              = null
vpc_name                 = "Web-VPC"
igw_tag                  = "My-IGW"
public_subnet_cidr_1     = "10.0.0.0/24"
public_subnet_cidr_2     = "10.0.1.0/24"
public_subnet_tag_1      = "public_subnet_1a"
public_subnet_tag_2      = "public_subnet_1b"
map_public_ip_on_launch  = false
database_subnet_cidr_1   = "10.0.5.0/24"
database_subnet_cidr_2   = "10.0.6.0/24"
database_subnet_tag_1    = "database_subnet_1a"
database_subnet_tag_2    = "database_subnet_1b"
public_route_table_tag   = "MyWebRouteTable"
destination_cidr_block   = "0.0.0.0/0"
database_route_table_tag = "MyDatabaseRouteTable"
SG_tag                   = "Security Group"


# Database parameters
identifier          = "wordpress-database"
skip_final_snapshot = false
instance_class      = "db.t2.micro"
engine              = "mysql"
name                = "wordpress_db"
username            = "wordpress_db"
password            = "wordpress_db"
apply_immediately   = true
allocated_storage   = 20
tags = {
  Name = "wordpress-database"
}
