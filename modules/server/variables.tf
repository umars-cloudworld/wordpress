variable "region" {
  type = string
}
variable "ami" {
  type = string
}
variable "ec2_public_subnet_id" {
  type = string
}

variable "ec2_security_group_id" {
  type = string
}
variable "user_data_template" {}
//variable "map_public_ip_on_launch" {
//  type = string
//}