data "aws_subnet" "selected" {
  filter {
    name   = "tag:Name"
    values = ["public_subnet_1a"]
  }
}

data "template_file" "user_date"{
  template = "./user-data.sh"
}

data "aws_security_group" "selected" {
  filter {
    name   = "tag:Name"
    values = ["Security Group"]
  }
}