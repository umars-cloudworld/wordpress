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
}

variable "region" {
  type = string
}

variable "subnet_group_resource" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "identifier" {
  type = string
}

variable "is_encrypted" {
  type = bool
}