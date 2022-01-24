variable "region" {
  type = string
}

variable "cidr" {
  description = "Enter the CIDR range required for VPC"
  type        = string
}

variable "enable_dns_hostnames" {
  description = "Enable DNS Hostname"
  type        = bool

}

variable "enable_dns_support" {
  description = "Enable DNS Support"
  type        = bool
}
variable "enable_ipv6" {
  description = "Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC. You cannot specify the range of IP addresses, or the size of the CIDR block."
  type        = bool

}

variable "vpc_name" {
  description = "Tag Name to be assigned with VPC"
  type        = string
}


variable "igw_tag" {
  description = "Mention Tag needs to be associated with internet gateway"
  type        = string

}

variable "public_subnet_cidr_1" {
  description = "Cidr Blocks"
  type        = string
}

variable "public_subnet_cidr_2" {
  description = "Cidr Blocks"
  type        = string

}
variable "public_subnet_tag_1" {
  description = "Tag for public subnet"
  type        = string
}
variable "public_subnet_tag_2" {
  description = "Tag for public subnet"
  type        = string
}
variable "map_public_ip_on_launch" {
  description = "It will map the public ip while launching resources"
  type        = bool

}
variable "database_subnet_cidr_1" {
  description = "mention the CIDR block for database subnet"
  type        = string
}
variable "database_subnet_cidr_2" {
  description = "mention the CIDR block for database subnet"
  type        = string
}


variable "public_route_table_tag" {
  description = "Tag name for public route table"
  type        = string

}
variable "destination_cidr_block" {
  type = string
}
variable "database_route_table_tag" {
  description = "Tage for database route table"
  type        = string

}

variable "database_subnet_tag_1" {
  description = "Tag for Private Subnet"
  type        = string

}
variable "database_subnet_tag_2" {
  description = "Tag for Private Subnet"
  type        = string

}
variable "rules" {
  default = [
    {
      port        = 80
      porto       = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      port        = 443
      porto       = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      port        = 22
      porto       = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}
variable "SG_tag" {
  type = string
}


variable "allocated_storage" {
  description = "The allocated storage in gigabytes"
  type        = number
  default     = null
}

variable "storage_type" {
  description = "One of 'standard' (magnetic), 'gp2' (general purpose SSD), or 'io1' (provisioned IOPS SSD). The default is 'io1' if iops is specified, 'standard' if not. Note that this behaviour is different from the AWS web console, where the default is 'gp2'."
  type        = string
  default     = null
}

variable "storage_encrypted" {
  description = "Specifies whether the DB instance is encrypted"
  type        = bool
  default     = false
}

variable "engine" {
  description = "The database engine to use"
  type        = string
  default     = ""
}

variable "engine_version" {
  description = "The engine version to use"
  type        = string
  default     = null
}

variable "instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
  default     = null
}

variable "name" {
  description = "The DB name to create. If omitted, no database is created initially"
  type        = string
  default     = null
}

variable "username" {
  description = "Username for the master DB user"
  type        = string
  default     = null
}

variable "password" {
  description = "Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file"
  type        = string
  default     = null
}

variable "skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final_snapshot_identifier"
  type        = bool
  default     = false
}

variable "db_subnet_group_name" {
  description = "Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC"
  type        = string
  default     = ""
}

variable "parameter_group_name" {
  description = "Name of the DB parameter group to associate"
  type        = string
  default     = ""
}

variable "availability_zone" {
  description = "The Availability Zone of the RDS instance"
  type        = string
  default     = null
}

variable "publicly_accessible" {
  description = "Bool to control if instance is publicly accessible"
  type        = bool
  default     = false
}

variable "tags" {
  description = "A mapping of tags to assign to all resources"
  type        = map(string)
  default     = {}
}
