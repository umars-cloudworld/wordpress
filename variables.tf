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
  type = number
}

variable "engine" {
  type = string
}

variable "instance_class" {
  type = string
}

variable "name" {
  type = string
}

variable "username" {
  type = string
}

variable "password" {
  type = string
}

variable "skip_final_snapshot" {
  type = bool
}

variable "apply_immediately" {
  type = bool
  default = false
}

variable "tags" {
  type = map(string)
}