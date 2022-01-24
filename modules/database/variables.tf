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

variable "subnet_group_name" {
  type = any
}

variable "region" {
  type = string
}
